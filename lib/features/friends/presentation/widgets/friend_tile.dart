import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/features/auth/providers/get_user_info_as_stream_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/screens/error_screen.dart';
import '/core/screens/loader.dart';
import '/core/screens/profile_screen.dart';

class FriendTile extends ConsumerWidget {
  const FriendTile({
    Key? key,
    required this.userId,
    required Null Function() onTap,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(getUserInfoAsStreamByIdProvider(userId));
    return userData.when(
      data: (user) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProfileScreen.routeName,
                arguments: userId,
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user.profilePicUrl),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.email,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return ErrorScreen(error: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }
}
