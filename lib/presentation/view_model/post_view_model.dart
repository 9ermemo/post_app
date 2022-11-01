import 'package:posts_app/data/model/post_model.dart';
import 'package:posts_app/repository/post_repository.dart';

class PostViewModel {
  PostRepository postRepository;

  PostViewModel({required this.postRepository});

  Future<List<PostModel>> fetchData() async {
    return await postRepository.fetchData();
  }
}
