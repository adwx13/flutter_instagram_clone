import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/post.dart';

class SearchModel {
  final Stream<QuerySnapshot<Post>> postsStream =
      FirebaseFirestore.instance.collection('posts').withConverter<Post>(
        fromFirestore: (snapshot, options) {return Post.fromJson(snapshot.data()!);},
        toFirestore: (value, options) {return value.toJson();},
      ).snapshots();
}
