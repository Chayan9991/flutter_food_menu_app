
import 'package:cafe_menu/Features/home/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';

import '../../../Core/Config/Routes/app_routes.dart';
import '../../../Core/Theme/app_palette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _titleAnimation;
  late final Animation<Offset> _descriptionAnimation;
  late final Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Title animation (slower movement)
    _titleAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen (bottom)
      end: Offset.zero, // End at the original position
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Description animation (faster movement)
    _descriptionAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5), // Start further off-screen
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Button animation (faster movement)
    _buttonAnimation = Tween<Offset>(
      begin: const Offset(0, 1.7), // Start further off-screen
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animations
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppPalette.darkShadeBlack,
      body: Stack(
        children: [
          // Background Image with Opacity
          SizedBox(
            height: size.height,
            width: size.width,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
              child: Image.asset(
                "assets/images/splash_image4.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Animated Text Section
          Positioned(
            bottom: 45,
            left: 30,
            right: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Text Animation
                SlideTransition(
                  position: _titleAnimation,
                  child: Text(
                    "Pico: A Slice of Heaven, A Sip of Bliss",
                    textAlign: TextAlign.center,
                    style: _textStyle(
                      color: AppPalette.primaryBackgroundColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Space between title and description
                // Description Text Animation
                SlideTransition(
                  position: _descriptionAnimation,
                  child: Text(
                    "Elevate your everyday with Pico's culinary creations. "
                    "From gourmet pizzas to handcrafted coffees, every bite is a masterpiece.",
                    textAlign: TextAlign.center,
                    style: _textStyle(
                      color: AppPalette.primaryBackgroundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                // Space between description and button
                SlideTransition(
                  position: _buttonAnimation,
                  child: GestureDetector(
                    onTap: (){
                      AppRoutes.pushReplacement(context, const HomePage());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppPalette.tealGreen,
                      ),
                      child:  Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: AppPalette.primaryBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Text Style Helper Method
  TextStyle _textStyle({
    required Color color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 1.3,
    );
  }
}
