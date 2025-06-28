import 'package:flutter/material.dart';

import 'package:yndx_homework/presentation/theme/app_theme.dart';

class DefaultHeaderListTile extends StatelessWidget {
  const DefaultHeaderListTile({
    super.key,
    required this.leading,
    required this.trailing,
    this.backgroundColor
  });

  final Widget leading;
  final Widget trailing;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? context.colors.accentLight,
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