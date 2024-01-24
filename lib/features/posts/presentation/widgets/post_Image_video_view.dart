import 'package:flutter/material.dart';

import '/features/posts/presentation/widgets/network_video_view.dart';

class PostImageVideoView extends StatelessWidget {
  const PostImageVideoView({
    Key? key,
    required this.fileType,
    required this.fileUrl,
  }) : super(key: key);

  final String fileType;
  final String fileUrl;

  @override
  Widget build(BuildContext context) {
    if (fileType == 'image') {
      return Image.network(fileUrl);
    } else {
      return NetworkVideoView(
        videoUrl: fileUrl,
      );
    }
  }
}

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  static const routeName = '/image-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
