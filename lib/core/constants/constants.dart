import 'package:facebook_clone/core/screens/menu_screen.dart';
import 'package:facebook_clone/core/screens/profile_screen.dart';
import 'package:facebook_clone/features/friends/presentation/screens/friends_screen.dart';
import 'package:facebook_clone/features/posts/presentation/screens/posts_screen.dart';
import 'package:facebook_clone/features/posts/presentation/screens/videos_screen.dart';
import 'package:flutter/material.dart';

class Constants {
  // Default padding for screens
  static const defaultPadding = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  );

  // demo profile urls
  static const String maleProfilePic =
      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png';

  static const String profilePicBlank =
      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png';

  static List<Tab> getHomeScreenTabs(int index) {
    return [
      Tab(
        icon: Icon(
          index == 0 ? Icons.home : Icons.home_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 1 ? Icons.group : Icons.group_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 2 ? Icons.smart_display : Icons.smart_display_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 3 ? Icons.account_circle : Icons.account_circle_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 5 ? Icons.density_medium : Icons.density_medium_outlined,
          color: Colors.blue,
        ),
      ),
    ];
  }

  static const List<Widget> screens = [
    PostsScreen(),
    FriendsScreen(),
    VideosScreen(),
    ProfileScreen(),
    Menu(),
  ];

  Constants._();
}
