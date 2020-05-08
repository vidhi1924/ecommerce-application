import 'package:ecommerce/utils/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() { 
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FashApp'),
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60.0),
              Text("Login", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
                color: Colors.red,
              ),),
              const SizedBox(height: 60.0),
              ButtonTheme(
                buttonColor: Colors.grey[300],
                minWidth: 1000.0,
                height: 60.0,
                child: RaisedButton(child: Text("Login with Google",
                style: TextStyle(fontSize: 16.0),),
                // color: Colors.red,
                onPressed: () async {
                  bool res = await AuthProvider().loginWithGoogle();
                  if(!res)
                    print("Error logging in with Google");
                },),
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter email"
                ),
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter password"
                ),
              ),
              const SizedBox(height: 70.0),
              ButtonTheme(
                buttonColor: Colors.grey[300],
                minWidth: 1000.0,
                height: 60.0,
                child: RaisedButton(
                  child: Text("Login",
                  style: TextStyle(fontSize: 16),
                  ),
                  onPressed: ()async {
                    if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                      print("Email and password cannot be empty");
                      return;
                    }
                    bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                    print(res);
                    if(!res){
                      print("Login failed");
                    }
                  },
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}

 