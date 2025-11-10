import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _textController;
  late Animation<double> _scaleAnimation;

  String fullText = "FinanceApp";
  String displayedText = "";

  @override
  void initState() {
    super.initState();

    // Animasi gambar
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scaleAnimation =
        CurvedAnimation(parent: _imageController, curve: Curves.easeOutBack);

    _imageController.forward();

    // Animasi huruf muncul satu per satu
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    int index = 0;
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (index < fullText.length) {
        setState(() {
          displayedText += fullText[index];
        });
        index++;
      } else {
        timer.cancel();
        _textController.forward();
      }
    });
    
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 113, 198, 255),
              Color.fromARGB(255, 134, 197, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _scaleAnimation,
                  child: Image.asset(
                    'assets/images/bank.png', 
                    width: 260,
                    height: 260,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              FadeTransition(
                opacity: _textController,
                child: Text(
                  displayedText,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        blurRadius: 12,
                        color: Colors.black38,
                        offset: Offset(2, 3),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
