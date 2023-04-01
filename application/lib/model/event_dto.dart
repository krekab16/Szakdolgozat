import 'package:cloud_firestore/cloud_firestore.dart';

class EventDTO {
  String name;
  String city;
  String street;
  int houseNumber;
  String category;
  Timestamp date;
  String image;
  int stuffLimit;
  String description;
  String id;

  EventDTO({
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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city': city,
      'category': category,
      'date': date,
      'image': image,
      'stuffLimit': stuffLimit,
      'description': description,
    };
  }

  factory EventDTO.fromJson(
      Map<String, dynamic> json, String imageDownloadUrl, String id) {
    return EventDTO(
      name: json['name'],
      city: json['city'],
      street: json['street'],
      houseNumber: json['houseNumber'],
      category: json['category'],
      date: json['date'],
      image: imageDownloadUrl,
      stuffLimit: json['stuffLimit'],
      description: json['description'],
      id: id,
    );
  }
}
