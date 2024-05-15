import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/core/extensions/context_extensions.dart';
import 'package:book_store/custom/custom_checkbox_tile.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/custom/custom_text_field.dart';
import 'package:book_store/custom/password_text_field.dart';
import 'package:book_store/features/auth/presentation/providers/auth_notifier.dart';
import 'package:book_store/features/auth/presentation/widgets/widgets.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

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

  @override
  Widget build(BuildContext context) {
    //providersları tanımla

    final double height = context.screenHeight;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 40.h,
              top: 60.h,
            ),
            height: height,
            child: Column(
              children: [
                Logo(),
                SizedBox(
                  height: 115.h,
                ),
                const WelcomeText(),
                SizedBox(
                  height: 76.h,
                ),
                FormWidgetPart(),
                const Spacer(),
                LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back!',
              style: bLabelMedium.copyWith(color: darkBlue3.withOpacity(0.6))),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Login to your account',
            style: bLabelLarge,
          ),
        ],
      ),
    );
  }
}

class FormWidgetPart extends ConsumerWidget {
  final searchControllerEmail = TextEditingController();
  final searchControllerPassword = TextEditingController();
  bool checkedValue = false;

  FormWidgetPart();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = context.screenWidth;
    return Form(
      key: ref.watch(_keyProvider),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('E-mail', style: bLabelMedium),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
                child: CustomTextField(
                  //style

                  controller: searchControllerEmail,
                  validator: (value) =>
                      value!.isEmpty ? 'Email is required' : null,
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pasword',
                style: bLabelMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
                child: PasswordTextField(
                  validator: (value) =>
                      value!.isEmpty ? 'Password is required' : null,
                  controller: searchControllerPassword,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.5,
                height: 50.h,
                child: CustomCheckboxTile(
                  labelColor: purple,
                  checkedColor: purple,
                  labelStyle: bLabelMedium.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: purple,
                  ),
                  label: 'Remember me',
                  value: checkedValue,
                  onChanged: (value) {
                    checkedValue = value!;
                  },
                ),
              ),
              GestureDetector(
                child: Text(
                  'Register',
                  style: bLabelMedium.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: purple,
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
    );
  }
}

class LoginButton extends ConsumerWidget {
  final searchControllerEmail = TextEditingController();
  final searchControllerPassword = TextEditingController();
  // FORM KEY DEĞERİNİ VALUE OLARKA ALDIK
  LoginButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    return SizedBox(
      height: 60.r,
      width: context.screenWidth,
      child: CustomFilledButton.orange(
        onPressed: () async {
          /* if (!formKey!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill the required fields'),
              ),
            );
            return;
          }*/
          await authNotifier
              .signIn(
            //searchControllerEmail.text,
            // searchControllerPassword.text,
            "oguzhan",
            "oguzhan",
          )
              .then((_) {
            final authState = authNotifier.currentState;
            if (authState == AuthState.authenticated) {
              context.router.replaceAll([const HomeRoute()]);
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
          style: bLabelMedium.copyWith(color: white),
        ),
      ),
    );
  }
}
