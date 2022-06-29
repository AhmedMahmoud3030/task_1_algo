// ignore_for_file: use_key_in_widget_constructors, avoid_print, must_be_immutable

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/auth_cubit.dart';
import '../widgets/c_button.dart';
import '../widgets/c_i_button.dart';
import '../widgets/c_i_t_button.dart';
import '../widgets/c_t_button.dart';
import '../widgets/c_text_form_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register-screen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String? countryCode = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                //collapsedHeight: 100,
                primary: true,
                stretch: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.25,
                backgroundColor: const Color(0xFF9FD3D0),
                excludeHeaderSemantics: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
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
                                  'Register',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                ),
                                CITButton(
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
                              'Email',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade700),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: CTextFormField(
                                validate: (val) {
                                  if (val!.contains('@') &&
                                      val.contains('.com')) {
                                    return null;
                                  } else {
                                    return 'Please enter valide email';
                                  }
                                },
                                type: TextInputType.emailAddress,
                                controller: emailController,
                                label: 'ahmed.elbeah@gmail.com',
                              ),
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
                                onInit: (value) =>
                                    countryCode = value!.dialCode,
                                onChanged: (value) =>
                                    countryCode = value.dialCode,
                              ),
                              width: MediaQuery.of(context).size.width * 0.95,
                              isMergedToAnotherBox: true,
                              validate: (val) {
                                if (val!.length >= 10) {
                                  return null;
                                } else {
                                  return 'Please enter valide phone number';
                                }
                              },
                              type: TextInputType.phone,
                              label: 'ex.1026198131',
                              controller: phoneController,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade700),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: CTextFormField(
                                validate: (val) {
                                  if (val!.length <= 5 && val.contains('_')) {
                                    return null;
                                  } else {
                                    return 'Please enter valide Password';
                                  }
                                },
                                isPassword: cubit.suffixVisibility,
                                suffix: cubit.suffixVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                suffixPressed: () {
                                  cubit.toggleVisibility();
                                },
                                controller: passwordController,
                                label: 'ex.123456',
                                type: TextInputType.visiblePassword,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  //!do Sign in
                                }
                              },
                              btnText: 'Register',
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
                            CIButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  //!do Sign in
                                }
                              },
                              txtColor: Colors.blueAccent,
                              btnText: 'Sign in by Google',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  ' have any account?',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                CTButton(
                                  btnText: 'Sign in here',
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        LoginScreen.routeName);
                                  },
                                  textColor: Colors.blueAccent,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'by registering you agree to the  ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade400),
                                ),
                                CTButton(
                                    btnText: 'terms and conditions',
                                    textColor: Colors.blueAccent,
                                    onPressed: () {})
                              ],
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
      },
    );
  }
}
