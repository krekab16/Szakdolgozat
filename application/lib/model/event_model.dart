import 'package:cloud_firestore/cloud_firestore.dart';
import 'event_dto.dart';

class EventModel {
  String name;
  String city;
  String street;
  int houseNumber;
  String category;
  DateTime date;
  String image;
  int stuffLimit;
  String description;
  String id;

  EventModel({
    required this.name,
    required this.city,
    required this.street,
    required this.houseNumber,
    required this.category,
    required this.date,
    required this.image,
    required this.stuffLimit,
    required this.description,
    required this.id,
  });

  factory EventModel.createEmpty() {
    return EventModel(
        name: '',
        city: '',
        street: '',
        houseNumber: 0,
        category: '',
        date: DateTime.now(),
        image: '',
        stuffLimit: 0,
        description: '',
        id: '');
  }

  EventDTO toDTO() {
    return EventDTO(
      name: name,
      city: city,
      street: street,
      houseNumber: houseNumber,
      category: category,
      date: Timestamp.fromDate(date),
      image: image,
      stuffLimit: stuffLimit,
      description: description,
      id: id,
    );
  }

  factory EventModel.fromDTO(EventDTO eventDTO) {
    return EventModel(
      name: eventDTO.name,
      city: eventDTO.city,
      street: eventDTO.street,
      houseNumber: eventDTO.houseNumber,
      category: eventDTO.category,
      date: eventDTO.date.toDate(),
      image: eventDTO.image,
      stuffLimit: eventDTO.stuffLimit,
      description: eventDTO.description,
      id: eventDTO.id,
    );
  }
}
