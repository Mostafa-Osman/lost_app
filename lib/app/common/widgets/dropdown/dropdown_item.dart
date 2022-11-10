import 'package:flutter/material.dart';

class DropDownItem extends StatelessWidget {
  final String? title;
  final bool last;
  final VoidCallback? onPress;

  const DropDownItem({
    this.title,
    this.last = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 51,
        width: 343,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            if (!last)
              Container(
                height: 1,
                color: Colors.grey.shade400,
              )
          ],
        ),
      ),
    );
  }
}
