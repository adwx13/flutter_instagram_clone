import 'package:firebase_auth/firebase_auth.dart';

class DetailPostModel {
  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '메일 없음';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ?? 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg';
  }
}