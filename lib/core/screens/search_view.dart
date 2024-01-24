import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/core/screens/error_screen.dart';
import 'package:facebook_clone/core/screens/loader.dart';
import 'package:facebook_clone/features/friends/presentation/widgets/friend_tile.dart';
import 'package:facebook_clone/features/friends/providers/get_all_friends_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends SearchDelegate<dynamic> {
  late TextEditingController _searchController;

  SearchView() {
    _searchController = TextEditingController();
  }

  @override
  String get searchFieldLabel => 'Search';

  @override
  TextStyle get searchFieldStyle => TextStyle(color: AppColors.blackColor);

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        filled: true,
        fillColor: AppColors.blueColor,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.black,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: theme.primaryTextTheme.headline6?.color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.blue),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.blue),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults(context);
  }

  Widget buildSearchResults(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // Fetch the friends list and filter based on the search query
        final friendsListState = ref.watch(getAllFriendsProvider);

        return friendsListState.when(
          data: (friends) {
            final filteredFriends = friends.where(
                (friend) => friend.toLowerCase().contains(query.toLowerCase()));

            return ListView.builder(
              itemCount: filteredFriends.length,
              itemBuilder: (context, index) {
                final userId = filteredFriends.elementAt(index);
                return FriendTile(
                  userId: userId,
                  onTap: () {
                    // Handle tap on friend tile
                  },
                );
              },
            );
          },
          loading: () {
            return Loader();
          },
          error: (error, stackTrace) {
            return ErrorScreen(error: error.toString());
          },
        );
      },
    );
  }
}
