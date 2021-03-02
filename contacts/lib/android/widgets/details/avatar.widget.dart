import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String image;

  const AvatarWidget({
    @required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(
          width: 10,
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
