import 'package:flutter/material.dart';
import 'package:absendigital/utils/colors.dart';

class BottomNavbarItem extends StatelessWidget {
  final bool isActive;
  final String imageUrl;

  BottomNavbarItem({this.imageUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        InkWell(
          onTap: () {},
          highlightColor: Color(0xfff5f6f7),
          child: Image.asset(imageUrl, width: 26),
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
