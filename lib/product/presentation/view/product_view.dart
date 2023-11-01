import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/common/states.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/product/presentation/widget/products_widget.dart';
import 'package:yummy/product/presentation/widget/special_price_products_widget.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: _ProductLayout(),
      ),
    );
  }
}

class _ProductLayout extends StatelessWidget {
  const _ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "원하는 상품을 검색하세요.",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesSearch),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: SpecialPriceProductsWidget(products: kSpecialPriceProducts),
        ),
        const SizedBox(height: 18),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: _CategorySelector(),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8.5,
          ),
          child: ProductsWidget(products: kProducts),
        ),
      ],
    );
  }
}

class _CategorySelector extends HookWidget {
  const _CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final (selectedCategory, setSelectedCategory) =
        useState(kProductCategories[0]).destructed;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for (final category in kProductCategories)
            _CategoryChip(
              category: category,
              selected: selectedCategory == category,
              onSelected: () => setSelectedCategory(category),
            ),
        ].interList(const SizedBox(width: 10)),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String category;
  final bool selected;
  final void Function() onSelected;

  const _CategoryChip({
    super.key,
    required this.category,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      side: BorderSide.none,
      label: Text("#$category"),
      backgroundColor: selected ? Palette.yellow.shade300 : Palette.whiteLike,
      labelStyle: TextStyle(
        fontSize: 16,
        color: selected ? Palette.yellow.shade800 : Palette.grayDark,
        fontWeight: FontWeight.w400,
      ),
      onPressed: onSelected,
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
    );
  }
}
