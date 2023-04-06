import 'package:application/ui/created_event_screen_ui.dart';
import 'package:application/ui/event_screen_ui.dart';
import 'package:application/ui/favourite_event_screen_ui.dart';
import 'package:application/ui/home_screen.dart';
import 'package:application/ui/log_in_screen_ui.dart';
import 'package:application/ui/new_event_screen_ui.dart';
import 'package:application/ui/participated_event_screen_ui.dart';
import 'package:application/ui/profile_screen_ui.dart';
import 'package:application/ui/sign_up_screen_ui.dart';
import 'package:application/ui/start_screen_ui.dart';
import 'package:application/utils/route_constants.dart';
import 'package:application/utils/text_strings.dart';
import 'package:application/viewmodel/event_view_model.dart';
import 'package:application/viewmodel/home_view_model.dart';
import 'package:application/viewmodel/log_in_screen_view_model.dart';
import 'package:application/viewmodel/menu_view_model.dart';
import 'package:application/viewmodel/sign_up_screen_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/event_model.dart';
import 'model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
      ],
      child: MaterialApp(
        title: appName,
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
              child: EventScreen(EventModel.createEmpty())),
          profileRoute: (context) => const ProfileScreen(),
          newEventRoute: (context) => const NewEventScreen(),
          participatedEventRoute: (context) => const ParticipatedEventScreen(),
          favouriteEventsRoute: (context) => const FavouriteEventScreen(),
          createdEventRoute: (context) => const CreatedEventScreen(),
        },
      ),
    );
  }
}
