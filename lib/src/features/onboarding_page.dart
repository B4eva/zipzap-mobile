import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zipzap/src/app_colors.dart';
import 'package:zipzap/src/features/authentication/login_page.dart';
import 'package:zipzap/src/reusable_widgets/logo_widget.dart';
import 'package:zipzap/src/reusable_widgets/zipzap_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> onboardingPages = [
    "ALL IN ONE",
    "Buy, Sell and Send Packages Nationwide On The Same Platform",
  ];

  int pageViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                LogoWidget(),
                Expanded(
                  child: PageView.builder(
                    itemCount: onboardingPages.length,
                    onPageChanged: (value) {
                      setState(() {
                        pageViewIndex = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Text(
                            onboardingPages[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20.0, color: AppColors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ...List.generate(
                    onboardingPages.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: pageViewIndex == index
                                ? AppColors.secondaryColor
                                : AppColors.white,
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                ZipzapButton(
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            child: Container(
              width: 130,
              height: 130,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 129, 126, 126),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 30,
            child: Container(
              width: 130,
              height: 130,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 234, 228, 228),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
