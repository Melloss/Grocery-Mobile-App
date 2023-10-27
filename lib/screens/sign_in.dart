import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with ColorPallet {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: signinBackgroundColor,
        ),
      ),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildSignInSheet(),
        ],
      ),
    );
  }

  _buildBackgroundImage() {
    return Container(
      width: screenHeight(context),
      height: screenHeight(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/images/signin_background.jpeg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  _buildSignInSheet() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: screenHeight(context) * 0.5,
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: signinBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 30),
              _buildEmailAndPasswordTextField(),
              _buildSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  _buildEmailAndPasswordTextField() {
    return Column(
      children: [
        TextField(
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
          decoration: InputDecoration(
            hintText: 'Email...',
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 23,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: iconColor,
              ),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          obscureText: !showPassword,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
          decoration: InputDecoration(
              hintText: 'Passowrd...',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 23,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: iconColor,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              suffixIcon: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    showPassword ? Bootstrap.eye : Bootstrap.eye_slash,
                    size: 20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )),
        )
      ],
    );
  }

  _buildSignInButton() {
    return GestureDetector(
      onTap: () {
        //Todo::
        Get.offNamed('/home');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: screenWidth(context),
        height: 60,
        decoration: BoxDecoration(
          color: lightYellow,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          'SIGN IN',
          style: TextStyle(
            color: black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        )),
      ),
    );
  }
}
