import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CloudImage extends StatefulWidget {
  const CloudImage({
    this.size,
    this.imgUrl,
    this.placeholderPath,
    this.fit,
    this.width,
    this.height,
    this.quality = FilterQuality.high,
    this.borderRadius,
  });

  final double? size;
  final double? height;
  final double? width;
  final String? imgUrl;
  final String? placeholderPath;
  final BoxFit? fit;
  final FilterQuality quality;
  final BorderRadiusGeometry? borderRadius;

  @override
  _CloudImageState createState() => _CloudImageState();
}

class _CloudImageState extends State<CloudImage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CupertinoActivityIndicator())
        : CachedNetworkImage(
            // cacheManager: CustomCacheManager.instance,
            imageUrl: widget.imgUrl!,
            height: widget.height ?? 106,
            width: widget.width ?? 150,
            maxHeightDiskCache:
                widget.quality == FilterQuality.high ? null : 200,
            maxWidthDiskCache:
                widget.quality == FilterQuality.high ? null : 200,

            filterQuality: widget.quality,
            imageBuilder: (context, imageProvider) => Container(
              height: widget.height ?? 106,
              width: widget.width ?? 130,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ??
                    const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(6),
                    ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: widget.fit ??
                      (widget.size == null ? BoxFit.cover : BoxFit.contain),
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              height: widget.height ?? 106,
              width: widget.width ?? 130,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ??
                    const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(6),
                    ),
                color: Colors.white,
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor: Colors.grey[200]!,
                child: Image.asset(
                  widget.placeholderPath ?? 'assets/icons/app_logo.png',
                ),
              ),
            ),
            errorWidget: (context, url, error) {
              return InkWell(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  await CachedNetworkImage.evictFromCache(widget.imgUrl!);
                  isLoading = false;
                  setState(() {});
                },
                child: SizedBox(
                  height: widget.height ?? 106,
                  width: widget.width ?? 130,
                  child: const Icon(Icons.error),
                ),
              );
            },
          );
  }
}
