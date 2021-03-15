import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:connectivity/connectivity.dart';
import 'localtion.dart';
//import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {







  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String nUsername = "";
  String nPassword = "";
  String response = "";

  get string => null;

  Future<List<String>> getTextInputData() async {
    print(emailController);
    print(passwordController);
    String username = emailController.text;
    String password = passwordController.text;

    var url = 'http://182.18.173.26:8080/PMMobileApp/login.php';
    var body = jsonEncode({'user': 'anil', 'pass': 'anil','latitude':'16.767600','longitude':'82.767600'});
    Map<String, String> headers = {"Content-type": "application/json"};
    var response = await post(url , headers: headers , body: body );
    
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    if (response.statusCode == 200) {
     // var bodydata = json.decode(response.body);
      navigateToSubPage(context);
    } else {
      //throw Exception('Failed to load photos');
      navigateTologin(context);
    }

  }
  @override
  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChooseLocation()));
  }
  @override
  Future navigateTologin(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home()));
  }




  @override
  Widget build(BuildContext context) {


    return MaterialApp(
    home: Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Container(

          margin: const EdgeInsets.only(top: 50.0,left: 10.0,right: 10.0,),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/fuglogo.png', width: 100.0, height: 150.0,
            ),
            SizedBox(height: 50.0),

          TextFormField(
        controller: emailController,
            decoration: InputDecoration(
                hintText: 'Email',
              prefixIcon: Icon(Icons.email),
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
            ),
          ),
            SizedBox(height: 10.0),

            TextFormField(

              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
              ),
            ),
            SizedBox(height: 10.0),

            SizedBox(
              width: double.infinity,

              child: RaisedButton(
                color: Colors.lightBlueAccent,
                onPressed: getTextInputData,


                child: Text(
                    'Login',
                    textAlign: TextAlign.center,

                ),
              ),
            )



          ],
        ),
      ),
      ),
    ),
    );
  }
}
