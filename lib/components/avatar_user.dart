import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/utils/format_url_local_api_image.dart';

class AvatarUser extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  // Constructor
  const AvatarUser({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(231, 0, 0, 01);

    return Center(
      child: Stack(children: [
        buildImage(color),
        Positioned(
          right: 4,
          top: 10,
          child: buildEditIcon(color),
        )
      ]),
    );
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = formatUrlLocalApiImage(imagePath);

    return Image.network(image);

    //return CircleAvatar(
    //  radius: 75,
    //  backgroundColor: color,
    //  child: CircleAvatar(
    //    radius: 70,
    //    child: Image.network(image,frameBuilder:),
    //  ),
    //);
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 8,
      child: Icon(
        Icons.edit,
        color: color,
        size: 20,
      ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
