import 'package:flutter/material.dart';

import 'home_model.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final model = HomeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Instagram에 오신 것을 환영합니다.',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('사진과 동영상을 보려면 팔로우하세요'),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () async {
                          await model.updateProfileImage();

                          setState(() { });
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              model.getProfileImageUrl()),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      model.getEmail(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(model.getNickName()),
                    SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Image.network(
                          'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Image.network(
                          'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/6g7/image/SdcoupMituNEKiRRBFFIiHgL4dg.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('Facebook 친구'),
                    SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: Text('팔로우')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
