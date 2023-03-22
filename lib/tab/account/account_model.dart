import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/post.dart';

class AccountModel {
  final Stream<QuerySnapshot<Post>> postsStream = FirebaseFirestore.instance
      .collection('posts')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .withConverter<Post>(
    fromFirestore: (snapshot, options) {
      return Post.fromJson(snapshot.data()!);
    },
    toFirestore: (value, options) {
      return value.toJson();
    },
  ).snapshots();

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg';
  }
}
