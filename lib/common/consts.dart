import 'package:intl/intl.dart';
import 'package:yummy/cooking_class/domain/cooking_class/cooking_class.dart';
import 'package:yummy/cooking_class/domain/cooking_class_content/cooking_class_content.dart';
import 'package:yummy/core/domain/item_content/item_content.dart';
import 'package:yummy/generated/assets.dart';
import 'package:yummy/post/domain/post.dart';
import 'package:yummy/product/domain/product/product.dart';
import 'package:yummy/user/domain/user/user.dart';

const kFontFamily = "Pretendard";

final kDateFormat = DateFormat("yyyy.M.d");

const kOfflineClassRegions = [
  "서울",
  "인천 / 경기",
  "대전",
  "대구",
  "부산",
  "광주",
  "울산",
  "강원",
  "충북",
  "충남",
  "전북",
  "전남",
  "경북",
  "경남",
  "제주",
];

const kProductCategories = ["식용유", "고기", "채소", "주방용품", "키워드"];

const kPostSorts = ["최신순", "인기순"];

const kCookingClassContentHeaderNames = ["클래스 소개", "커리큘럼", "강사", "후기", "추천"];

const kOfflinePopularCookingClasses = [
  CookingClass(
    image: Assets.classBaby,
    name: "우리 아이와 함께하는 요리 수업",
    tags: ["아이", "가족"],
    region: "강남구 압구정동",
    price: 68000,
    remainPeople: 10,
    totalPeople: 14,
    bookmarkCount: 50,
    reviewCount: 50,
    instructor: "박지윤",
    content: CookingClassContent(
      introduction: [
        ItemContent.text("안녕하세요, 여러분~!"),
        ItemContent.image(Assets.classChildrenContent),
        ItemContent.text(
            " 저는 현재 두 아이를 둔 엄마입니다. 저희 첫째 딸은 올해로 초1이 되어 이제 막 학교를 보냈고, 둘째 아들은 5살이랍니다."),
        ItemContent.image(Assets.classSnackContent),
        ItemContent.text(
            " 저는 어린 우리 아이들을 위해 간식을 항상 해주곤 하는데요 ‘우리 아이와 함께하는 요리 수업’에서는 거는 쉽고 간단하게 우리 아이들을 행복하게 해줄 수 있는 간식 몇 가지를 배워보도록 할 거예요! 간단한 튀김류부터 시작해서 머핀이나 와플 등 디저트류도 배워볼 예정입니다!"),
      ],
      curriculum: [
        ItemContent.text(
            "커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼\n커리큘럼")
      ],
      instructor: [
        ItemContent.text(
            "강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사\n강사")
      ],
      review: [
        ItemContent.text(
            "후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기\n후기"),
      ],
      recommendation: [
        ItemContent.text(
            "추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천\n추천"),
      ],
    ),
  ),
  CookingClass(
    image: Assets.classMeet,
    name: "고굽남",
    tags: ["고기", "키워드"],
    region: "강남구 압구정동",
    price: 48000,
    remainPeople: 8,
    totalPeople: 10,
    bookmarkCount: 40,
    reviewCount: 40,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
];

const kOfflineCustomCookingClasses = <CookingClass>[
  CookingClass(
    image: Assets.classDiet,
    name: "다이어트 필수 음식\n3종 샐러드 모음",
    tags: ["샐러드", "다이어트"],
    region: "강남구 역삼2동",
    price: 43000,
    remainPeople: 5,
    totalPeople: 8,
    bookmarkCount: 13,
    reviewCount: 20,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classBreakfast,
    name: "든든한 조식 만들기",
    tags: ["조식", "든든한"],
    region: "강남구 신사동",
    price: 38000,
    remainPeople: 20,
    totalPeople: 24,
    bookmarkCount: 60,
    reviewCount: 30,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classHome,
    name: "집들이 음식 모음",
    tags: ["집들이", "게스트"],
    region: "강남구 압구정동",
    price: 64000,
    remainPeople: 5,
    totalPeople: 8,
    bookmarkCount: 14,
    reviewCount: 1,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classCooking,
    name: "쿠킹클래스",
    tags: ["코스요리", "힐링"],
    region: "강남구 논현1동",
    price: 98000,
    remainPeople: 10,
    totalPeople: 20,
    bookmarkCount: 30,
    reviewCount: 40,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
];

const kOnlinePopularCookingClasses = [
  CookingClass(
    image: Assets.classCamping,
    name: "집에서 캠핑하기",
    tags: ["캠핑", "바베큐"],
    region: null,
    price: 45000,
    remainPeople: null,
    totalPeople: null,
    bookmarkCount: 50,
    reviewCount: 50,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classOverseas,
    name: "해외여행 간 줄",
    tags: ["파스타", "키워드"],
    region: null,
    price: 38000,
    remainPeople: null,
    totalPeople: null,
    bookmarkCount: 40,
    reviewCount: 40,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
];

const kOnlineCustomCookingClasses = [
  CookingClass(
    image: Assets.classPasta,
    name: "토마토 스파게티, 이탈리아 현지의 맛",
    tags: ["토마토", "스파게티"],
    region: null,
    price: 38000,
    remainPeople: null,
    totalPeople: null,
    bookmarkCount: 40,
    reviewCount: 40,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classRestaurant,
    name: "우리 집이 레스토랑",
    tags: ["집에서", "3스타"],
    region: null,
    price: 68000,
    remainPeople: null,
    totalPeople: null,
    bookmarkCount: 50,
    reviewCount: 50,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classMother,
    name: "우리 엄마 집밥st",
    tags: ["집밥", "엄마손맛"],
    region: null,
    price: 38000,
    remainPeople: null,
    totalPeople: null,
    bookmarkCount: 40,
    reviewCount: 40,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
  CookingClass(
    image: Assets.classSnack,
    name: "초간단 안주 만들기",
    tags: ["안주", "야식"],
    region: null,
    price: 38000,
    remainPeople: null,
    totalPeople: null,
    bookmarkCount: 40,
    reviewCount: 40,
    instructor: "박지윤",
    content: CookingClassContent(),
  ),
];

const kSpecialPriceProducts = [
  Product(
    image: Assets.productCarrot,
    name: "국내산 산지직송 유기농 당근 2kg ",
    price: 13700,
    discount: 0.6,
    rating: 5,
    reviewCount: 14285,
    contents: [
      ItemContent.text(" 이번 당근은 신선하고 안전한 국내산 유기농 당근 2kg으로 구성되었습니다."),
      ItemContent.image(Assets.productCarrotContent),
      ItemContentText("""자연에서 키워진 당근을 최대한 신선한 상태로 직접 고객님께 전달하는 것이 목표입니다.

이 제품은 환경을 고려한 유기농 재배 방식을 통해 안전하고 건강한 먹거리를 제공합니다.

주의사항:
- 냉장보관을 권장합니다.
- 햇볕과 습기를 피해 서늘한 곳에 보관해 주세요.
- 유통기한을 확인하고 신선도를 유지하기 위해 빠른 소비를 권장합니다.
      """),
    ],
  ),
  Product(
      image: Assets.productCarrot,
      name: "국내산 산지직송 유기농 당근 2kg ",
      price: 13700,
      discount: 0.6,
      rating: 1.2,
      reviewCount: 14285,
      contents: []),
];

const kProducts = [
  Product(
    image: Assets.productCanolaOil,
    name: "카놀라유",
    price: 10000,
    discount: null,
    rating: 4.3,
    reviewCount: 4285,
    contents: [],
  ),
  Product(
    image: Assets.productOliveOil,
    name: "올리브유",
    price: 10000,
    discount: null,
    rating: 4.8,
    reviewCount: 8285,
    contents: [],
  ),
  Product(
    image: Assets.productGrapeseedOil,
    name: "포도씨유",
    price: 10000,
    discount: null,
    rating: 3.5,
    reviewCount: 1394,
    contents: [],
  ),
  Product(
    image: Assets.productSunflowerSeedOil,
    name: "해바라기씨유",
    price: 10000,
    discount: null,
    rating: 4.0,
    reviewCount: 3285,
    contents: [],
  ),
];

final kHotPosts = [
  Post(
    title: "*단백질 음식 조리 시 주의법!",
    image: Assets.postProtein,
    likeCount: 50,
    bookmarkCount: 50,
    commentCount: 50,
    at: DateTime(2023, 9, 19),
    author: "집밥의 달인",
    contents: const [
      ItemContent.image(Assets.postProtein),
    ],
  ),
  Post(
    title: "나만의 꿀팀ㅋㅋ",
    image: Assets.postProtein,
    likeCount: 50,
    bookmarkCount: 50,
    commentCount: 50,
    at: DateTime(2023, 9, 19),
    author: "집밥의 달인",
    contents: const [
      ItemContent.image(Assets.postProtein),
    ],
  ),
];

final kPosts = [
  Post(
    title: "단백질 음식 조리 시 주의법",
    image: Assets.postProtein,
    likeCount: 50,
    bookmarkCount: 50,
    commentCount: 50,
    at: DateTime(2023, 9, 19),
    author: "집밥의 달인",
    contents: const [
      ItemContent.image(Assets.postProtein),
      ItemContent.text("단백질 음식을 조리할 때 중요한 점은 올바른 익힘 시간과 온도를 지키는 것이 중요 합니다"),
    ],
  ),
  Post(
    title: "생선 요리 꿀팁!",
    image: null,
    likeCount: 50,
    bookmarkCount: 50,
    commentCount: 50,
    at: DateTime(2023, 9, 19),
    author: "요리왕 비룡",
    contents: const [
      ItemContent.text(
          "생선을 조리할 때는 깨끗이 손질하고, 양념이 잘 배도록 표면에 살짝 소금을 뿌려 둔 후 조리하면 맛이 풍부해집니다. 또한, 신선한 재료를 사용 하는 것이 중요 합니다"),
    ],
  ),
];

const kUser = User(name: "김석환");
