import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/presentation/shared/default_app_bar.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';

import '/presentation/providers.dart';

part 'articles_widgets.dart';

class ArticlesPage extends ConsumerWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(filteredArticlesProvider);
    return Scaffold(
      appBar: DefaultAppBar(title: 'Мои статьи'),
      body: Column(
        children: [
          Container(
            color: Color(0xFFECE6F0),
            height: 56,
            child: Row(
              children: [
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Найти статью',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),

                    onChanged:
                        (value) =>
                            ref
                                .read(articleSearchQueryProvider.notifier)
                                .state = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                articles.isEmpty
                    ? const Center(child: Text('Ничего не найдено'))
                    : ListView.separated(
                      itemCount: articles.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (ctx, index) {
                        final article = articles[index];
                        return _ArticleTile(
                          emoji: article.emoji,
                          name: article.text,
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
