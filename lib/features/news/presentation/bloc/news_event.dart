part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsUpload extends NewsEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  NewsUpload({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}

final class FetchAllNews extends NewsEvent {}
