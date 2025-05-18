import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static const ScreenRoute = '/intro-screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  bool _animate = false;
  bool _showButton = false;
  late AnimationController _buttonController;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _animate = true;
        });
      }
    });

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showButton = true;
          _buttonController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Image.asset(
            'assets/images/wallpaperflare.com_wallpaper(4).jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // تأثير البلور
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            // child: Container(color: const Color.fromRGBO(0, 0, 0, 0)),
          ),

          // محتوى الصفحة بأنيميشن
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromRGBO(0, 0, 0, 0.7), Colors.transparent],
              ),
            ),
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            height: double.infinity,
            child: AnimatedSlide(
              offset: _animate ? Offset.zero : const Offset(-1.0, 0.0),
              duration: const Duration(seconds: 10),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: _animate ? 1.0 : 0.0,
                duration: const Duration(seconds: 10),
                curve: Curves.easeIn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Maktabati,\nYour journey into knowledge begins here",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Color(0xFFFFE082),
                        fontSize: 25,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Discover timeless books, expand your world, and feed your curiosity—one page at a time. Whether you're seeking wisdom, adventure, or inspiration, your next favorite read is just a tap away.\nRead anywhere. Learn anytime",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Sora",
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // الزر مع الانيميشن بعد ثانية
      floatingActionButton: FadeTransition(
        opacity: _buttonController,
        child:
            _showButton
                ? FloatingActionButton(
                  backgroundColor: Color(0xFF4A3F35),
                  shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(TabsScreen.screenRoute);
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFD4A373),
                  ),
                )
                : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
