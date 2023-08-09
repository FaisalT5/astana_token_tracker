import 'package:astana_token_tracker/count_provider.dart';
import 'package:astana_token_tracker/splash_Screen.dart';
import 'package:astana_token_tracker/user_side.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'admin_side.dart';
import 'login_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(main_screen());
}
class main_screen extends StatelessWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => countProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      //QueueUserScreen(),
      //QueueManagementApp(),
      MyApp(),
      //LoginScreen(),
    ),
    );

  }
}
