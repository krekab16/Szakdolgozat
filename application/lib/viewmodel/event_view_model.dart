import 'package:flutter/widgets.dart';

class EventViewModel with ChangeNotifier {

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

}
