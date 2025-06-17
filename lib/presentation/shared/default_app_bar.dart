import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, required this.title, this.actions});

  /// Widgets displayed after the [title] text
  final List<Widget>? actions;

  /// Centered text in [DefaultAppBar]
  final String title;

  /// Background color of the [DefaultAppBar]
  static const _appBarBackgroundColor = Color(0xFF2AE881);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      backgroundColor: _appBarBackgroundColor,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
