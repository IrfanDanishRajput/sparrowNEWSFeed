import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_feed_event.dart';
part 'news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  NewsFeedBloc() : super(NewsFeedInitial()) {
    on<NewsFeedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
