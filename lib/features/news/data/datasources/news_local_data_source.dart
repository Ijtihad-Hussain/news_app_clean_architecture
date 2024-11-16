
import 'package:hive/hive.dart';

import '../models/news_model.dart';

abstract interface class NewsLocalDataSource {
  void uploadLocalBlogs({required List<NewsModel> blogs});
  List<NewsModel> loadBlogs();
}

class BlogLocalDataSourceImpl implements NewsLocalDataSource {
  final Box box;
  BlogLocalDataSourceImpl(this.box);

  @override
  List<NewsModel> loadBlogs() {
    List<NewsModel> blogs = [];
    box.get(() {
      for (int i = 0; i < box.length; i++) {
        blogs.add(NewsModel.fromJson(box.get(i.toString())));
      }
    });

    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<NewsModel> blogs}) {
    box.clear();

    box.add(() {
      for (int i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }
}
