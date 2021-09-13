import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class ShadowAppBarButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onClicked;
  const ShadowAppBarButton({
    Key? key,
    required this.icon,
    this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            blurRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          child: IconButton(
            onPressed: onClicked,
            icon: Icon(
              icon,
              color: kDarkColor,
              size: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
