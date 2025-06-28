import 'package:flutter/material.dart';
import 'package:yndx_homework/presentation/shared/default_app_bar.dart';

class _Article {
  const _Article(this.emoji, this.name);
  final String emoji;
  final String name;
}

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'Мои статьи'),
      body: Column(children: []),
    );
  }
}
