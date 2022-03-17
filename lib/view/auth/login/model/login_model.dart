class LoginModel {
  String? email;
  String? username;
  String? password;
  LoginModel({
    this.email,
    this.username,
    this.password,
  });

  @override
  String toString() =>
      'LoginModel(email: $email, username: $username, password: $password)';
}
