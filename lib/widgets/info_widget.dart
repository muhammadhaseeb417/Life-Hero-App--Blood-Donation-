import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final String imgPath;
  const InfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imgPath.isEmpty
              ? Icon(iconData, size: 70, color: Colors.red)
              : const SizedBox(),
          imgPath.isNotEmpty
              ? Image.asset(
                  imgPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              : const SizedBox(height: 0),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: const TextStyle(fontSize: 15, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
