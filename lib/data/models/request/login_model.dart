// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String email;
  String password;
  User({
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], password: json['password']);
  }

  @override
  String toString() => 'User(email: $email, password: $password)';

}
