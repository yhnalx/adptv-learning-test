import 'package:app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _stepInPage1 = 0;

  void _nextPage() {
    if (_currentPage == 1 && _stepInPage1 == 0) {
      setState(() {
        _stepInPage1 = 1;
      });
      return;
    }

    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(Routes.ANALYZING);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0055FF),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _stepInPage1 = 0;
              });
            },
            itemBuilder: (context, index) {
              return SafeArea(
                child: SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0) ...[
                          const Spacer(),
                          const Text(
                            'Welcome to your adaptive learning.',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Learn smarter\nNot Harder!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              height: 1.2,
                            ),
                          ),
                          const Spacer(),
                        ],
                        if (index == 1 && _stepInPage1 == 0) ...[
                          const Spacer(),
                          const Text(
                            'Getting Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Before we start, please take a moment to\ncomplete our assessment questionnaire.\nThis will help us understand your learning\nstyle and create a personalized\nexperience just for you.',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          const Spacer(),
                        ],
                        if (index == 1 && _stepInPage1 == 1) ...[
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(0, 60, 0, 24),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  'Basketball',
                                  'Soccer',
                                  'Dancing',
                                  'Writing',
                                  'Volleyball',
                                  'Journalism',
                                  'Mobile Games',
                                  'Others',
                                ]
                                    .map((hobby) => Chip(
                                          label: Text(hobby),
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: const BoxDecoration(
                              color: Color(0xFF0055FF),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Let’s get to know each other",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "What are your\nFavorite Hobbies?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Before we start, please take a moment to\ncomplete our assessment questionnaire.\nThis will help us understand your learning style\nand create a personalized experience just for you.",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                        if (index == 2) ...[
                          const Spacer(),
                          const Text(
                            'Let\'s get to know each other',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Do you learn best when\ninformation is presented\nin charts or diagrams?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomContainer(icons: Icons.thumb_up),
                              SizedBox(width: 10),
                              CustomContainer(icons: Icons.thumb_down),
                            ],
                          ),
                          const Spacer(),
                        ],
                        if (index == 3) ...[
                          const Spacer(),
                          const Text(
                            'Let\'s get to know each other',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Do you remember\ninformation better when you hea it spoken or\ndiscussed?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CustomContainer(icons: Icons.thumb_up),
                              SizedBox(width: 10),
                              CustomContainer(icons: Icons.thumb_down),
                            ],
                          ),
                          const Spacer(),
                        ]
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Dot Indicator
          Positioned(
            bottom: 30,
            left: 24,
            child: Row(
              children: List.generate(4, (index) {
                bool isActive = index == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 6),
                  height: 8,
                  width: isActive ? 24 : 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
          ),

          // Next / Let's Go button
          Positioned(
            bottom: 24,
            right: 24,
            child: GestureDetector(
              onTap: _nextPage,
              child: Row(
                children: [
                  Text(
                    (_currentPage == 3) ? 'Let\'s Go' : 'Next',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    (_currentPage == 3)
                        ? Icons.check_circle_outline
                        : Icons.double_arrow,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CustomContainer
class CustomContainer extends StatefulWidget {
  final IconData icons;

  const CustomContainer({
    super.key,
    required this.icons,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool _isSelected = false;

  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleSelected,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue.shade900 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF0055FF)),
        ),
        child: Center(
          child: Icon(
            widget.icons,
            color: _isSelected ? Colors.white : const Color(0xFF0055FF),
          ),
        ),
      ),
    );
  }
}
