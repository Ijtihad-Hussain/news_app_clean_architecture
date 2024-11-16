import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../error/failures.dart';
import '../entities/news.dart';

abstract interface class NewsRepository {
  Future<Either<Failure, News>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  });

  Future<Either<Failure, List<News>>> getAllNews();
}
