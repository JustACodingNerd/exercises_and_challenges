import 'package:flutter/material.dart';

class TermsCheckbox extends StatelessWidget {
  const TermsCheckbox({
    super.key,
    required this.termsAccepted,
    required this.onChanged,
  });

  final bool termsAccepted;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(
            color: Colors.grey,
          ),
          activeColor: Colors.blue,
          value: termsAccepted,
          onChanged: onChanged,
        ),
        const Text(
          'I accept the Terms of Use',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.onPressed,
    required this.formKey,
    required this.termsAccepted,
  });

  final VoidCallback onPressed;
  final GlobalKey<FormState> formKey;
  final bool termsAccepted;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 25.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onPressed: () {
            if (formKey.currentState!.validate() && termsAccepted) {
              onPressed();
            } else if (!termsAccepted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You must accept the terms of use')),
              );
            }
          },
          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  SignInButtonState createState() => SignInButtonState();
}

class SignInButtonState extends State<SignInButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Already have an account?',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              // Add your sign-in navigation logic here
            },
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return Colors
                        .transparent; // Make the background transparent on hover
                  }
                  return null; // Default overlay color
                },
              ),
            ),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _hovering = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _hovering = false;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _hovering
                          ? Colors.brown
                          : Colors.transparent, // Underline color on hover
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Sign In',
                        style: TextStyle(
                          color: _hovering
                              ? Colors.brown
                              : Colors.brown, // Text color on hover
                        )),
                    SizedBox(width: 5), // Add some space between text and icon
                    Icon(
                      Icons.arrow_forward,
                      color: _hovering ? Colors.brown : Colors.brown,
                    ), // Icon color on hover
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
