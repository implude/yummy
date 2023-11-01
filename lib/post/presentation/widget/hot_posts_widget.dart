import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interlist/interlist.dart';
import 'package:yummy/common/palette.dart';
import 'package:yummy/core/presentation/view/banner_image.dart';
import 'package:yummy/post/domain/post.dart';

class HotPostsWidget extends StatelessWidget {
  final List<Post> posts;

  const HotPostsWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            "지금 핫한 글",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Palette.blackLike,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              for (final post in posts) _HotPostWidget(post: post),
            ].interList(const SizedBox(width: 20)),
          ),
        )
      ],
    );
  }
}

class _HotPostWidget extends StatelessWidget {
  final Post post;

  const _HotPostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/post", extra: post),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BannerImage(asset: post.image!),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
