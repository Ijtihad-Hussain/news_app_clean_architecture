
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../constants/app_colors.dart';
import '../../../../utils/show_snackbar.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_card.dart';
import 'add_new_news_page.dart';

class NewsApp extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const NewsApp(),
      );
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchAllNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddNewNewsPage.route());
            },
            icon: const Icon(
              CupertinoIcons.add_circled,
            ),
          ),
        ],
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const Loader();
          }
          if (state is BlogsDisplaySuccess) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return NewsCard(
                  news: blog,
                  color: index % 2 == 0
                      ? AppColors.gradient1
                      : AppColors.gradient2,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
