import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String title,
    required String? image,
    required int likeCount,
    required int bookmarkCount,
    required int commentCount,
    required DateTime at,
    required String author,
    required List<ItemContent> contents,
  }) = _Post;
}
