import '/model/onboard.dart';
import '/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/action_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF77BDD7),
              Color(0xFFA7EBF4),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Container(child: onboardBody()),
      ),
      bottomSheet: isLastPage ? getStarted(context) : nextButton(),
    );
  }

  nextButton() {
    return Container(
      height: 60.0,
      color: const Color(0xFF77BDD7),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: screens.length,
              effect: const WormEffect(
                activeDotColor: Color(0xff256BF4),
                dotWidth: 16,
                radius: 10,
              ),
              onDotClicked: (index) => _controller.animateToPage(index,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOutExpo),
            ),
          ),
          InkWell(
            onTap: () => _controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutExpo,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Next",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getStarted(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF77BDD7),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ActionButton(
          label: "Get Started",
          callback: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
    );
  }

  PageView onboardBody() {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: _controller,
      itemCount: screens.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Lottie.asset(screens[index].path)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      screens[index].header,
                      style: const TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      screens[index].text,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      onPageChanged: (index) {
        setState(() {
          isLastPage = index == 2;
        });
      },
    );
  }
}
