import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/int_extensions.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/product/domain/product/product.dart';

double _convertRating(int index, double rating) {
  final sub = rating - index;

  if (sub <= 0) {
    return 0;
  } else if (sub < 1) {
    return sub;
  } else {
    return 1;
  }
}

class ProductDetailsView extends StatelessWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _ProductDetailsLayout(product: product),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                extendedTextStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                onPressed: () {},
                label: const Text("구매하기"),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.imagesHeart,
                width: 36,
                colorFilter: const ColorFilter.mode(
                  Palette.red,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductDetailsLayout extends StatelessWidget {
  final Product product;

  const _ProductDetailsLayout({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final discount = product.discount;

    return Stack(
      children: [
        Image.asset(
          product.image,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            padding: const EdgeInsets.all(26),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Palette.yellow.shade900,
                    ),
                  ),
                  const SizedBox(height: 9),
                  if (discount != null) ...[
                    Row(
                      children: [
                        Text(
                          "${(discount * 100).toInt()}%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Palette.yellow.shade900,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${product.price.withCommas()}원",
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Palette.grayDark,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "${(product.price * (1 - discount)).toInt().withCommas()}원",
                      style: const TextStyle(
                        color: Palette.red,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                  if (discount == null)
                    Text(
                      "${product.price.withCommas()}원",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Palette.grayDark,
                      ),
                    ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(),
                          foregroundColor: Palette.blue,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: const Text("판매자"),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      ...List.generate(
                        5,
                        (index) => _StarRating(
                          value: _convertRating(index, product.rating),
                        ),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(),
                          foregroundColor: Palette.blue,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Text("(${product.reviewCount.withCommas()})"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        for (final content in product.contents)
                          switch (content) {
                            ItemContentText(text: var text) => Text(
                                text,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ItemContentImage(image: var image) =>
                              Image.asset(image),
                          }
                      ].interList(const SizedBox(height: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StarRating extends StatelessWidget {
  final double value;

  const _StarRating({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.imagesStar,
          colorFilter: const ColorFilter.mode(
            Palette.gray,
            BlendMode.srcIn,
          ),
        ),
        ClipRect(
          clipper: _StarClipper(value),
          child: SvgPicture.asset(Assets.imagesStar),
        ),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double value;

  _StarClipper(this.value);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * value, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
