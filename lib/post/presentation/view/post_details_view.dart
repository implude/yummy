import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';
import 'package:yummy/core/presentation/widget/app_back_button.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/post/domain/post.dart';

class PostDetailsView extends StatelessWidget {
  final Post post;

  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: _PostDetailsLayout(post: post),
      ),
    );
  }
}

class _PostDetailsLayout extends StatelessWidget {
  final Post post;

  const _PostDetailsLayout({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            post.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.yellow.shade200,
                ),
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset(Assets.imagesUser),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.author,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Palette.yellow.shade900,
                    ),
                  ),
                  Text(
                    kDateFormat.format(post.at),
                    style: const TextStyle(color: Palette.grayDark),
                  ),
                ],
              ),
              const Expanded(child: SizedBox.shrink()),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.yellow,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  visualDensity: VisualDensity.comfortable,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 20,
                ),
                label: const Text("팔로우"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          child: Row(
            children: <Widget>[
              _IconWithText(
                asset: Assets.imagesHeart,
                value: post.likeCount,
              ),
              _IconWithText(
                asset: Assets.imagesBookmark,
                value: post.bookmarkCount,
              ),
              _IconWithText(
                asset: Assets.imagesComment,
                value: post.commentCount,
              ),
            ].interList(const SizedBox(width: 8)),
          ),
        ),
        const SizedBox(height: 12),
        const Divider(
          color: Palette.gray,
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.5),
          child: Column(
            children: [
              for (final content in post.contents)
                switch (content) {
                  ItemContentText(text: var text) => Text(
                      text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ItemContentImage(image: var image) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(image),
                    ),
                }
            ].interList(const SizedBox(height: 16)),
          ),
        )
      ],
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
        SvgPicture.asset(asset),
        const SizedBox(width: 4),
        Text(
          "$value",
          style: const TextStyle(color: Palette.grayDark),
        ),
      ],
    );
  }
}
