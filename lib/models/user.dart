class User {
  final String uid;
  final String username;
  final String email;

  User({required this.uid, required this.username, required this.email, });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,

      };

  static User fromJson(Map<String, dynamic> json) =>
      User(
        uid: json['uid'],
        username: json['username'],
        email: json['email']);
}