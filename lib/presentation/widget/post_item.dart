import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/blocs/post_bloc.dart';
import 'package:posts_app/presentation/widget/posts.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) => ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedState) {
                  return Posts(
                    id: state.data[index].id,
                    title: state.data[index].title,
                    body: state.data[index].body,
                  );
                } else if (state is ErrorState) {
                  return Text(state.error);
                } else {
                  return Container();
                }
              })),
    );
  }
}
