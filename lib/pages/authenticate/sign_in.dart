import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavors_test/services/auth.dart';
import 'package:flavors_test/services/firestore.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  String uid = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Flavor Test'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Sign in'),
              onPressed: () async {
                User? result = await _authService.signInAnon();
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  uid = result.uid;
                  print(result.uid);
                }
              },
            ),
            ElevatedButton(
              child: Text('Add item'),
              onPressed: () async {
                await Database.addItem(
                    uid: uid, title: 'new item', description: 'item ');
              },
            ),
          ],
        ),
      ),
    );
  }
}
