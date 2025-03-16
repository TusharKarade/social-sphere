// blocs/post_event.dart
abstract class PostEvent {}

class FetchPostsEvent extends PostEvent {}

class ListenToRealtimePostUpdatesEvent extends PostEvent {}

class LikePost extends PostEvent {
  final String postId;
  LikePost(this.postId);
}

class AddPostEvent extends PostEvent {
  final String message;

  AddPostEvent(this.message);
}
