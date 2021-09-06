import 'package:bingo/utils/colors.dart';
import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  final String imgUrl;
  final double size;
  Img({
    Key? key,
    required this.imgUrl,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Material(
      child: (imgUrl != 'null')
          ? Image.network(
              imgUrl,
              fit: BoxFit.cover,
              width: size,
              height: size,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: size,
                  height: size,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.PrimaryColor,
                      value: loadingProgress.expectedTotalBytes != null &&
                              loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, object, stackTrace) {
                return Icon(
                  Icons.account_circle,
                  size: size,
                  color: Colors.white,
                );
              },
            )
          : Icon(
              Icons.account_circle,
              size: size,
              color: Colors.white,
            ),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
      clipBehavior: Clip.hardEdge,
    );
  }
}
