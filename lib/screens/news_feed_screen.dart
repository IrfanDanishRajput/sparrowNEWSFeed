import 'package:flutter/material.dart';
import 'package:sparrow_news_app/blocs/news_feed_bloc/news_feed_bloc.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final NewsFeedBloc _newsFeedBloc;

  _NewsFeedScreenState() : _newsFeedBloc = NewsFeedBloc();

  @override
  void initState() {
    _newsFeedBloc.add(NewsFeedLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Home feed'),
    );
  }
}
