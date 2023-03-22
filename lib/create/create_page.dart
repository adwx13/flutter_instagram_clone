import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/create/create_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final model = CreateModel();
  final _titleTextController = TextEditingController();
  File? _image;
  bool _isLoading = false;


  @override
  void dispose() {
    _titleTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 게시물'),
        actions: [IconButton(onPressed: () async {
          if (_image != null && _titleTextController.text.isNotEmpty) {
            setState(() {
              _isLoading = true;
            });
            await model.uploadPost(_titleTextController.text, _image!);
            setState(() {
              _isLoading = false;
            });
            // 비동기(async)함수에서 화면이살아있다면(mounted)일 때 Navigator.pop이 실행
            if (mounted) {
              Navigator.pop(context);
            }
          }
        }, icon: Icon(Icons.send))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "제목을 입력하세요",
                    fillColor: Colors.white70),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isLoading) CircularProgressIndicator(),
              ElevatedButton(
                  onPressed: () async {
                    //  Image Picker 실행
                    _image = await model.getImage();
                    setState(() {});
                  },
                  child: Text('이미지 선택')),
              if (_image != null)
                Image.file(_image!, width: 300,)
            ],
          ),
        ),
      ),
    );
  }
}
