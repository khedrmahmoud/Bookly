import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
              child: Skeleton(
            isLoading: true,
            skeleton: SkeletonAvatar(),
            child: SizedBox(
              height: 60,
            ),
          )),
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
