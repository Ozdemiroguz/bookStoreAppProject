import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/core/extensions/context_extensions.dart';
import 'package:book_store/core/models/validation_error_visibility/validation_error_visibility.dart';
import 'package:book_store/custom/custom_checkbox_tile.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/custom/custom_text_field.dart';
import 'package:book_store/custom/password_text_field.dart';
import 'package:book_store/features/auth/presentation/providers/auth_notifier.dart';
import 'package:book_store/gen/assets.gen.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
//statefull widget
class LoginPage extends StatefulHookConsumerWidget {
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
  const LoginPage();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool checkedValue = false;
  final searchControllerEmail = TextEditingController();
  final searchControllerPassword = TextEditingController();   
  //final formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    //providersları tanımla
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    final double width = context.screenWidth;
    final double height = context.screenHeight;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            height: height,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100.r,
                      height: 65.r,
                      child: Assets.icons.logo.svg(width: 240.r, height: 240.r),
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
                      Text('Welcome back!',
                          style: labelMedium.copyWith(
                              //600 font weight
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              height: 2.2,
                              color: Colors.grey,),),
                      Text('Login to your account',
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
                            Text('E-mail',
                                style: labelMedium.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 2.2,),),
                             CustomTextField(
                              controller: searchControllerEmail,
                              validator: (value) => value!.isEmpty ? 'Email is required' : null,

                                
                        
                              hintText: 'Email',
                              prefixIcon:const Icon(Icons.email),
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
                            prefixIcon: const Icon(Icons.lock),
                          ),
                        ],
                                        ),
                                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            height: 50,
                            child: CustomCheckboxTile(
                              labelColor: const Color(0xff6251DD),
                              label: 'Remember me',
                              value: checkedValue,
                              onChanged: (value) {
                                setState(() {
                                  checkedValue = value!;
                                });
                              },
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Register',
                              style: labelSmall.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff6251DD),
                              ),
                            ),
                            onTap: () {
                              context.replaceRoute(const RegisterRoute());
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
                            .signIn(searchControllerEmail.text, searchControllerPassword.text)
                            .then((_) {
                          final authState = authNotifier.currentState;
                          if (authState == AuthState.authenticated) {
                            context.replaceRoute(const HomeRoute());
                          } else if (authState == AuthState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Login failed'),
                              ),
                            );
                          }
                        });
                      },
                      child: Text(
                        'Login',
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
