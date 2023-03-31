import 'package:application/ui/event_screen_ui.dart';
import 'package:application/ui/home_screen.dart';
import 'package:application/ui/log_in_screen_ui.dart';
import 'package:application/ui/sign_up_screen_ui.dart';
import 'package:application/ui/start_screen_ui.dart';
import 'package:application/utils/route_constants.dart';
import 'package:application/viewmodel/event_view_model.dart';
import 'package:application/viewmodel/home_view_model.dart';
import 'package:application/viewmodel/log_in_screen_view_model.dart';
import 'package:application/viewmodel/sign_up_screen_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/event_model.dart';
import 'model/user_model.dart';

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
        ChangeNotifierProvider(create: (_) => LogInViewModel()),
        ChangeNotifierProvider(create: (_) => EventViewModel()),
        ChangeNotifierProvider(create: (_) => UserModel.createEmpty()),

      ],
      child: MaterialApp(
        title: 'eventify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const StartScreen(),
        routes: {
          startRoute: (context) => const StartScreen(),
          signUpRoute: (context) => const SignUpScreen(),
          logInRoute: (context) => const LogInScreen(),
          homeRoute: (context) => ChangeNotifierProvider(
              create: (context) => HomeViewModel(), child: const HomeScreen()),
          eventRoute: (context) => ChangeNotifierProvider(
              create: (context) => EventViewModel(),
              child: EventScreen(EventModel(
                  name: '',
                  city: '',
                  category: '',
                  date: DateTime.now(),
                  image: '',
                  stuffLimit: 0,
                  description: '', id: ''))),
        },
      ),
    );
  }
}
