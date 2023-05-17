import 'package:flutter/material.dart';

class Post {
  String id;
  final String food;
  final String description;
  final String location;
  final String restaurant;
  final String price;

  Post({
    this.id = '',
    required this.food,
    required this.description,
    required this.location,
    required this.restaurant,
    required this.price,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'food': food,
        'description': description,
        'location': location,
        'price': price,
        'restaurant': restaurant,
      };

  static Post fromJson(Map<String, dynamic> json) => Post(
      id: json['id'],
      food: json['food'],
      description: json['description'],
      location: json['location'],
      restaurant: json['restaurant'],
      price: json['price']);
}

Widget buildPost(Post post) => Column(
      children: [
        Text(post.food),
        Text(post.description),
        Text(post.location),
        Text(post.price),
        Text(post.restaurant)
      ],
    );
