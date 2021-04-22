import 'dart:convert';

class UserModel {
  final double score;
  final String name;
  final String photoURL;

  UserModel({this.score = 0.0, required this.name, required this.photoURL});

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'name': name,
      'photoURL': photoURL,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      score: map['score'],
      name: map['name'],
      photoURL: map['photoURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
