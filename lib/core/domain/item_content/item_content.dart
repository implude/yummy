import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_content.freezed.dart';

sealed class ItemContent {
  const ItemContent._();

  const factory ItemContent.text(String text) = ItemContentText;

  const factory ItemContent.image(String image) = ItemContentImage;
}

@freezed
class ItemContentText extends ItemContent with _$ItemContentText {
  const factory ItemContentText(String text) = _ItemContentText;
}

@freezed
class ItemContentImage extends ItemContent with _$ItemContentImage {
  const factory ItemContentImage(String image) = _ItemContentImage;
}
