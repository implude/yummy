import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/int_extensions.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/core/presentation/view/banner_image.dart';
import 'package:yummy/product/domain/product/product.dart';

class SpecialPriceProductsWidget extends StatelessWidget {
  final List<Product> products;

  const SpecialPriceProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "특가 상품",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Palette.blackLike,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: <Widget>[
                for (final product in products)
                  _SpecialPriceProductWidget(product: product)
              ].interList(const SizedBox(width: 20)),
            ),
          ),
        ),
      ],
    );
  }
}

class _SpecialPriceProductWidget extends StatelessWidget {
  final Product product;

  const _SpecialPriceProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: () => context.push("/product", extra: product),
        child: Stack(
          children: [
            BannerImage(asset: product.image),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.4154),
                      Colors.black.withOpacity(0.6085),
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: const [
                      0,
                      0.4,
                      0.4,
                      0.6,
                      0.8,
                      1,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Palette.red,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      children: [
                        Text("${(product.discount! * 100).toInt()}%"),
                        const SizedBox(width: 9),
                        Text(
                            "${(product.price * (1 - product.discount!)).toInt().withCommas()}원")
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Palette.grayLight,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
