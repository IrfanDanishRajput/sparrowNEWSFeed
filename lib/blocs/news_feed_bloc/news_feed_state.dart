part of 'news_feed_bloc.dart';

@immutable
abstract class NewsFeedState {}

class NewsFeedInitial extends NewsFeedState {}

class NewsFeedLoadingState extends NewsFeedState {}

class NewsFeedLoadedState extends NewsFeedState {
  final Stream<List<NewsFeed>> newsFeed;

  NewsFeedLoadedState({required this.newsFeed});
}

class NewsFeedFailureState extends NewsFeedState {
  final String message;

  NewsFeedFailureState({required this.message});
}
