import 'package:ecommerce/features/network/models/response/user.dart';

class AuthResponse {
  String? message;
  User? user;
  String? token;

  AuthResponse({this.message, this.user, this.token});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}
