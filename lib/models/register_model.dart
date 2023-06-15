class RegisterModel {
  final String name;
  final String surname;
  final String email;
  final String password;

  RegisterModel(
      {required this.name,
      required this.surname,
      required this.email,
      required this.password});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password
    };
  }
}
