// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/cubit/onboarding_cubit.dart';
import '../widgets/c_button.dart';
import '../widgets/c_t_button.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = OnboardingCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CButton(
                          onPressed: () {
                            if (bloc.currentPageIndex ==
                                (bloc.onBoardingPageImages.length - 1)) {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routeName);
                            } else {
                              bloc.goToLastPage();
                            }
                          },
                          width: 80,
                          radius: 15,
                          btnText: 'Skip',
                          textColor: Color(0xFF000000),
                          btnColor: Color(0xfaf2e7dd),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Hello ',
                      children: const [
                        TextSpan(
                            text: '7',
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xffe2bc8a),
                            )),
                        TextSpan(
                            text: 'Krave',
                            style: TextStyle(
                              color: Color(0xff51afab),
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: PageView.builder(
                      controller: bloc.controller,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        bloc.currentPageIndex = value;
                        bloc.refresh();
                      },
                      itemCount: bloc.onBoardingPageImages.length,
                      itemBuilder: (ctx, i) => Column(
                        children: [
                          SvgPicture.asset(
                              fit: BoxFit.cover,
                              height: 200,
                              bloc.onBoardingPageImages[i]),
                          SizedBox(height: 12),
                          Text(
                            //'Buy any food from your favorite restaurant'
                            bloc.onBoardingPageTitle[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(height: 12),
                          Text(
                            //'We are constantly adding your favourite restaurant throughout the territory and around your area carfully selected'
                            bloc.onBoardingPageContent[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade500),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(bloc.onBoardingPageImages.length,
                          (index) => buildDot(index, bloc.currentPageIndex))),
                  SizedBox(height: 10),
                  CButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    btnText: 'Get Started',
                    btnColor: Color(0xff51afab),
                    radius: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      CTButton(
                          btnText: 'Sign Up',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          },
                          textColor: Color(0xff51afab))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildDot(index, currentIndex) {
  // Another Container returned
  return Container(
    height: 5,
    width: 10,
    margin: EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: index == currentIndex
            ? Color(0xffe2bc8a)
            : Color(0xffe8e8e8) //Color(0xfaf2e7dd),
        ),
  );
}
