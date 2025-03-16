import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_sphere/features/posts/data/models/post_model.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Post>> fetchPosts() async {
    final snapshot = await _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => Post.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<bool> addPost(String message) async {
    final user = _auth.currentUser;
    if (user != null) {
      final userData = await _firestore.collection('users').doc(user.uid).get();
      final username = userData['username'];

      final docRef = await _firestore.collection('posts').add({
        'username': username,
        'message': message,
        'timestamp': DateTime.now(),
        'likes': [], // Initialize empty likes list
      });

      final docSnapshot = await docRef.get();
      return docSnapshot.exists;
    }
    return false;
  }

  // Listen to realtime updates
  Stream<List<Post>> listenToPosts() {
    return _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots() // ✅ Listens for real-time updates
        .map((snapshot) => snapshot.docs
            .map((doc) => Post.fromMap(doc.data(), doc.id))
            .toList());
  }

  /// 🔹 **Function to Like or Unlike a Post**
  Future<void> toggleLikePost(String postId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final postRef = _firestore.collection('posts').doc(postId);
    final postSnapshot = await postRef.get();

    if (postSnapshot.exists) {
      List<String> likes =
          List<String>.from(postSnapshot.data()?['likes'] ?? []);

      if (likes.contains(user.uid)) {
        // User already liked, remove like
        likes.remove(user.uid);
      } else {
        // User not liked, add like
        likes.add(user.uid);
      }

      await postRef.update({'likes': likes});
    }
  }
}
