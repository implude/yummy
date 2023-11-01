import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/consts.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/post/domain/post.dart';

class PostsWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (final post in posts)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _PostWidget(post: post),
          ),
      ].interList(
        const Divider(
          color: Palette.gray,
          height: 32,
        ),
      ),
    );
  }
}

class _PostWidget extends StatelessWidget {
  final Post post;

  const _PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final contentText =
        post.contents.whereType<ItemContentText>().firstOrNull?.text;

    return GestureDetector(
      onTap: () => context.push("/post", extra: post),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 4,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Palette.yellow.shade200,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: SvgPicture.asset(
                    Assets.imagesUser,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  post.author,
                  style: const TextStyle(
                    color: Palette.grayDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                Text(
                  kDateFormat.format(post.at),
                  style: const TextStyle(
                    color: Palette.gray,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (contentText != null) ...[
                      AutoSizeText(
                        contentText,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Palette.gray,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Row(
                        children: [
                          _PostIconText(
                            asset: Assets.imagesHeart,
                            value: post.likeCount,
                          ),
                          const SizedBox(width: 20),
                          _PostIconText(
                            asset: Assets.imagesBookmark,
                            value: post.bookmarkCount,
                          ),
                          const SizedBox(width: 20),
                          _PostIconText(
                            asset: Assets.imagesComment,
                            value: post.commentCount,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (post.image != null) ...[
                const SizedBox(width: 54),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(
                    post.image!,
                    width: 112,
                    height: 112,
                    fit: BoxFit.cover,
                  ),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}

class _PostIconText extends StatelessWidget {
  final String asset;
  final int value;

  const _PostIconText({super.key, required this.asset, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(asset),
        const SizedBox(width: 4),
        Text(
          "$value",
          style: const TextStyle(
            color: Palette.grayDark,
          ),
        )
      ],
    );
  }
}
