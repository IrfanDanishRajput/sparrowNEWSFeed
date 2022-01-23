import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sparrow_news_app/models/comment_model/comment.dart';
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
    on<NewsFeedDetailsEvent>((event, emit) {
      emit(NewsFeedLoadingState());
      emit(NewsFeedLoadDetailState(newsFeed: event.newsFeed));
    });
    on<NewsFeedLoadCommentsEvent>((event, emit) {
      emit(NewsFeedLoadingState());
      final stream =
          _repository.getNewsFeedComments(newsFeedID: event.newsFeedID);
      emit(NewsFeedCommentsLoadedState(comments: stream));
    });
    on<NewsFeedCommentAddedEvent>((event, emit) async {
      final isCommentAdded =
          await _repository.addAComment(event.comment, event.newsFeedID);
      if (isCommentAdded) {
        emit(NewsFeedCommentAddedState());
      }
    });
  }
}
