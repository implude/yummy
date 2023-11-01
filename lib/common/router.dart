import 'package:go_router/go_router.dart';
import 'package:yummy/cooking_class/domain/cooking_class/cooking_class.dart';
import 'package:yummy/cooking_class/presentation/view/cooking_class_details_view.dart';
import 'package:yummy/core/presentation/view/main_view.dart';
import 'package:yummy/post/domain/post.dart';
import 'package:yummy/post/presentation/view/post_details_view.dart';
import 'package:yummy/product/domain/product/product.dart';
import 'package:yummy/product/presentation/view/product_details_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainView(),
      routes: [
        GoRoute(
          path: "product",
          builder: (context, state) => ProductDetailsView(
            product: state.extra as Product,
          ),
        ),
        GoRoute(
          path: "cooking-class",
          builder: (context, state) => CookingClassDetailsView(
            cookingClass: state.extra as CookingClass,
          ),
        ),
        GoRoute(
          path: "post",
          builder: (context, state) => PostDetailsView(
            post: state.extra as Post,
          ),
        ),
      ],
    ),
  ],
);
