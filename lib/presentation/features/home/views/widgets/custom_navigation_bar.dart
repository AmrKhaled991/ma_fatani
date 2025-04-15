import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onAddTap;

  const CustomNavigationBar({
    super.key,
    required this.onHomeTap,
    required this.onSettingsTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: BottomNavClipper(),
            child: Card(
              //27AE60
              color: const Color(0xff27AE60),
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: onHomeTap,
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    iconSize: 40,
                  ),
                  const SizedBox(),
                  IconButton(
                    onPressed: onSettingsTap,
                    icon: const Icon(Icons.settings, color: Color(0xff2C3E50)),
                    iconSize: 40,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CircleAvatar(
                backgroundColor: const Color(0xffF1C40F),
                radius: 25,
                child: IconButton(
                  onPressed: onAddTap,
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Clipping the Bottom Navigation Bar
class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double notchRadius = 20; // Controls the notch size

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(width * 0.4 - notchRadius, 0)
      ..quadraticBezierTo(width * 0.5, 50, width * 0.6 + notchRadius, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
