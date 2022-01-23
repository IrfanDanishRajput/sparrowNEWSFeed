import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sparrow_news_app/models/comment_model/comment.dart';
import 'package:sparrow_news_app/models/news_feed_model/news_feed.dart';
import 'package:sparrow_news_app/utils/firestore_strings.dart';

class NewsFeedRepository {
  final FirebaseFirestore _firestore;

  NewsFeedRepository(this._firestore);

  Stream<List<NewsFeed>> getNewsFeed() {
    try {
      final stream =
          _firestore.collection(FirebaseStrings.collectionNewsFeed).snapshots();
      return stream
          .map((newsFeedsSnapshot) => newsFeedsSnapshot.docs.map((newFeed) {
                final newsFeedData = newFeed.data();
                return NewsFeed.fromJson(newsFeedData);
              }).toList());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Stream<List<Comment>> getNewsFeedComments({required String newsFeedID}) {
    try {
      final stream = _firestore
          .collection(FirebaseStrings.collectionComments)
          .where(FirebaseStrings.newsFeedID, isEqualTo: newsFeedID)
          .snapshots();
      return stream.map((newsFeedCommentsSnapshot) =>
          newsFeedCommentsSnapshot.docs.map((comment) {
            final newsFeedData = comment.data();
            return Comment.fromJson(newsFeedData);
          }).toList());
    } catch (e) {
      if (kDebugMode) {
        print("getNewsFeedComments: $e");
      }
      rethrow;
    }
  }

  Future<bool> addAComment(String comment, String newFeedID) async {
    try {
      final documentReference =
          _firestore.collection(FirebaseStrings.collectionComments).doc();
      final data = {
        FirebaseStrings.comment: comment,
        FirebaseStrings.newsFeedID: newFeedID
      };
      await documentReference.set(data);
      await updateCommentCount(newFeedID);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('NewsFeedRepository | addAComment:  $e');
      }
      rethrow;
    }
  }

  Future<void> updateCommentCount(String newsFeedID) async {
    final documentReference = _firestore
        .collection(FirebaseStrings.collectionNewsFeed)
        .doc(newsFeedID);
    final document = await documentReference.get();
    final documentData = document.data();
    int commentCount = documentData![FirebaseStrings.comments] as int;
    commentCount++;
    await documentReference
        .set({FirebaseStrings.comments: commentCount}, SetOptions(merge: true));
  }
}
