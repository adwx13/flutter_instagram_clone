import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/post.dart';

class CreateModel {
  final _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      return File(image.path);
    }
  }

  Future<void> uploadPost(String title, File imageFile) async {
    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('postImages/${DateTime.now().millisecondsSinceEpoch}.png');
    // 이미지 url 을 얻음
    await imageRef.putFile(imageFile);
    final downloadUrl = await imageRef.getDownloadURL();
    // 게시물 업로드

    final postsRef =
    FirebaseFirestore.instance.collection('posts').withConverter<Post>(
      fromFirestore: (snapshot, options) {
        return Post.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );

    final newPostRef = postsRef.doc();
    newPostRef.set(Post(
        id: newPostRef.id,
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
        title: title,
        imageUrl:
        downloadUrl));
  }
}
