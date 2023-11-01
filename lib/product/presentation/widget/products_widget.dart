import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/int_extensions.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/product/domain/product/product.dart';

class ProductsWidget extends HookWidget {
  final List<Product> products;

  const ProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final chunked = useMemoized(() => products.slices(2), [products]);

    return Column(
      children: <Widget>[
        for (final chunk in chunked)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final product in chunk)
                Flexible(
                  child: ProductWidget(product: product),
                )
            ].interList(const SizedBox(width: 24)),
          ),
      ].interList(const SizedBox(height: 12)),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/product", extra: product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${product.price.withCommas()}원",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Palette.blackLike,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 12,
              color: Palette.grayDark,
            ),
          )
        ],
      ),
    );
  }
}
