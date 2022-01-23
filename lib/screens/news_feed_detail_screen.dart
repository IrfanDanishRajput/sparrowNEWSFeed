import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sparrow_news_app/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:sparrow_news_app/models/comment_model/comment.dart';
import 'package:sparrow_news_app/models/news_feed_model/news_feed.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';

class NewsFeedDetailScreen extends StatefulWidget {
  final NewsFeed newsFeed;
  NewsFeedDetailScreen({required this.newsFeed});

  @override
  _NewsFeedDetailScreenState createState() => _NewsFeedDetailScreenState();
}

class _NewsFeedDetailScreenState extends State<NewsFeedDetailScreen> {
  late final Stream<List<Comment>> stream;
  late final NewsFeedBloc _newsFeed;
  late final TextEditingController _controller;
  @override
  void initState() {
    _newsFeed = BlocProvider.of<NewsFeedBloc>(context);
    _newsFeed
        .add(NewsFeedLoadCommentsEvent(newsFeedID: widget.newsFeed.documentID));
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _buildAlert(),
        child: const Icon(Icons.comment),
      ),
      appBar: AppBar(
        title: const Text(AppStrings.newsDetails),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(imageUrl: widget.newsFeed.image),
          const SizedBox(
            height: 5,
          ),
          _buildPostDetails(),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: BlocConsumer(
              bloc: _newsFeed,
              listener: (context, state) {
                if (state is NewsFeedCommentsLoadedState) {
                  stream = state.comments;
                }
              },
              builder: (BuildContext context, Object? state) {
                if (state is NewsFeedCommentsLoadedState) {
                  return StreamBuilder(
                      stream: stream,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Comment>> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.data != null) {
                          return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 5,
                                  ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return _buildComment(snapshot.data![index]);
                              });
                        }
                        return const Text(AppStrings.unknownErrorOccurred);
                      });
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Material(
        elevation: 5.0,
        child: ListTile(
          title: Text(comment.comment),
        ),
      ),
    );
  }

  Padding _buildPostDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextRow(
              title: AppStrings.newsFeedHeadline,
              detail: widget.newsFeed.headline),
          const SizedBox(
            height: 10,
          ),
          _buildTextRow(
              title: AppStrings.newsFeedSummary,
              detail: widget.newsFeed.summary),
          const SizedBox(
            height: 10,
          ),
          const Text(
            AppStrings.comments,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  RichText _buildTextRow({required String title, required String detail}) {
    return RichText(
      textDirection: TextDirection.ltr,
      text: TextSpan(
          text: title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
                text: detail,
                style: const TextStyle(fontWeight: FontWeight.normal))
          ]),
    );
  }

  void _buildAlert() {
    Alert(
        context: context,
        title: AppStrings.addAComment,
        content: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                labelText: AppStrings.comment,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              _newsFeed.add(NewsFeedCommentAddedEvent(
                  comment: _controller.value.text,
                  newsFeedID: widget.newsFeed.documentID));
              Navigator.pop(context);
            },
            child: Text(
              AppStrings.comment.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }
}
