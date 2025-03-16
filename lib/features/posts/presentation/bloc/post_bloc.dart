// blocs/post_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_sphere/features/posts/data/repositories/post_repository.dart';
import 'package:social_sphere/features/posts/presentation/bloc/post_event.dart';
import 'package:social_sphere/features/posts/presentation/bloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<FetchPostsEvent>(_onFetchPosts);
    on<AddPostEvent>(_onAddPost);
    on<LikePost>(_likePost);
    on<ListenToRealtimePostUpdatesEvent>(_onListenToRealtimePostUpdates);
  }

  Future<void> _onFetchPosts(
      FetchPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await postRepository.fetchPosts();
      emit(PostSuccess(posts));
    } catch (e) {
      emit(PostFailure(e.toString()));
    }
  }

  Future<void> _onListenToRealtimePostUpdates(
      ListenToRealtimePostUpdatesEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      // 🔥 Use the real-time Firestore stream
      await emit.forEach(
        postRepository.listenToPosts(),
        onData: (posts) => PostSuccess(posts),
        onError: (error, stackTrace) => PostFailure(error.toString()),
      );
    } catch (e) {
      emit(PostFailure(e.toString()));
    }
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<PostState> emit) async {
    try {
      final bool postAdded = await postRepository.addPost(event.message);
      if (postAdded) {
        return emit(PostAdded());
      } else {
        emit(PostFailure(
            "Unable to post, Facing issue posting your post, Please try again."));
      }
    } catch (e) {
      emit(PostFailure(e.toString()));
    }
  }

  Future<void> _likePost(LikePost event, Emitter<PostState> emit) async {
    await postRepository.toggleLikePost(event.postId);
    add(FetchPostsEvent()); // Refresh posts after liking
  }
}
