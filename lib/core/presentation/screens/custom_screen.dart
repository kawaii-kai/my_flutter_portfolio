import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/font_manager.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key, required this.appBarText, required this.body});
  final String appBarText;
  final Widget body;

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              widget.appBarText,
              style: const TextStyle(
                fontFamily: FontManager.fontFamily,
                fontSize: FontSize.s20,
                fontWeight: FontWeightManager.semiBold,
              ),
            ),
          ),
        ),
      ),
      body: widget.body,
    );
  }
}
