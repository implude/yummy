import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/common/states.dart';
import 'package:yummy/cooking_class/presentation/view/cooking_class_view.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/post/presentation/view/post_view.dart';
import 'package:yummy/product/presentation/view/product_view.dart';

class MainView extends HookWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    const views = [
      CookingClassView(),
      ProductView(),
      PostView(),
      Placeholder(),
    ];

    final (index, setIndex) = useState(0).destructed;

    Widget generateDestination({required String asset, required int idx}) =>
        NavigationDestination(
          icon: SvgPicture.asset(
            asset,
            colorFilter: ColorFilter.mode(
              index == idx ? Palette.yellow : Palette.gray,
              BlendMode.srcIn,
            ),
          ),
          label: "",
        );

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.imagesLogo,
          width: 45,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.imagesShoppingCart),
          ),
          const SizedBox(width: 4),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Palette.yellow.shade200,
            ),
            onPressed: () {},
            icon: SvgPicture.asset(Assets.imagesUser),
          ),
        ],
      ),
      body: views[index],
      bottomNavigationBar: NavigationBar(
        destinations: [
          generateDestination(asset: Assets.imagesChefHat, idx: 0),
          generateDestination(asset: Assets.imagesShoppingBasket, idx: 1),
          generateDestination(asset: Assets.imagesUsers, idx: 2),
          generateDestination(asset: Assets.imagesLightbulb, idx: 3),
        ],
        selectedIndex: index,
        onDestinationSelected: setIndex,
      ),
    );
  }
}
