import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:astana_token_tracker/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';
import 'firebase_model.dart';

class QueueUserScreen extends StatefulWidget {
  @override
  _QueueUserScreenState createState() => _QueueUserScreenState();
}

class _QueueUserScreenState extends State<QueueUserScreen> {
  //int queueNumber = 8; // Replace with the actual queue number received from the backend or any other source
  final auth = FirebaseAuth.instance;

  //final ref = FirebaseDatabase.instance.ref('Token');
  /*
  DatabaseReference dbref = FirebaseDatabase.instance.ref();

// Get the data once
 List<Token> tokenList = [];

 @override
  void initState() {
   super.initState();
    // TODO: implement initState

    //getData();
  }

   */

  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Token');

  // Variable to store the retrieved data
  String data = '';

  // Function to fetch data from the database
  void fetchData() async {
    dynamic snapshot = await _databaseReference.child('Token').get();
    data = snapshot.value.toString();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    }


    @override
    Widget build(BuildContext context) {
      final CountProvider = Provider.of<countProvider>(context, listen: false);
      Future<void> _refreshQueue() async {
        // Simulate a delay for fetching new data or updating the queue number
        await Future.delayed(Duration(seconds: 2));

        // Replace this with your actual data-fetching or data-updating logic
        setState(() {
          CountProvider.count;// Replace this with the actual updated queue number

        });
      }

      return Scaffold(
        //backgroundColor: Colors.green.shade100,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Astana Aliya Patriata Shareef UK',
            style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RefreshIndicator(
              onRefresh: _refreshQueue,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.green.shade100
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "LIVE TOKEN TRACKER",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          height: 200,
                          width: 350,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.black45.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.users,
                                size: 60,
                                color: Colors.green,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Current Token Number',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              /*
                              Text(
                                CountProvider.count.toString(),

                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                               */
                              Expanded(child: FirebaseAnimatedList(
                                query: _databaseReference,

                                itemBuilder: (context,snapshot,animation,index){

                                  return ListTile(
                                    title: Center(
                                      child: Text(snapshot.child('token').value.toString(),style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),),
                                    ),
                                  );
                                },
                              ),),
                          //Text(data,style: TextStyle(color: Colors.red),),
                          ],

                          )
                        ),
                        SizedBox(height: 70),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your login logic here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  // Set your preferred button color
                                  shape: CircleBorder(),
                                  // Make the button circular
                                  padding: EdgeInsets.all(
                                      20.0), // Optional: adjust the button's padding
                                ),
                                child: Icon(Icons
                                    .person_pin,), // Use an icon for the circular button
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
/*
  void getData() {
     dbref.child('Token').onChildAdded.listen((data) {
     Token token = Token.fromJson(data.snapshot.value as Map);
     //Token token = Token(tokenData: tokenData);
     tokenList.add(token);
     setState(() {
     });
   });
  }
  Widget tokenWidget(Token tokenList) {
    if (tokenList.token != null && tokenList.token!= null) {
      return Text(tokenList.token!);
    } else {
      // Handle the case when either tokenData or token is null
      return Text('data not come',style: TextStyle(color: Colors.white),);
    }
  }



 */

  }



