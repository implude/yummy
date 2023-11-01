import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yummy/cooking_class/domain/cooking_class_content/cooking_class_content.dart';

part 'cooking_class.freezed.dart';

@freezed
class CookingClass with _$CookingClass {
  const CookingClass._();

  const factory CookingClass({
    required String image,
    required String name,
    required List<String> tags,
    required String? region,
    required int price,
    required int? remainPeople,
    required int? totalPeople,
    required int bookmarkCount,
    required int reviewCount,
    required String instructor,
    required CookingClassContent content,
  }) = _CookingClass;

  bool get isOnline => remainPeople == null && totalPeople == null;
}
