import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class HomeModel {
  final _picker = ImagePicker();

  Future<void> updateProfileImage() async {
    XFile? xfile = await _picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      // 이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('user/${FirebaseAuth.instance.currentUser?.uid}/profile/${DateTime.now().millisecondsSinceEpoch}.png');
      // 이미지 url 을 얻음
      await imageRef.putFile(File(xfile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      // 업데이트
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(downloadUrl);
    }

  }

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