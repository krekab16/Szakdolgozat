import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../utils/drawer_list.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';
import '../viewmodel/menu_view_model.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final menuViewModel = Provider.of<MenuViewModel>(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColors.lightBlueColor,
            ),
            child:Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat(dateFormat).format(DateTime.now()),
                        style: Styles.dateTimeText,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        menu,
                        style: Styles.menuTextStyles,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
          DrawerList(home, const Icon(Icons.home),
              () => menuViewModel.navigateToHome(context)),
          DrawerList(favourites, const Icon(Icons.favorite),
              () => menuViewModel.navigateToFavourites(context)),
          DrawerList(profile, const Icon(Icons.account_circle),
              () => menuViewModel.navigateToProfile(context)),
          DrawerList(participatedEvents, const Icon(Icons.event_rounded),
              () => menuViewModel.navigateToParticipatedEvent(context)),
          DrawerList(newEvent, const Icon(Icons.fiber_new),
              () => menuViewModel.navigateToNewEvent(context)),
          DrawerList(created, const Icon(Icons.create),
              () => menuViewModel.navigateToCreatedEvent(context)),
          DrawerList(logout, const Icon(Icons.logout),
              () => menuViewModel.logOut(context)),
        ],
      ),
    );
  }
}
