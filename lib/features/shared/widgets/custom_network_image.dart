import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width = 95,
    this.height = 120,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
       imageUrl:  imageUrl ,
        width: width,
        height: height,
        fit: fit,
        placeholder:
              (context, url) => Skeletonizer(
            child: Container(
              width:width,
              height: height,
              color: Colors.white,
            ),
          ),
        errorWidget:  (context, url, error) {
          return Skeletonizer(
            child: Container(
              width: width,
              height: height,
              color: Colors.grey[100],

            //  child: const Icon(Icons.broken_image, color: Colors.grey, size: 40),
            ),
          );
        },
      ),
    );
  }
}
