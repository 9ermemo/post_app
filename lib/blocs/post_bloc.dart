import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/post_model.dart';
import '../presentation/view_model/post_view_model.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostViewModel postViewModel;

  PostBloc({required this.postViewModel}) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is LoadedEvent) {
        emit(LoadingState());
        try {
          List<PostModel> data = await postViewModel.fetchData();
          emit(LoadedState(data: data));
        } catch (e) {
          emit(ErrorState(error: 'some thing went wrong !'));
        }
      }
    });
  }
}
