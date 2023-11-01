import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/cooking_class/domain/cooking_class/cooking_class.dart';
import 'package:yummy/core/presentation/view/banner_image.dart';

class PopularCookingClassesWidget extends StatelessWidget {
  final List<CookingClass> classes;

  const PopularCookingClassesWidget({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "가장 인기있는 쿠킹클래스",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Palette.blackLike,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              for (final cookingClass in classes)
                _PopularCookingClassWidget(cookingClass: cookingClass)
            ].interList(const SizedBox(width: 20)),
          ),
        ),
      ],
    );
  }
}

class _PopularCookingClassWidget extends StatelessWidget {
  final CookingClass cookingClass;

  const _PopularCookingClassWidget({super.key, required this.cookingClass});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/cooking-class", extra: cookingClass),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            BannerImage(asset: cookingClass.image),
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
                      Colors.black.withOpacity(0.4175),
                      Colors.black.withOpacity(0.6),
                    ],
                    stops: const [
                      0,
                      0.5,
                      0.5,
                      0.75,
                      1,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cookingClass.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      for (final tag in cookingClass.tags)
                        Text(
                          "#$tag",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Palette.grayLight,
                          ),
                        )
                    ].interList(const SizedBox(width: 7)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
