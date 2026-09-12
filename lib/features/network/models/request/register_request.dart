class RegisterRequest {
  late String name;
  late String email;
  late String password;
  late String rePassword;
  late String phone;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['rePassword'] = rePassword;
    data['phone'] = phone;
    return data;
  }

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    rePassword = json['rePassword'] ?? '';
    phone = json['phone'] ?? '';
  }
}
