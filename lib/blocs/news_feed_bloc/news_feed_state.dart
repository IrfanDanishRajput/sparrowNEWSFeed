part of 'news_feed_bloc.dart';

@immutable
abstract class NewsFeedState {}

class NewsFeedInitial extends NewsFeedState {}

class NewsFeedLoadingState extends NewsFeedState {}

class NewsFeedLoadedState extends NewsFeedState {}

class NewsFeedFailureState extends NewsFeedState {
  final String message;

  NewsFeedFailureState({required this.message});
}
