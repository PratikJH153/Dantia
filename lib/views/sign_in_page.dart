import 'package:dantia/views/home.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => HomePage())),
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
                "Sign in",
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
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Let\'s start with your details',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                labelText: 'Full name',
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 20,
                  bottom: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(21),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 10,
                  top: 20,
                  bottom: 20,
                ),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(21),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
