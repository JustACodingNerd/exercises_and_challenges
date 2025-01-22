import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_registration_form_v1/form_fields/custom_buttons.dart';
import 'package:web_registration_form_v1/form_fields/custom_text_form_field.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key, required this.title});

  final String title;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/form_imgs/sign_up_imgs/nick-hillier-unsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(150, 0, 0, 0),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: constraints.maxWidth < 800
                      ? constraints.maxWidth
                      : constraints.maxWidth / 3,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/form_imgs/sign_up_imgs/nordwood-themes-unsplash.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: const Color.fromARGB(166, 253, 240, 240),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 151, 26, 9),
                              width: 20.0),
                        ),
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.ephesis(
                                textStyle: TextStyle(fontSize: 40),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFormField(
                                          label: 'Name', isRequired: true),
                                      CustomTextFormField(
                                          label: 'Email', isRequired: true),
                                      CustomTextFormField(
                                        label: 'Password',
                                        isRequired: true,
                                        controller: _passwordController,
                                      ),
                                      CustomTextFormField(
                                        label: 'Confirm Password',
                                        isRequired: true,
                                        controller: _confirmPasswordController,
                                        confirmPasswordController:
                                            _passwordController,
                                      ),
                                      TermsCheckbox(
                                        termsAccepted: _termsAccepted,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _termsAccepted = value ?? false;
                                          });
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      SignUpButton(
                                        onPressed: () {
                                          // Add your sign-up logic here
                                        },
                                        formKey: _formKey,
                                        termsAccepted: _termsAccepted,
                                      ),
                                      SizedBox(height: 20),
                                      SignInButton(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
