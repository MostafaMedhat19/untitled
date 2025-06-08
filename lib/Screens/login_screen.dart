import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/account_provider.dart';
import 'package:untitled/Screens/signup_screen.dart';
import '../Widgets/custom_textformfeild.dart';
import 'category_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                textEditingController: emailController,
                icon: Icons.email,
                content: 'Email',
              ),
              CustomText(
                textEditingController: passwordController,
                icon: Icons.lock,
                content: 'Password',
              ),
              const SizedBox(height: 20),
              Consumer<AccountProvider>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await value.loginAccount(
                          emailController.text,
                          passwordController.text,
                        );
                        if (value.status == true ) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value.massage.toString())),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value.massage.toString())),
                          );
                        }
                      }
                    },
                    child: const Text('Login'),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
