import 'package:flutter/material.dart';
import 'package:lost_app/app/common/extensions/context_extensions.dart';

class NoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;

  const NoAppBar() : color = null;

  const NoAppBar.withStatusBarColor(this.color);

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        backgroundColor: color ?? context.scaffoldColor,
        elevation: 0,
      ),
    );
  }
}
