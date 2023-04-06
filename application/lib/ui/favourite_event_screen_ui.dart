import 'package:flutter/material.dart';
import '../utils/text_strings.dart';

class FavouriteEventScreen extends StatefulWidget {
  const FavouriteEventScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteEventScreen> createState() => _FavouriteEventScreenState();
}

class _FavouriteEventScreenState extends State<FavouriteEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(favourites);
  }
}
