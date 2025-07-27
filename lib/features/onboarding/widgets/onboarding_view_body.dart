import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPage = 0;
  int pageLength = 2;
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      final page = _pageController.page;

      if (page == null) return;

      final newPage = page.round();

      if (currentPage != newPage) {
        setState(() {
          currentPage = newPage;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (value) => setState(() => currentPage = value),

            children: [
              PageViewItem(
                image: 'assets/images/onboarding1.png',
                title: 'Buy Grocery',
                subtitle:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
              ),
              PageViewItem(
                image: 'assets/images/onboarding1.png',
                title: 'Fast Delivery',
                subtitle:
                    'Lorem ipsum dolor sit amet, consetetur  sadipscing elitr, sed diam nonumy',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/home');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: const Color(0xFFC4C4C4),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: pageLength,
                position: currentPage.toDouble(),
                decorator: DotsDecorator(
                  activeColor: const Color.fromRGBO(105, 240, 174, 1),
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentPage < pageLength - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: const Color(0xFF6CC51D),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 100),
      ],
    );
  }
}

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 133),
        Image.asset(image),
        SizedBox(height: 50),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.75,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          width: 320,
          height: 46,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF868889),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.45,
            ),
          ),
        ),
      ],
    );
  }
}
