import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../themes/app_colors.dart';

class SmartRefresh extends StatelessWidget {
  final Widget child;
  final bool hasFooter;
  final Widget? loadingFooter;
  final RefreshController controller;
  final void Function(RefreshController controller)? onRefresh;
  final void Function(RefreshController controller)? onLoading;
  final String? lastItemText;

  @override
  // ignore: overridden_fields
  final Key? key;

  const SmartRefresh({
    this.key,
    required this.child,
    required this.controller,
    this.hasFooter = true,
    this.onLoading,
    this.onRefresh,
    this.loadingFooter,
    this.lastItemText,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: key,
      enablePullUp: hasFooter,
      header: const MaterialClassicHeader(color: AppColors.lightPrimaryColor),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.loading) {
            body = loadingFooter ??
                Container(
                  height: 25,
                  width: 25,
                  margin: const EdgeInsets.only(top: 10),
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.lightPrimaryColor,
                  ),
                );
          } else if (mode == LoadStatus.failed) {
            body = const Text('load failed');
          } else {
            body = Column(
              children: const [
                SizedBox(height: 10),
                // Text(lastItemText ?? 'End of Scroll'),
              ],
            );
          }
          return Container(
            padding:
                loadingFooter == null ? const EdgeInsets.only(top: 5.0) : null,
            child: Center(child: body),
          );
        },
      ),
      controller: controller,
      onRefresh: () => onRefresh?.call(controller),
      onLoading: () => onLoading?.call(controller),
      child: child,
    );
  }
}
