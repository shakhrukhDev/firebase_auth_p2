import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_p2/constants/app_color.dart';
import 'package:firebase_auth_p2/constants/app_icon.dart';
import 'package:firebase_auth_p2/constants/widgets/text_styles.dart';
import 'package:firebase_auth_p2/presentation/auth/login/bloc/login_bloc.dart';
import 'package:firebase_auth_p2/presentation/auth/sign_up/sign_up_page.dart';
import 'package:firebase_auth_p2/presentation/splash/completed_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});


  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CompletedPage();
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  toolbarHeight: MediaQuery
                      .of(context)
                      .size
                      .height * 90 / 800,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign In",
                        style: AppStyle.poppins22xW500Black,
                      ),
                      Text(
                        "Find your best ever meal",
                        style: AppStyle.poppins14xW300Gray,
                      )
                    ],
                  ),
                ),
                body: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 26,
                        ),
                        if(state.firebase.isLoading)
                          const CircularProgressIndicator(),
                        if(state.firebase.isError)
                          const Text('Email or password invalid',style: TextStyle(color: Colors.red),),
                        Text(
                          "Email Address",
                          style: AppStyle.poppins16xW300Black,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your email';
                            }
                          },
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Type your email address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Password",
                          style: AppStyle.poppins16xW300Black,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Please enter your password';
                            }
                          },
                          controller: password,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Type your password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (email.text.isNotEmpty &&
                                password.text.isNotEmpty) {
                              context.read<LoginBloc>().add(SignInEvent(
                                  password: password.text,
                                  email: email.text)
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "The information is incomplete",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.red,
                              minimumSize: const Size(double.infinity, 55),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                              )),
                          child: Text("Sign In", style: AppStyle.poppins14xW500White),
                        ),
                        Center(
                            child: TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  'Forgot password',
                                  style: AppStyle.poppins12xW400Red,
                                ))),
                        Center(
                            child: Text(
                              "- OR Continue with -",
                              style: AppStyle.poppins12xW300Gray,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<LoginBloc>().add(SignInWithGoogleEvent());
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                  backgroundColor:Colors.red[50],
                                  fixedSize: const Size(116, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.googleIcon),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Google",
                                    style: AppStyle.poppins12xW400Gray,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                  backgroundColor:Colors.red[50],
                                  fixedSize: const Size(128, 40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.facebookIcon),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Facebook",
                                    style: AppStyle.poppins12xW400Gray,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24,),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Create An Account ",
                              style: AppStyle.poppins14xW400Gray,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Sign up',
                                  style: AppStyle.poppins14xW600Red,
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SigUpPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

