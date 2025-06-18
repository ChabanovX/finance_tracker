import 'package:flutter/material.dart';

import 'package:yndx_homework/presentation/theme/app_theme.dart';

class DefaultHeaderListTile extends StatelessWidget {
  const DefaultHeaderListTile({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.accentLight,
      height: 56,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [leading, trailing],
        ),
      ),
    );
  }
}