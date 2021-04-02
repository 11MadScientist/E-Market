import 'package:flutter/cupertino.dart';

class Profile
{
  final int id;
  final String firstname;
  final String lastname;
  final String email;

  Profile({
    @required this.id,
    @required this.firstname,
    @required this.lastname,
    @required this.email,
});

  factory Profile.fromJson(Map<String, dynamic> json)
  {
    return Profile(
      id        :json['data']['id'] as int,
      firstname :json['data']['firstname'] as String,
      lastname  :json['data']['lastname'] as String,
      email     :json['data']['email'] as String,
    );
  }
}