
import 'package:fpdart/fpdart.dart';

import '../../../../error/failures.dart';
import '../../../../usecase/usecase.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class GetAllNews implements UseCase<List<News>, NoParams> {
  final NewsRepository newsRepository;
  GetAllNews(this.newsRepository);

  @override
  Future<Either<Failure, List<News>>> call(NoParams params) async {
    return await newsRepository.getAllNews();
  }
}
