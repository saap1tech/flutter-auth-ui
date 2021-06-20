import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/API/fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerUserName = TextEditingController();
  final controllerPassword = TextEditingController();

  String _username = '';
  String _password = '';

  var _authModel;
  bool loading = true;

  @override
  void dispose() {
    super.dispose();
    controllerUserName.dispose();
    controllerPassword.dispose();
  }

  void click() {
    setState(() {
      _username = controllerUserName.text;
      _password = controllerPassword.text;
    });

    FocusScope.of(context).unfocus();
    controllerUserName.clear();
    controllerPassword.clear();

    if (_username != '' && _password != '') {
      getUser(_username, _password);
    }
  }

  Future<void> getUser(String username, String password) async {
    try {
      _authModel = await FetchApi.getData(username, password);
    } catch (Exception) {}
    setState(() {
      loading = false;
    });

    final prefs = await SharedPreferences.getInstance();

    try {
      prefs.setInt('id', _authModel.id);
      prefs.setString('username', _authModel.username);
      prefs.setString('email', _authModel.email);
      prefs.setString('password', _authModel.password);

      Navigator.pushNamed(context, '/');
    } catch (Exception) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page', textAlign: TextAlign.center),
      ),
      body: Container(
          child: Column(
        children: [
          TextField(
              controller: controllerUserName,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Type your username:",
              )),
          TextField(
              controller: controllerPassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "Type your password:",
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                click();
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      )),
    );
  }
}
