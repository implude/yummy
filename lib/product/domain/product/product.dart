import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String image,
    required String name,
    required int price,
    required double? discount,
    required double rating,
    required int reviewCount,
    required List<ItemContent> contents,
  }) = _Product;
}
