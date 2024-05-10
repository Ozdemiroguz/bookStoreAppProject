import 'package:auto_route/auto_route.dart';
import 'package:book_store/constants/colors.dart';
import 'package:book_store/constants/text_styles.dart';
import 'package:book_store/core/extensions/context_extensions.dart';
import 'package:book_store/custom/custom_filled_button.dart';
import 'package:book_store/custom/custom_text_field.dart';
import 'package:book_store/custom/password_text_field.dart';
import 'package:book_store/features/auth/presentation/widgets/widgets.dart';
import 'package:book_store/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_notifier.dart';

final formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

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
    final double height = context.screenHeight;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 60.h,
              bottom: 40.h,
            ),
            child: Column(
              children: [
                Logo(),
                SizedBox(
                  height: 115.h,
                ),
                WelcomeText(),
                SizedBox(
                  height: 75.h,
                ),
                FormWidget(),
                const Spacer(),
                RegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: bLabelMedium.copyWith(color: darkBlue3.withOpacity(.6)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text('Register to your account', style: bLabelLarge),
        ],
      ),
    );
  }
}

class FormWidget extends ConsumerWidget {
  final searchControllerName = TextEditingController();
  final searchControllerEmail = TextEditingController();
  final searchControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(formKeyProvider),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: bLabelMedium),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 50.h,
                child: CustomTextField(
                  controller: searchControllerName,
                  validator: (value) =>
                      value!.isEmpty ? 'Name is required' : null,
                  hintText: 'Name',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
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
                  validator: (value) =>
                      value!.isEmpty ? 'Email is required' : null,
                  controller: searchControllerEmail,
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
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
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text(
                  'Login',
                  style: labelSmall.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    height: 1.6.h,
                    color: purple,
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
    );
  }
}

class RegisterButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    final formKey = ref.watch(formKeyProvider);
    return SizedBox(
      height: 60.h,
      width: context.screenWidth,
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
        child: Text('Register', style: bLabelMedium.copyWith(color: white)),
      ),
    );
  }
}
