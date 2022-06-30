// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_1_algo/widgets/c_u_button.dart';

import '../widgets/c_t_button.dart';
import '../widgets/c_text_form_field.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String? countryCode = '';
  IconData? valdeIcon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            //collapsedHeight: 100,
            primary: true,
            stretch: true,

            expandedHeight: size.size.height * 0.25,
            backgroundColor: const Color(0xFF9FD3D0),
            excludeHeaderSemantics: true,

            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/foood.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Welcome to 7Krave',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade500),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sign in',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                            CTButton(
                              btnText: 'Help',
                              iconData: Icons.question_mark,
                              onPressed: () {},
                              textColor: Colors.blueAccent,
                            )
                            // ignore: deprecated_member_use
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 20),
                        CTextFormField(
                          prefix: CountryCodePicker(
                            showFlag: false,
                            initialSelection: 'EG',
                            hideSearch: true,
                            onInit: (value) => countryCode = value!.dialCode,
                            onChanged: (value) => countryCode = value.dialCode,
                          ),
                          width: size.size.width * 0.95,
                          isMergedToAnotherBox: true,
                          validate: (val) {
                            if (val!.length >= 10) {
                              return null;
                            } else {
                              return 'Please enter valid  phone number';
                            }
                          },
                          suffix: valdeIcon,
                          type: TextInputType.phone,
                          label: 'ex.1026198131',
                          controller: phoneController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CUButton(
                          buttonColor: Colors.blueAccent,
                          buttonTextColor: Colors.white,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              valdeIcon = Icons.warning_amber_outlined;
                            }
                          },
                          buttonText: 'Sign In',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            '-Or-',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CUButton(
                          isIcon: true,
                          buttonColor: Colors.white,
                          borderColor: Colors.blueAccent,
                          iconAsset: 'assets/images/google.svg',
                          onPressed: () {},
                          buttonTextColor: Colors.blueAccent,
                          buttonText: 'Sign in by Google',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Doesn\'t have any account?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            CTButton(
                              btnText: 'Register here',
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName);
                              },
                              textColor: Colors.blueAccent,
                            )
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Use application according to policy rules, Any kinds of violations will be subject to sanctions.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
