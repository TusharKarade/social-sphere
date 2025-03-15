class User {
  final String username;
  final int userId;

  User({required this.username, required this.userId});

  // Factory constructor to create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      userId: json['userId'],
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userId': userId,
    };
  }
}
