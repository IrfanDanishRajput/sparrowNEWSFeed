import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sparrow_news_app/models/news_feed_model/news_feed.dart';
import 'package:sparrow_news_app/repositories/news_feed_repository.dart';

part 'news_feed_event.dart';
part 'news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  final NewsFeedRepository _repository;
  NewsFeedBloc()
      : _repository = NewsFeedRepository(FirebaseFirestore.instance),
        super(NewsFeedInitial()) {
    on<NewsFeedLoadingEvent>((event, emit) async {
      emit(NewsFeedLoadingState());
      final newsFeed = _repository.getNewsFeed();
      emit(NewsFeedLoadedState(newsFeed: newsFeed));
    });
  }
}
