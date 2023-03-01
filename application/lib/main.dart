import 'package:application/ui/home_screen.dart';
import 'package:application/ui/log_in_screen_ui.dart';
import 'package:application/ui/organizer_home_ui.dart';
import 'package:application/ui/sign_up_screen_ui.dart';
import 'package:application/ui/start_screen_ui.dart';
import 'package:application/utils/route_constants.dart';
import 'package:application/viewmodel/sign_up_screen_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
      ],
      child: MaterialApp(
        title: 'eventify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartScreen(),
        routes: {
          startRoute: (context) => const StartScreen(),
          signUpRoute: (context) => const SignUpScreen(),
          logInRoute: (context) => const LogInScreen(),
          organizerHomeRoute: (context) => const OrganizerHomeScreen(),
          homeRoute: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
