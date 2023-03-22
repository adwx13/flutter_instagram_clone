import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/create/create_page.dart';
import 'package:flutter_instagram_clone/detail_post/detail_post_page.dart';

import '../../domain/post.dart';
import 'search_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> _urls = const [
    'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
    'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
    'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
    'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
    'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
    'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final model = SearchModel();


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreatePage();
          },));
        },
        child: Icon(Icons.create),
      ),
      appBar: AppBar(
        title: Text('Instagram Clone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: StreamBuilder<QuerySnapshot<Post>>(
          stream: model.postsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('알 수 없는 에러');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            List<Post> posts = snapshot.data!.docs.map((post) => post.data()).toList();

            return GridView.builder(
              itemCount: posts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 2.0, crossAxisSpacing: 2.0),
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailPostPage(post: post);
                    },));
                  },
                  child: Hero(
                    tag: post.id,
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
