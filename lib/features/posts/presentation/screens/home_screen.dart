// screens/home_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_sphere/core/theme/app_colors.dart';
import 'package:social_sphere/core/widgets/app_form_field_widget.dart';
import 'package:social_sphere/features/app_bar/presentation/widgets/app_bar_widget.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:social_sphere/features/auth/presentation/bloc/auth_event.dart';
import 'package:social_sphere/features/posts/presentation/bloc/post_bloc.dart';
import 'package:social_sphere/features/posts/presentation/bloc/post_event.dart';
import 'package:social_sphere/features/posts/presentation/bloc/post_state.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userName;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _userName = widget.username;
    print("Paneer $_userName");
    super.initState();
    context.read<PostBloc>().add(FetchPostsEvent());
    context.read<PostBloc>().add(ListenToRealtimePostUpdatesEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showBackButton: true,
        title: _userName ?? "Welcome to Social Sphere",
        leadingBtnOnClick: () {
          context.read<AuthBloc>().add(LogoutEvent());
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<PostBloc, PostState>(
              listener: (context, state) {
                if (state is PostAdded) {
                  context.read<PostBloc>().add(FetchPostsEvent());
                }
              },
              builder: (context, state) {
                if (state is PostSuccess) {
                  return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      final post = state.posts[index];

                      return ListTile(
                        title: Text(post.username),
                        subtitle: Text(post.message),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${post.timestamp.hour}:${post.timestamp.minute}',
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                context.read<PostBloc>().add(LikePost(post.id));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    post.likes.contains(FirebaseAuth
                                            .instance.currentUser?.uid)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: post.likes.contains(FirebaseAuth
                                            .instance.currentUser?.uid)
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(post.likes.length.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is PostFailure) {
                  return Center(child: Text(state.error));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: AppFormFieldWidget(
                  labelText: "Enter your message",
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {});
                  },
                )),
                BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    return IconButton(
                      icon: Icon(
                        Icons.send,
                        color: _controller.text.isEmpty
                            ? AppColors.editTextHintColor
                            : AppColors.appColor,
                      ),
                      onPressed: _controller.text.isEmpty
                          ? null
                          : () {
                              context
                                  .read<PostBloc>()
                                  .add(AddPostEvent(_controller.text));
                              _controller.clear();
                            },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
