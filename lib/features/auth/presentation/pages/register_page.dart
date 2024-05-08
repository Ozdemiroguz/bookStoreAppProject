import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/core/extensions/context_extensions.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/custom/custom_text_field.dart';
import 'package:book_store/custom/password_text_field.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_notifier.dart';

@RoutePage()
//statefull widget
class RegisterPage extends StatefulHookConsumerWidget {
  const RegisterPage();

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  bool checkedValue = false;
  final searchControllerName = TextEditingController();
  final searchControllerEmail = TextEditingController();
  final searchControllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    final double width = context.screenWidth;
    final double height = context.screenHeight;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.r,
                      height: 65.r,
                      child: Assets.icons.logo.svg(width: 200.r, height: 240.r),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome',
                          style: labelMedium.copyWith(
                              //600 font weight
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              height: 2.2,
                              color: Colors.grey,),),
                      Text('Register to your account',
                          style: labelLarge.copyWith(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              height: 2.7,),),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name',
                              style: labelMedium.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 2.2,),),
                           CustomTextField(
                            controller: searchControllerName,
                            validator: (value) => value!.isEmpty ? 'Name is required' : null,
                            
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('E-mail',
                              style: labelMedium.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 2.2,),),
                           CustomTextField(
                            validator: (value) => value!.isEmpty ? 'Email is required' : null,
                            controller: searchControllerEmail,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pasword',
                              style: labelMedium.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 2.2,),),
                           PasswordTextField(
                            validator: (value) => value!.isEmpty ? 'Password is required' : null,
                            controller: searchControllerPassword,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Login',
                              style: labelSmall.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff6251DD),
                              ),
                            ),
                            onTap: () {
                              context.replaceRoute(const LoginRoute());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: width,
                  child: CustomFilledButton.orange(

                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill the required fields'),
                            ),
                          );
                          return;
                        }
                        await authNotifier
                            .signUp("Oguzhan", "Oguzhan@gmail.com", "12345")
                            .then((_) async {
                          final authState = authNotifier.currentState;

                          if (authState == AuthState.authenticated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Register successful'),
                              ),
                            );
                            context.replaceRoute(const LoginRoute());
                          } else if (authState == AuthState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Register failed'),
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        'Register',
                        style: labelMedium.copyWith(color: white),
                      ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
