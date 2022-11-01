import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/blocs/post_bloc.dart';
import 'package:posts_app/presentation/view/post_view.dart';
import 'package:posts_app/presentation/view_model/post_view_model.dart';
import 'package:posts_app/repository/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (BuildContext context) => PostBloc(
          postViewModel: PostViewModel(postRepository: PostRepository()))
        ..add(LoadedEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const PostView(),
      ),
    );
  }
}
