import 'package:cloud_firestore/cloud_firestore.dart';
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
      print(e);
      rethrow;
    }
  }
}
