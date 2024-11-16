import 'dart:io';
import 'package:fpdart/fpdart.dart';

import '../../../../error/failures.dart';
import '../../../../usecase/usecase.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class UploadNews implements UseCase<News, UploadNewsParams> {
  final NewsRepository newsRepository;
  UploadNews(this.newsRepository);

  @override
  Future<Either<Failure, News>> call(UploadNewsParams params) async {
    return await newsRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      posterId: params.posterId,
      topics: params.topics,
    );
  }
}

class UploadNewsParams {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadNewsParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
