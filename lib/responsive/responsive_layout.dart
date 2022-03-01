import 'package:flutter/material.dart';
import 'package:instagram/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webResponsive;
  final Widget mobileResponsive;

  const ResponsiveLayout(
      {Key? key, required this.webResponsive, required this.mobileResponsive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth > webScreenSize) {
          return webResponsive;
        }
        return mobileResponsive;
      },
    );
  }
}
