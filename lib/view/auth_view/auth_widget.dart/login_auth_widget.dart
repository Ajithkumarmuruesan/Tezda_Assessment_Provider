import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezda_ecommerce/controller/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, controller, _) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
                      focusNode: FocusNode(),
                      controller: controller.userNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          value!.isEmpty ? 'Please Enter UserName' : null,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        // labelText: 'Enter Your Email',
                        hintText: 'Enter Email',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
                      focusNode: FocusNode(),
                      validator: (value) =>
                          value!.isEmpty ? 'Please Enter Password' : null,
                      controller: controller.passwordController,
                      obscureText: controller.obscurePassword,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        suffixIcon: IconButton(
                          icon: Icon(
                            !controller.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            controller.passwordView();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintText: 'Enter Password',
                        // labelText: 'Password',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.loginFormKey.currentState!.validate()) {
                      await controller.login(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                  ),
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    });
  }
}
