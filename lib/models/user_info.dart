class UserInfo {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  UserInfo({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => new UserInfo(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"]);
}
