import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String username;
  final String message;
  final DateTime timestamp;
  final List<String> likes; // Store user IDs who liked the post

  Post({
    required this.id,
    required this.username,
    required this.message,
    required this.timestamp,
    required this.likes,
  });

  factory Post.fromMap(Map<String, dynamic> map, String docId) {
    return Post(
      id: docId,
      username: map['username'] ?? '',
      message: map['message'] ?? '',
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      likes: List<String>.from(
          map['likes'] ?? []), // Convert Firestore list to Dart list
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'message': message,
      'timestamp': timestamp,
      'likes': likes,
    };
  }
}
