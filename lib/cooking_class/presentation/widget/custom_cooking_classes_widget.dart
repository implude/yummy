import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/cooking_class/domain/cooking_class/cooking_class.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/user/domain/user/user.dart';

class CustomCookingClassesWidget extends HookWidget {
  final User user;
  final List<CookingClass> classes;

  const CustomCookingClassesWidget(
      {super.key, required this.user, required this.classes});

  @override
  Widget build(BuildContext context) {
    final chunked = useMemoized(() => classes.slices(2), [classes]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            "${user.name}님 맞춤 클래스",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Palette.blackLike,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: Column(
            children: <Widget>[
              for (final chunk in chunked)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (final cookingClass in chunk)
                      Flexible(
                        child: _CustomCookingClassWidget(
                            cookingClass: cookingClass),
                      )
                  ].interList(const SizedBox(width: 24)),
                ),
            ].interList(const SizedBox(height: 16)),
          ),
        )
      ],
    );
  }
}

class _CustomCookingClassWidget extends StatelessWidget {
  final CookingClass cookingClass;

  const _CustomCookingClassWidget({super.key, required this.cookingClass});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/cooking-class", extra: cookingClass),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                cookingClass.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (cookingClass.region != null) ...[
            Row(
              children: [
                SvgPicture.asset(Assets.imagesMapPin),
                const SizedBox(width: 4),
                Text(
                  cookingClass.region!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.yellow,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              cookingClass.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Palette.blackLike,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: <Widget>[
                for (final tag in cookingClass.tags)
                  Text(
                    "#$tag",
                    style: const TextStyle(color: Palette.grayDark),
                  ),
              ].interList(const SizedBox(width: 4)),
            ),
          ),
        ],
      ),
    );
  }
}
