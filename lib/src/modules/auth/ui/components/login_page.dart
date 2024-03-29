import 'package:flutter/material.dart';
import 'package:food_delivery/src/modules/auth/controller/auth_controller.dart';
import 'package:food_delivery/src/modules/home/ui/widgets/navigator_pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Email',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          TextField(
            controller: emailController,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Senha',
                style: TextStyle(color: Colors.grey[600]),
              )
            ],
          ),
          TextField(
            obscureText: true,
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Text(
                'Esqueceu a senha?',
                style: TextStyle(color: Color.fromRGBO(250, 74, 12, 100)),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.sizeOf(context).width,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(250, 74, 12, 100)),
              onPressed: () {
                controller.loginUser(
                    emailController.text, passwordController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NavigatorPages()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
