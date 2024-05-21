import 'package:baulkhos/project/screens/auth_gate.dart';
import 'package:baulkhos/project/screens/camerascreen.dart';
import 'package:baulkhos/project/screens/profile.dart';
import 'package:baulkhos/project/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:baulkhos/project/screens/home.dart';
import 'package:baulkhos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAET',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthGate( ),
      routes: {
        '/search':(context) => SearchScreen(),
        '/profile':(context) => Profilescreen(),
        '/home':(context) => Home(),
        '/camera':(context) => CameraScreen()
      },
      
    );
  }
}


