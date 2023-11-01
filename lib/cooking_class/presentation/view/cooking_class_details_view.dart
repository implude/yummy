import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/int_extensions.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/common/states.dart';
import 'package:yummy/cooking_class/domain/cooking_class/cooking_class.dart';
import 'package:yummy/cooking_class/domain/cooking_class_content/cooking_class_content.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';
import 'package:yummy/core/presentation/widget/app_back_button.dart';
import 'package:yummy/generated/assets.dart';

class CookingClassDetailsView extends HookWidget {
  final CookingClass cookingClass;

  const CookingClassDetailsView({super.key, required this.cookingClass});

  @override
  Widget build(BuildContext context) {
    final (pinned, setPinned) = useState(false).destructed;

    return Scaffold(
      appBar: pinned
          ? null
          : AppBar(
              leading: const AppBackButton(),
            ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: _CookingClassDetailsLayout(
            cookingClass: cookingClass,
            onPinned: setPinned,
          ),
        ),
      ),
    );
  }
}

class _CookingClassDetailsLayout extends HookWidget {
  final ValueChanged<bool> onPinned;
  final CookingClass cookingClass;

  const _CookingClassDetailsLayout({
    super.key,
    required this.cookingClass,
    required this.onPinned,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final (contentIndex, setContentIndex) = useState(0).destructed;

    final keys =
        useMemoized(() => List.generate(5, (index) => GlobalKey()), []);

    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    cookingClass.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IntrinsicHeight(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.grayDark,
                    ),
                    child: Row(
                      children: [
                        ...<Widget>[
                          for (final tag in cookingClass.tags) Text("#$tag"),
                        ].interList(const SizedBox(width: 12)),
                        const VerticalDivider(
                          color: Palette.grayDark,
                          width: 40,
                          indent: 4,
                          endIndent: 4,
                        ),
                        Text(cookingClass.instructor),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Palette.yellow.shade900,
                    fontSize: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          cookingClass.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "${cookingClass.price.withCommas()}원",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    _IconWithText(
                      asset: Assets.imagesBookmark,
                      value: cookingClass.bookmarkCount,
                    ),
                    const SizedBox(width: 20),
                    _IconWithText(
                      asset: Assets.imagesComment,
                      value: cookingClass.reviewCount,
                    ),
                    if (!cookingClass.isOnline) ...[
                      const Expanded(child: SizedBox.shrink()),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 16,
                          color: Palette.grayDark,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "남은 인원",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text("${cookingClass.remainPeople}"),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Text("/"),
                            ),
                            Text("${cookingClass.totalPeople}")
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Palette.yellow.shade900,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.yellow,
                          ),
                          onPressed: () {},
                          child: const Text("클래스 신청하기"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.yellow.shade200,
                          ),
                          onPressed: () {},
                          child: Text(
                              cookingClass.isOnline ? "재료 주문하기" : "장소 확인하기"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Divider(
                color: Palette.gray,
                height: 8,
              ),
            ],
          ),
        ),
        SliverStickyHeader(
          activityHandler: (activity) =>
              onPinned(activity == SliverStickyHeaderActivity.pinned),
          header: _CookingClassContentHeader(
            selectedIndex: contentIndex,
            onSelected: (index) {
              setContentIndex(index);

              final context = keys[index].currentContext;

              if (context != null) {
                Scrollable.ensureVisible(
                  context,
                  duration:
                      const Duration(milliseconds: 100), // Adjust as needed
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: _CookingClassContentsWidget(
              scrollController: scrollController,
              cookingClassContent: cookingClass.content,
              onChanged: setContentIndex,
              keys: keys,
            ),
          ),
        ),
      ],
    );
  }
}

class _CookingClassContentHeader extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onSelected;

  const _CookingClassContentHeader({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 20,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final (index, name) in kCookingClassContentHeaderNames.indexed)
            InkWell(
              onTap: () => onSelected(index),
              child: IntrinsicWidth(
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Palette.yellow.shade800,
                      ),
                    ),
                    if (index == selectedIndex) ...[
                      const SizedBox(height: 4),
                      Container(
                        color: Palette.yellow.shade800,
                        height: 2,
                      )
                    ]
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _CookingClassContentsWidget extends HookWidget {
  final List<GlobalKey> keys;
  final ScrollController scrollController;
  final void Function(int) onChanged;
  final CookingClassContent cookingClassContent;

  const _CookingClassContentsWidget({
    super.key,
    required this.keys,
    required this.cookingClassContent,
    required this.scrollController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      var lastIndex = 0;

      onScroll() {
        final viewportHeight = MediaQuery.of(context).size.height;
        final key = keys.firstWhereOrNull((key) {
          final currentContext = key.currentContext;

          if (currentContext == null) return false;

          final renderObject = currentContext.findRenderObject() as RenderBox;
          final position = renderObject.localToGlobal(Offset.zero);
          final size = renderObject.size;

          return position.dy < viewportHeight && position.dy + size.height > 0;
        });

        if (key != null) {
          final index = keys.indexOf(key);

          if (index != lastIndex) {
            lastIndex = index;

            onChanged(index);
          }
        }
      }

      scrollController.addListener(onScroll);

      return () => scrollController.removeListener(onScroll);
    }, []);

    final contents = useMemoized(
      () => [
        cookingClassContent.introduction,
        cookingClassContent.curriculum,
        cookingClassContent.instructor,
        cookingClassContent.review,
        cookingClassContent.recommendation
      ],
      [cookingClassContent],
    );

    return SliverList.separated(
      itemBuilder: (context, index) => Column(
        key: keys[index],
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final content in contents[index])
            switch (content) {
              ItemContentText(text: var text) => Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                ),
              ItemContentImage(image: var image) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
            }
        ].interList(const SizedBox(height: 16)),
      ),
      separatorBuilder: (context, index) => const Divider(
        color: Palette.grayLight,
        height: 32,
      ),
      itemCount: keys.length,
    );
  }
}

class _IconWithText extends StatelessWidget {
  final String asset;
  final int value;

  const _IconWithText({super.key, required this.asset, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          width: 26,
          colorFilter: const ColorFilter.mode(
            Palette.yellow,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          "$value",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Palette.grayDark,
          ),
        ),
      ],
    );
  }
}
