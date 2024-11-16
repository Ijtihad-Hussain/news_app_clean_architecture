import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../usecase/usecase.dart';
import '../../domain/entities/news.dart';
import '../../domain/usecases/get_all_news.dart';
import '../../domain/usecases/upload_news.dart';
part 'news_event.dart';
part 'blog_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final UploadNews _uploadNews;
  final GetAllNews _getAllNews;
  NewsBloc({
    required UploadNews uploadNews,
    required GetAllNews getAllNews,
  })  : _uploadNews = uploadNews,
        _getAllNews = getAllNews,
        super(BlogInitial()) {
    on<NewsEvent>((event, emit) => emit(BlogLoading()));
    on<NewsUpload>(_onBlogUpload);
    on<FetchAllNews>(_onFetchAllBlogs);
  }

  void _onBlogUpload(
    NewsUpload event,
    Emitter<NewsState> emit,
  ) async {
    final res = await _uploadNews(
      UploadNewsParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogUploadSuccess()),
    );
  }

  void _onFetchAllBlogs(
    FetchAllNews event,
    Emitter<NewsState> emit,
  ) async {
    final res = await _getAllNews(NoParams());

    res.fold(
      (l) => emit(BlogFailure(l.message)),
      (r) => emit(BlogsDisplaySuccess(r)),
    );
  }
}
