import 'dart:async';
import 'dart:convert';
import 'package:flutter_auth_ui/index.dart';
import 'package:flutter_auth_ui/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/API/fetch.dart';
import 'package:flutter_auth_ui/API/authmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var prefs;
  int id = 0;

  @override
  void initState() {
    super.initState();
  }

  void pref() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      id = prefs.getInt('id') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Ui',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: id > 0 ? IndexPage() : LoginPage(),
      initialRoute: id > 0 ? '/' : '/login',
      routes: {
        '/': (context) => IndexPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
/*
class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var _authModel;
  bool loading = true;

  var prefs;

  @override
  void initState() {
    super.initState();
    getM();
  }

  Future<void> getM() async {
    _authModel = await FetchApi.getD();
    setState(() {
      loading = false;
    });

    prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', _authModel.id);
    prefs.setString('username', _authModel.username);
    prefs.setString('email', _authModel.email);
    prefs.setString('password', _authModel.password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: loading ? Text('No user') : Text('Hello ${_authModel.username}'),
    );
  }
}*/
