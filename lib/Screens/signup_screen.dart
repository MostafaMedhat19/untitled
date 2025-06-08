import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Providers/account_provider.dart';
import 'package:untitled/Screens/login_screen.dart';
import '../Widgets/custom_textformfeild.dart';
import 'category_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
              CustomText(
                textEditingController: nameController,
                icon: Icons.supervised_user_circle_sharp,
                content: 'Name',
              ),
              CustomText(
                textEditingController: phoneController,
                icon: Icons.phone,
                content: 'Phone',
              ),
              const SizedBox(height: 20),
              Consumer<AccountProvider>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await value.signUpAccount(
                            emailController.text,
                            passwordController.text,
                            phoneController.text,
                            nameController.text);
                        if (value.status == true) {
                          // Navigate or show success
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CategoryScreen()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text( value.massage.toString() )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text( value.massage.toString() )),
                          );
                        }
                      }
                    },
                    child: const Text('SignUp'),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  LoginScreen(),
                    ),
                  );
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
