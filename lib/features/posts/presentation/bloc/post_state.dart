// blocs/post_state.dart
import 'package:social_sphere/features/posts/data/models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostAdded extends PostState {}

class PostSuccess extends PostState {
  final List<Post> posts;

  PostSuccess(this.posts);
}

class PostFailure extends PostState {
  final String error;

  PostFailure(this.error);
}
