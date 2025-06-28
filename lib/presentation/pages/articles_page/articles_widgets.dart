part of 'articles_page.dart';

class _ArticleTile extends StatelessWidget {
  const _ArticleTile({super.key, required this.emoji, required this.name});

  final String emoji;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        children: [
          SizedBox(width: 16,),
          Text(emoji),
          SizedBox(width: 16,),
          Expanded(child: Text(name, textAlign: TextAlign.start,))
        ],
      ),
    );
  }
}
