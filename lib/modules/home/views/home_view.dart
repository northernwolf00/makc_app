import 'package:flutter/material.dart';
import 'package:makc_app/modules/home/widgets/booking_section.dart';
import 'package:makc_app/modules/home/widgets/carusel_section.dart';
import 'package:makc_app/modules/home/widgets/home_widgets.dart';
import 'package:makc_app/modules/home/widgets/promo_section.dart';
import 'package:makc_app/modules/home/widgets/your_place_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const HeroCarouselSection(),
              const YourPlacesSection(),
              const YourBookingsSection(),
              const PromoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
