import 'package:flutter/material.dart';
import '../utils/text_strings.dart';

class ParticipatedEventScreen extends StatefulWidget {
  const ParticipatedEventScreen({Key? key}) : super(key: key);

  @override
  State<ParticipatedEventScreen> createState() =>
      _ParticipatedEventScreenState();
}

class _ParticipatedEventScreenState extends State<ParticipatedEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(participatedEvents);
  }
}
