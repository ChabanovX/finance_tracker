import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, required this.title, this.actions});

  /// Widgets displayed after the [title] text
  final List<Widget>? actions;

  /// Centered text in [DefaultAppBar]
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
