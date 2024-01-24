// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_clone/core/constants/app_colors.dart';
import 'package:facebook_clone/core/constants/extensions.dart';
import 'package:facebook_clone/core/screens/loader.dart';
import 'package:facebook_clone/core/screens/profile_screen.dart';
import 'package:facebook_clone/features/auth/providers/get_user_info_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';
// ... (imports)

// ... (imports)

class PostInfoTile<T> extends ConsumerWidget {
  const PostInfoTile({
    Key? key,
    required this.datePublished,
    required this.userId,
  }) : super(key: key);

  final DateTime datePublished;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoByIdProvider(userId));
    return userInfo.when(
      data: (user) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProfileScreen.routeName,
                    arguments: userId,
                  );
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicUrl),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    datePublished.fromNow(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: AppColors.darkGreyColor),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                ],
                color: AppColors.whiteColor,
                onSelected: (String value) async {
                  if (value == 'delete') {
                    // Show a confirmation dialog
                    bool confirmed =
                        (await showDeleteConfirmationDialog(context)) ?? false;

                    if (confirmed) {
                      // Delete the post from the 'posts' collection
                      await deletePost(context, userId);
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }

  // Helper function to show a confirmation dialog
  Future<bool?> showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // Helper function to delete the post from the 'posts' collection
  Future<void> deletePost(BuildContext context, String postId) async {
    try {
      print('Deleting post: $postId');
      final instance = FirebaseFirestore.instance; // but all deleted asww
      final batch = instance.batch();
      var collection = instance.collection('posts');
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }
      print('Post deleted successfully');
    } catch (error, stackTrace) {
      print('Error deleting post: $error');
      print('Stack trace: $stackTrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete post. Please try again.'),
        ),
      );
    }
  }
}
