
import 'package:flutter/material.dart';
import 'package:lost_app/app/common/extensions/context_extensions.dart';
import 'package:lost_app/app/common/extensions/show_wait_toast.dart';
import 'package:lost_app/app/common/themes/app_theme.dart';
import 'package:lost_app/app/common/widgets/custom_back_button.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool isPopEnabled;
  final bool hasBackButton;
  final VoidCallback? onBackPressed;
  final Color backgroundColor;
  final List<Widget>? actions;

  const DefaultAppBar({
    this.title = '',
    this.isPopEnabled = true,
    this.hasBackButton = true,
    this.backgroundColor = AppTheme.scaffoldBackground,
    this.onBackPressed,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  VoidCallback get onExitPressed {
    return widget.onBackPressed ??
        () {
          if (widget.isPopEnabled) {
            Navigator.of(context).pop();
          } else {
            context.showWaitToast();
          }
        };
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      automaticallyImplyLeading: false,
      leadingWidth: 55,
      centerTitle: true,
      scrolledUnderElevation: 3,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
      ),
      titleSpacing: 0,
      toolbarHeight: 65,
      actions: widget.actions,
      leading: widget.hasBackButton && context.canPop
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomBackButton(onExitPressed: onExitPressed),
            )
          : null,
    );
  }
}
