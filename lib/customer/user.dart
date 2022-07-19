class User {
  int? user_id;

  late String first_name, last_name;

  late String? email;

  String? api_token;

  User(this.first_name, this.last_name, this.email,
      [this.api_token, this.user_id]);

  User.fromJson(Map<String, dynamic> jsonObject) {
    this.user_id = jsonObject['user_id'];
    this.first_name = jsonObject['first_name'];
    this.last_name = jsonObject['last_name'];
    this.api_token = jsonObject['api_token'];
    this.email = jsonObject['email'];
  }
}
