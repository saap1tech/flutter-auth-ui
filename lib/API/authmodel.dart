class AuthModel {
  AuthModel({
    this.id = 0,
    this.password = '',
    this.lastLogin = '',
    this.isSuperuser = false,
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.isStaff = false,
    this.isActive = false,
    this.dateJoined = '',
    this.groups = const [],
    this.userPermissions = const [],
  });

  int id;
  String password;
  var lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  var dateJoined;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };

  @override
  String toString() {
    return 'User {id: $id, username: $username, email: $email, password: $password}';
  }
}
