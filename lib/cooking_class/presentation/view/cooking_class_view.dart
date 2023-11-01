import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/common/states.dart';
import 'package:yummy/cooking_class/presentation/widget/custom_cooking_classes_widget.dart';
import 'package:yummy/cooking_class/presentation/widget/popular_cooking_classes_widget.dart';
import 'package:yummy/generated/assets.dart';

class CookingClassView extends StatelessWidget {
  const CookingClassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: _CookingClassLayout(),
      ),
    );
  }
}

class _CookingClassLayout extends HookWidget {
  const _CookingClassLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final (isOnline, setOnline) = useState(false).destructed;

    final (selectedRegion, setSelectedRegion) =
        useState<String?>(null).destructed;

    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "내 마음을 사로잡는 쿠킹클래스를 검색하세요.",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesSearch),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: _OfflineOnlineSelector(
            isOnline: isOnline,
            setOnline: setOnline,
          ),
        ),
        if (!isOnline) ...[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _RegionChip(
                  region: "내 위치",
                  selected: selectedRegion == null,
                  onSelected: () => setSelectedRegion(null),
                ),
                for (final region in kOfflineClassRegions)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: _RegionChip(
                      region: region,
                      selected: selectedRegion == region,
                      onSelected: () => setSelectedRegion(region),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PopularCookingClassesWidget(
            classes: isOnline
                ? kOnlinePopularCookingClasses
                : kOfflinePopularCookingClasses,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomCookingClassesWidget(
            user: kUser,
            classes: isOnline
                ? kOnlineCustomCookingClasses
                : kOfflineCustomCookingClasses,
          ),
        ),
      ],
    );
  }
}

class _RegionChip extends StatelessWidget {
  final String region;
  final bool selected;
  final void Function() onSelected;

  const _RegionChip(
      {super.key,
      required this.region,
      required this.selected,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: onSelected,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      label: Text(region),
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(
        fontSize: 16,
        color: selected ? Palette.yellow.shade800 : Palette.grayDark,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: selected ? Palette.yellow.shade200 : Palette.whiteLike,
    );
  }
}

class _OfflineOnlineSelector extends StatelessWidget {
  final bool isOnline;
  final void Function(bool) setOnline;

  const _OfflineOnlineSelector(
      {super.key, required this.isOnline, required this.setOnline});

  @override
  Widget build(BuildContext context) {
    const activeColor = Palette.yellow;
    const inActiveColor = Palette.gray;

    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => setOnline(false),
            child: Text(
              "오프라인 클래스",
              style: TextStyle(
                color: isOnline ? inActiveColor : activeColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(2),
          height: 20,
          decoration: BoxDecoration(
            color: Palette.yellow,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () => setOnline(true),
            child: Text(
              "온라인 클래스",
              style: TextStyle(
                color: isOnline ? activeColor : inActiveColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
