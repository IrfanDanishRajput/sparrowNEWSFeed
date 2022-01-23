import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow_news_app/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:sparrow_news_app/models/news_feed_model/news_feed.dart';
import 'package:sparrow_news_app/ui_components/new_feed_tile.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';
import 'package:sparrow_news_app/utils/routes.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late final NewsFeedBloc _newsFeedBloc;
  late Stream<List<NewsFeed>> stream;

  @override
  void initState() {
    _newsFeedBloc = BlocProvider.of<NewsFeedBloc>(context);
    _newsFeedBloc.add(NewsFeedLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.newsFeed),
      ),
      body: BlocConsumer(
        bloc: _newsFeedBloc,
        listener: (context, state) {
          if (state is NewsFeedLoadedState) {
            stream = state.newsFeed;
          } else if (state is NewsFeedLoadDetailState) {
            Navigator.pushNamed(context, AppRoutes.newsFeedDetailRoute,
                arguments: state.newsFeed);
          }
        },
        builder: (BuildContext context, Object? state) {
          if (state is NewsFeedInitial || state is NewsFeedLoadingState) {
            return const CircularProgressIndicator();
          }
          return StreamBuilder(
              stream: stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<NewsFeed>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data != null) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewFeedTile(newsFeed: snapshot.data![index]);
                      });
                }
                return const Text(AppStrings.unknownErrorOccurred);
              });
        },
      ),
    );
  }
}
