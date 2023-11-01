import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String asset;

  const BannerImage({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.8;

    return Image.asset(
      asset,
      width: imageWidth,
      height: imageWidth * 9 / 16,
      fit: BoxFit.fitWidth,
    );
  }
}
