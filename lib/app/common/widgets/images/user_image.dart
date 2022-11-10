import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lost_app/app/common/themes/app_colors.dart';
import 'package:lost_app/app/common/widgets/images/cached_image.dart';

class UserImage extends StatelessWidget {
  final File? cashedImage;
  final String? imageUrl;
  final String userName;
  final double width;
  final FilterQuality quality;

  const UserImage({
    required this.width,
    this.cashedImage,
    this.imageUrl,
    this.quality = FilterQuality.medium,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(width / 2 + (width * 0.07)),
      ),
      child: Container(
        height: width,
        width: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: cashedImage != null
            ? ClipOval(
                child: Image.file(
                  cashedImage!,
                  fit: BoxFit.cover,
                  width: width,
                  height: width,
                ),
              )
            : imageUrl != null
                ? CloudImage(
                    height: width,
                    width: width,
                    imgUrl: imageUrl,
                    fit: BoxFit.cover,
                    quality: quality,
                  )
                : Text(
                    getNullImageStatus(userName),
                    style: TextStyle(
                      color: AppColors.lightPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: width / 4 > 12 ? width / 4 : 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
      ),
    );
  }

  String getNullImageStatus(String name) {
    final names = name.trim().split(' ');
    if (names.length > 1) {
      return names.first[0].toUpperCase() + names.last[0].toUpperCase();
    } else {
      return names[0].substring(0, 2).toUpperCase();
    }
  }
}
