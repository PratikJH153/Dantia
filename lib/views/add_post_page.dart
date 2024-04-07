import 'package:dantia/models/post.dart';
import 'package:dantia/models/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  File? _imageFile;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _submitPost(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final text = _textController.text;
      final imageUrl = _imageFile != null ? 'file://${_imageFile!.path}' : '';

      final newPost = Post(
        user: User(
          name: 'Your Name',
          profilePic: 'https://example.com/profile.jpg',
        ),
        text: text,
        imageUrl: imageUrl,
        timestamp: DateTime.now(),
      );

      // Pass the new post back to the previous page
      Navigator.pop(context, newPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => _submitPost(context),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 5),
                blurRadius: 10,
                spreadRadius: 0.1,
              ),
            ],
            color: Color.fromARGB(255, 255, 171, 25),
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Upload",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black12,
                  ),
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Image.file(
                            _imageFile!,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_search_rounded),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Add image"),
                            ],
                          ),
                        ),
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Write a post...',
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
