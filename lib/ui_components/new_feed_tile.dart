import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparrow_news_app/blocs/news_feed_bloc/news_feed_bloc.dart';
import 'package:sparrow_news_app/models/news_feed_model/news_feed.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';

class NewFeedTile extends StatelessWidget {
  final NewsFeed newsFeed;

  const NewFeedTile({Key? key, required this.newsFeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final _bloc = BlocProvider.of<NewsFeedBloc>(context);
        _bloc.add(NewsFeedDetailsEvent(newsFeed: newsFeed));
      },
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: newsFeed.image),
              const SizedBox(
                height: 10,
              ),
              Text(
                newsFeed.headline,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.numberOfCommentsOnNEWSFeed + '${newsFeed.comments}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
