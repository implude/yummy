import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';

part 'cooking_class_content.freezed.dart';

@freezed
class CookingClassContent with _$CookingClassContent {
  const factory CookingClassContent({
    @Default([]) List<ItemContent> introduction,
    @Default([]) List<ItemContent> curriculum,
    @Default([]) List<ItemContent> instructor,
    @Default([]) List<ItemContent> review,
    @Default([]) List<ItemContent> recommendation,
  }) = _CookingClassContent;
}
