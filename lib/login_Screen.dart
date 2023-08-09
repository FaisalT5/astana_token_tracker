
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'admin_side.dart';

class LoginScreen extends StatelessWidget {
  
  final _formkey =GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController =TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  void login(BuildContext context){

    _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text.toString()).
    then((value){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QueueManagementApp()),
      );
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green.shade100, // Set your preferred background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Your logo image goes here
                Image.asset('assets/astana_logo.png', height: 120,),

                SizedBox(height: 25),
                Text("Admin Login",style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,

                ),),
                SizedBox(height: 20),
                // Username and password fields
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Email";
                    }
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Password";
                    }
                  },
                ),

                SizedBox(height: 20),

                // Login button
                ElevatedButton(
                  onPressed: () {
                    // Add your login logic here
                    if(_formkey.currentState!.validate())
                      login(context);

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set your preferred button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('Login'),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
