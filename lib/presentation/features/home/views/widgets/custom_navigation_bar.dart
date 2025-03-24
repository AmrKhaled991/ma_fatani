import 'package:flutter/material.dart';
import 'package:ma_fatani/presentation/features/home/views/home_view.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
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
              color: Colors.green.shade100.withOpacity(0.95),
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home),
                    iconSize: 40,
                  ),
                  const SizedBox(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
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
                radius: 25,
                child: IconButton(
                  onPressed: () {},
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
