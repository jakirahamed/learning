import 'package:flutter/material.dart';
import 'package:learning/model/notemodel.dart';
import 'package:learning/page/account/account.dart';
import 'package:learning/page/bottom_nav.dart';
import 'package:learning/page/cart/cart.dart';
import 'package:learning/page/featured/featured.dart';
import 'package:learning/page/note_info.dart';
import 'package:learning/page/search/search.dart';
import 'package:learning/page/wishlist/wishlist.dart';

class Routes {
  static Route<dynamic> generate(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case BottomNavBar.routeName:
        return MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        );
      case FeaturedPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const FeaturedPage(),
        );
      case SearchPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SearchPage(),
        );
      // case MyLearningPage.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const MyLearningPage(),
      //   );
      case WishlistPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const WishlistPage(),
        );
      case AccountPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AccountPage(),
        );
      case CartPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      case NoteInfo.routename:
        if (arg is NoteModel) {
          return MaterialPageRoute(
            builder: (context) => NoteInfo(noteModel: arg),
          );
        } else {
          return error();
        }

      default:
        return error();
    }
  }

  static Route<dynamic> error() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text("error")),
      ),
    );
  }
}
