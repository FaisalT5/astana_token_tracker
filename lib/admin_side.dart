import 'package:astana_token_tracker/count_provider.dart';
import 'package:astana_token_tracker/user_side.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'count_provider.dart';
DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('Token');

class QueueManagementApp extends StatefulWidget {

  @override
  _QueueManagementAppState createState() => _QueueManagementAppState();
}

class _QueueManagementAppState extends State<QueueManagementApp> {

  int queueNumber = 0;
  final tokenController = TextEditingController();
  final dataseRed = FirebaseDatabase.instance.ref("Token");
/*
  void _UserScreen() {
    setState(() {
      queueNumber;
    });
  }
  void _incrementQueue() {
    setState(() {
      queueNumber++;
    });
  }

  void _resetQueue() {
    setState(() {
      queueNumber = 0;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    final CountProvider = Provider.of<countProvider>(context,listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          // Perform any additional actions you want before popping the screen
          // For example, you can navigate back to the first page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => QueueUserScreen()),
          );
          return false; // Return true to allow popping the screen
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Astana Aliya Patriata Shareef UK'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TOKEN TRACKER",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),),
                  SizedBox(height: 50.0,),
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [

                        FaIcon(
                          FontAwesomeIcons.users,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Token Number:',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),

                        Consumer<countProvider>(builder: (context, value, child,){
                          return Text(
                            CountProvider.count.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },),

                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        onPressed:(){
                          CountProvider.setCount();
                          dataseRed.child("1").set({
                            'token' : CountProvider.count.toString(),
                          });
                        },
                        child: Text('Increment Token'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: (){
                          CountProvider.dectCount();
                          dataseRed.child("1").set({
                            'token' : CountProvider.count.toString(),
                          });
                        },
                        child: Text('Decrement Token'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue
                          ,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 290, // <-- Your width
                        height: 30, // <-- Your height
                        child: ElevatedButton(
                          onPressed: (){
                            CountProvider.resetCount();
                            dataseRed.child("1").set({
                              'token' : CountProvider.count.toString(),
                            });
                          },
                          child: Text('Reset Token'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red
                            ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );

  }

}
