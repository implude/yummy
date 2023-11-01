import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/common/states.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/post/presentation/widget/hot_posts_widget.dart';
import 'package:yummy/post/presentation/widget/posts_widget.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _PostLayout(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF2C73A),
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(Assets.imagesPenSquare),
        ),
      ),
    );
  }
}

class _PostLayout extends StatelessWidget {
  const _PostLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: "궁금한 정보를 검색하세요.",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesSearch),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        HotPostsWidget(posts: kHotPosts),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.only(left: 4),
          child: _PostSortingDropdown(),
        ),
        PostsWidget(posts: kPosts),
      ],
    );
  }
}

class _PostSortingDropdown extends HookWidget {
  const _PostSortingDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final (selectedSorting, setSelectedSorting) =
        useState(kPostSorts[0]).destructed;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.gray,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          value: selectedSorting,
          icon: const Icon(Icons.keyboard_arrow_down),
          iconEnabledColor: Palette.gray,
          style: const TextStyle(color: Palette.gray),
          dropdownColor: Colors.white,
          items: [
            for (final sorting in kPostSorts)
              DropdownMenuItem(
                value: sorting,
                child: Text(sorting),
              ),
          ],
          onChanged: (value) {
            if (value != null) {
              setSelectedSorting(value);
            }
          },
        ),
      ),
    );
  }
}
