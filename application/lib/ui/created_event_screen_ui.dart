import 'package:flutter/material.dart';
import '../utils/text_strings.dart';

class CreatedEventScreen extends StatefulWidget {
  const CreatedEventScreen({Key? key}) : super(key: key);

  @override
  State<CreatedEventScreen> createState() => _CreatedEventScreenState();
}

class _CreatedEventScreenState extends State<CreatedEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(created);
  }
}
