part of 'post_bloc.dart';

abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {}

class LoadingState extends PostState {}

class LoadedState extends PostState {
  List<PostModel> data = [];

  LoadedState({required this.data});
}

class ErrorState extends PostState {
  String error = '';

  ErrorState({required this.error});
}
