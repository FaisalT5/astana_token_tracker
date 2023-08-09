import 'package:flutter/material.dart';
/*
class Token{
  String? key;
  TokenData? tokenData ;
  Token({this.key,this.tokenData});
}

class TokenData{
  String? token;
  TokenData({this.token});
  TokenData.fromJson(Map<dynamic,dynamic> jason){
    token = jason["Token"];
  }
}
 */
class Token{
  String? token;
  Token(
  {this.token,}
      );
  factory Token.fromJson(Map<dynamic, dynamic> json) {
    return Token(
      token: json['Token'],

    );
  }
}