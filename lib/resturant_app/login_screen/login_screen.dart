import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled1/layout/categories_layout/categories_layout/cubit/cubit.dart';
import 'package:untitled1/layout/categories_layout/kale_me_crazy/kalr_me_crazy.dart';
import 'package:untitled1/resturant_app/forget_password/forget_password_screen.dart';
import 'package:untitled1/resturant_app/login_screen/cubit/cubit.dart';
import 'package:untitled1/resturant_app/login_screen/cubit/states.dart';
import 'package:untitled1/resturant_app/register/register_screen.dart';
import 'package:untitled1/shared/components/component.dart';
import 'package:untitled1/shared/remote/cash_helper.dart';
import 'package:untitled1/shared/remote/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<ResturantLoginCubit, ResturantLoginStates>(
      listener: (BuildContext context, state) {
        var cubit = ResturantLoginCubit.get(context);
        if (state is ResturantLoginSuccessState) {
          if (state.loginModel!.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel!.data.token,
            ).then((value) {
              cubit.getToken();
              HomeCubit.get(context).getUserData();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KaleMeCrazy(),
                  ), (route) {
                return false;
              });
            });
          }
        } else if (state is ResturantLoginErorrState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Email or Password are incorrect,Check it'),
            padding: EdgeInsetsDirectional.all(20),
            duration: Duration(milliseconds: 950),
          ));
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Stack(
            children: [
              design(
                chiled: Padding(
                  padding: const EdgeInsets.only(top: 120, left: 35, right: 35),
                  //?????? ???????? ???????????? ??????????????
                  child: SingleChildScrollView(
                    //?????????????? ????????????
                    child: Column(
                      children: [
                        //?????????????????? ???????? ?????????? ???? ?? ????????????????
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              // ?????????????? ?????? ?????????? ???????????????? ???????? ?????????? ???? ???????? ???? ????????????????????
                              child: defaultButton(
                                  background: HexColor("F23B3F"),
                                  function: () {},
                                  text: 'login',
                                  textColors: Colors.white),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              //?????????????? ?????? ?????????? ???????????????? ???????? ????????????????
                              child: defaultButton(
                                width: 30,
                                //background: HexColor("F23B3F"),
                                function: () {
                                  Navigator.push(context,
                                      BouncyPageRoute(widget: SignupScreen()));
                                },
                                text: 'signup',
                                elevation: 0.0,
                                background: Colors.white,
                                textColors: HexColor("F23B3F"),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Form(
                          key: ResturantLoginCubit.get(context).formKey,
                          //?????????????? ???? ???????? ?????????????? ???????? ???????????? ???????? ??????????????
                          child: Column(
                            children: [
                              //???????? ???????? ???????????? ???????? ???????? ?????????????? ???? ????????????????????
                              defaultFormField(
                                controller: emailController,
                                label: 'email',
                                prefix: Icons.email_outlined,
                                type: TextInputType.emailAddress,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your email address';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                controller: passwordController,
                                label: 'password',
                                prefix: Icons.lock_outline,
                                type: TextInputType.visiblePassword,
                                suffix: ResturantLoginCubit.get(context).suffix,
                                isPassword:
                                ResturantLoginCubit.get(context).isPassword,
                                suffixPressed: () {
                                  ResturantLoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'please enter your Password';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              //???? ?????????? ???? ???????? ???????????????? ??
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  defaultTextButton(
                                      function: () {
                                        navegateTo(context, ForgetPasswordScreen());
                                      },
                                      text: 'forget password?',
                                      color: defaultColor)
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ConditionalBuilder(
                                condition: state is! ResturantLoginLoadingState,
                                builder: (BuildContext context) => defaultButton(
                                    function: () {
                                      if (ResturantLoginCubit.get(context)
                                          .formKey
                                          .currentState!
                                          .validate()) {
                                        ResturantLoginCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    text: 'Login'),
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

