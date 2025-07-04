import 'package:flutter/material.dart';
import 'package:yndx_homework/domain/models/transaction.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';

class DefaultListTile extends StatelessWidget {
  const DefaultListTile({
    required this.transaction,
    required this.isFirstInList,
    super.key,
  });

  /// [Transaction] object
  final Transaction transaction;

  /// Indicates whether [DefaultListTile] is first in [List].
  /// This will account whether to size box to header divider or not
  /// (by default tile is 70px, but we put dividers)
  final bool isFirstInList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isFirstInList ? 68 : 69,
      child: Row(
        children: [
          SizedBox(width: 16),
          Text(transaction.category.emoji),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    transaction.category.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (transaction.comment != null)
                    Text(transaction.comment!, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Text('${transaction.amount.toString()} ₽'),
          SizedBox(width: 16),
          Icon(
            Icons.chevron_right_rounded,
            color: context.colors.inactive.withAlpha((0.3 * 255).toInt()),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
