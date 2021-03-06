part of 'news_feed_bloc.dart';

@immutable
abstract class NewsFeedEvent {}

class NewsFeedLoadingEvent extends NewsFeedEvent {}

class NewsFeedDetailsEvent extends NewsFeedEvent {
  final NewsFeed newsFeed;

  NewsFeedDetailsEvent({required this.newsFeed});
}

class NewsFeedLoadCommentsEvent extends NewsFeedEvent {
  final String newsFeedID;

  NewsFeedLoadCommentsEvent({required this.newsFeedID});
}

class NewsFeedCommentAddedEvent extends NewsFeedEvent {
  final String comment;
  final String newsFeedID;
  NewsFeedCommentAddedEvent({required this.comment, required this.newsFeedID});
}
