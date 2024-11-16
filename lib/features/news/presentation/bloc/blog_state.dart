part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class BlogInitial extends NewsState {}

final class BlogLoading extends NewsState {}

final class BlogFailure extends NewsState {
  final String error;
  BlogFailure(this.error);
}

final class BlogUploadSuccess extends NewsState {}

final class BlogsDisplaySuccess extends NewsState {
  final List<News> blogs;
  BlogsDisplaySuccess(this.blogs);
}
