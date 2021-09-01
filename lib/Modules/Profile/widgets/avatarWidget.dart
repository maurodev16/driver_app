import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String driverAvatarUrl;
  final VoidCallback onClicked;
  const AvatarWidget({
    Key? key,
    required this.driverAvatarUrl,
    required this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
        child: Stack(
      children: [
        buildImage(),
        Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(color),
        )
      ],
    ));
  }

  buildImage() {
    final image = NetworkImage(driverAvatarUrl);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            CupertinoIcons.pencil_circle_fill,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      );

  buildCircle({
    required Color color,
    required double all,
    required Widget child,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
