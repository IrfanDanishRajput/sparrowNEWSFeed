import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_feed.freezed.dart';
part 'news_feed.g.dart';

@freezed
class NewsFeed with _$NewsFeed {
  factory NewsFeed({
    required String documentID,
    required int comment,
    required String headline,
    required String summary,
    required String? image,
  }) = _NewsFeed;

  factory NewsFeed.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedFromJson(json);
}
