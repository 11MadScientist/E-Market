import 'package:flutter/cupertino.dart';

class Profile
{
  final int id;
  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String phonenumber;
  final String address;
  final String usertype;


  Profile({
    @required this.id,
    @required this.firstname,
    @required this.lastname,
    @required this.password,
    @required this.email,
    @required this.phonenumber,
    @required this.address,
    @required this.usertype,
});

  factory Profile.fromJson(Map<String, dynamic> json)
  {
    return Profile(
      id         :json['data']['id'] as int,
      firstname  :json['data']['firstname'] as String,
      lastname   :json['data']['lastname'] as String,
      password   :json['data']['password'] as String,
      email      :json['data']['email'] as String,
      phonenumber:json['data']['phonenumber'],
      address    :json['data']['address'],
      usertype   :json['data']['usertype'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
    "firstname"   : firstname,
    "lastname"    : lastname,
    "email"       : email,
    "phonenumber" : phonenumber,
    "address"     : address,
    "usertype"    : usertype,
  };
}