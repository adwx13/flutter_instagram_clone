import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../detail_post/detail_post_page.dart';
import '../../domain/post.dart';
import 'account_model.dart';

class AccountPage extends StatelessWidget {
  final model = AccountModel();

  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone'),
        actions: [
          IconButton(
              onPressed: () {
                model.logout();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(model.getProfileImageUrl()),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.bottomRight,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                  width: 28,
                                  height: 28,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.white,
                                  )),
                              SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    child: Icon(Icons.add),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      model.getNickName(),
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    StreamBuilder<QuerySnapshot<Post>>(
                      stream: model.postsStream,
                      builder: (context, snapshot) {
                        int count = 0;
                        if (snapshot.hasData) {
                          count = snapshot.data!.size;
                        }
                        return Text(
                          '$count',
                          style: TextStyle(fontSize: 18),
                        );
                      }
                    ),
                    Text(
                      '게시물',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '팔로워',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '팔로잉',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
