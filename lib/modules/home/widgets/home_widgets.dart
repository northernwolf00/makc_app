import 'package:flutter/material.dart';
import 'package:makc_app/global_widgets/custom_icon.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Text('👋', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8),
              Text(
                'Hi, Allamyrat!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CustomIcon(
              title: 'assets/icons/i1.svg',
              height: 28,
              width: 28,
              color: Colors.black)
        ],
      ),
    );
  }
}
