import 'event_model.dart';

class HomeModel {
  List<EventModel> events = [
    EventModel(
      name: "Zenei fesztivál",
      city: "New York",
      category: "Zene",
      date: DateTime(2023, 8, 5, 12, 0),
      image: "assets/imgs/new_york_fest.jpg",
      stuffLimit: 1000,
      description: "asd",
    ),
    EventModel(
      name: "Művészeti kiállítás",
      city: "Párizs",
      category: "Művészet",
      date: DateTime(2023, 9, 15, 10, 30),
      image: "assets/imgs/art.jpg",
      stuffLimit: 200,
      description: "asdasd",
    ),
    EventModel(
      name: "Palacsinta fesztivál",
      city: "Szolnok",
      category: "Gasztronómia",
      date: DateTime(2023, 11, 8, 9, 0),
      image: "assets/imgs/palacsinta.jpg",
      stuffLimit: 300,
      description: "asd",
    ),
    EventModel(
      name: "Divat bemutató",
      city: "Milanó",
      category: "Divat",
      date: DateTime(2023, 9, 15, 12, 0),
      image: "assets/imgs/fashion.jpg",
      stuffLimit: 200,
      description: "asd",
    ),
    EventModel(
      name: "Campus fesztivál",
      city: "Debrecen",
      category: "Zene",
      date: DateTime(2023, 11, 8, 17, 30),
      image: "assets/imgs/campus.jpg",
      stuffLimit: 300,
      description: "asd",
    ),
  ];



}
