import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceIcons extends StatelessWidget {
  final String label;
  final String pic;
  final VoidCallback onTap;
  final Color? bColor;
  const DeviceIcons({
    super.key,
    required this.pic,
    required this.onTap,
    required this.label,
    this.bColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: bColor ?? Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: SvgPicture.asset(pic),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
