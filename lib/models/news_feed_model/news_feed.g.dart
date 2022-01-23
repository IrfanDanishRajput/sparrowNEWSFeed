// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsFeed _$$_NewsFeedFromJson(Map<String, dynamic> json) => _$_NewsFeed(
      documentID: json['documentID'] as String,
      comment: json['comment'] as int,
      headline: json['headline'] as String,
      summary: json['summary'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_NewsFeedToJson(_$_NewsFeed instance) =>
    <String, dynamic>{
      'documentID': instance.documentID,
      'comment': instance.comment,
      'headline': instance.headline,
      'summary': instance.summary,
      'image': instance.image,
    };
