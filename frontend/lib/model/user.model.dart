class Users {
  Users(
      {this.id,
      this.fistname,
      this.lastname,
      this.email,
      this.password,
      this.role});
  int? id;
  String? fistname;
  String? lastname;
  String? email;
  String? password;
  String? role;

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fistname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = fistname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    return data;
  }
}
