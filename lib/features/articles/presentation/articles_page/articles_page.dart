import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/features/articles/providers.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_app_bar.dart';
import 'package:yndx_homework/core/theme/app_theme.dart';

part 'articles_widgets.dart';

class ArticlesPage extends ConsumerWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncArticles = ref.watch(filteredArticlesProvider);
    return Scaffold(
      appBar: DefaultAppBar(title: 'My Articles'),
      body: Column(
        children: [
          Container(
            color: context.colors.secondary,
            height: 56,
            child: Row(
              children: [
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Find an Article',
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
            child: asyncArticles.when(
              data:
                  (data) => ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (ctx, index) {
                      final article = data[index];
                      return _ArticleTile(
                        emoji: article.emoji,
                        name: article.text,
                      );
                    },
                  ),
              error: (_, __) => SizedBox.shrink(),
              loading: () => SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
