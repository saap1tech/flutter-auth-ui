import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var id;
  var username;
  var email;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      id = prefs.getInt('id');
      username = prefs.getString('username');
      email = prefs.getString('email');
    });
  }

  void click() async {
    final c_prefs = await SharedPreferences.getInstance();

    c_prefs.setInt('id', 0);
    c_prefs.setString('username', '');
    c_prefs.setString('email', '');
    c_prefs.setString('password', '');

    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Hello $username',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your email is : $email',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'And your id is : $id',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  click();
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
