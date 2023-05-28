import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocalUser {
  String id;
  final String email;
  final String name;
  final String userId;
  final String location;
  final List<dynamic> likes;
  final List<dynamic> dislikes;
  final List<dynamic> saved;
  final String pdp;


  LocalUser({
    this.id = '',
    required this.saved,
    required this.pdp,
    required this.likes,
    required this.dislikes,
    required this.email,
    required this.name,
    required this.location,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'saved':saved,
        'email': email,
        'location': location,
        'userId': userId,
        'likes':likes,
        'dislikes':dislikes,
        'photo':pdp
      };

  static LocalUser fromJson(Map<String, dynamic> json) => LocalUser(
        id: json['id'] ?? "",
        pdp: json['photo'] ?? "",
        saved: json['saved'] ?? [],
        likes: json['likes'] ?? [],
        dislikes: json['dislikes'] ?? [],
        name: json['name'] ?? "",
        email: json['email'] ?? "",
        location: json['location'] ?? "",
        userId: json['userId'] ?? "",
      );
}
