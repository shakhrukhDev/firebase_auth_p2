
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_p2/constants/app_color.dart';
import 'package:firebase_auth_p2/constants/widgets/button_style.dart';
import 'package:firebase_auth_p2/constants/widgets/text_styles.dart';
import 'package:firebase_auth_p2/presentation/auth/login/login%20_page.dart';
import 'package:firebase_auth_p2/presentation/auth/sign_up/bloc/signup_bloc.dart';
import 'package:firebase_auth_p2/presentation/splash/completed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SigUpPage extends StatelessWidget {
   SigUpPage({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {

        return StreamBuilder(
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
                  toolbarHeight: MediaQuery.of(context).size.height * 90 / 800,
                  leading: Padding(
                    padding:
                    const EdgeInsets.only(top: 32, left: 24,),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  title: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign Up", style: AppStyle.poppins22xW500Black,),
                        Text("Register and eat", style: AppStyle.poppins14xW300Gray,)
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Center(
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey, maxRadius: 48)),
                          if(state.firebase.isLoading)
                            const CircularProgressIndicator(),
                          if(state.firebase.isError)
                            const Text('The information is incomplete',style: TextStyle(color: Colors.red),),
                          Text("Full Name", style: AppStyle.poppins16xW300Black,),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter yor full name';
                              }
                            },
                            controller: name,
                            decoration: InputDecoration(
                              hintText: "Type your full name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),

                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Email Address", style: AppStyle.poppins16xW300Black,),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter your email address';
                              }
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration:  InputDecoration(
                              hintText: "Type your email address",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),

                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Password", style: AppStyle.poppins16xW300Black,),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(

                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Please enter yor password';
                              }
                            },
                            controller: password,
                            obscureText: true,
                            decoration:InputDecoration(
                              hintText: "Type your password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),

                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                              style: ElevatedButtonStyle.items(
                                text: '',
                                radius: 8,
                                width: double.infinity,
                                color: const Color(0xffEB0029),
                              ),
                              onPressed: () {
                                context.read<SignupBloc>().add(SignUpEvent(password: password.text, email: email.text));
                              },
                              child: Text('Continue', style: AppStyle.poppins14xW500White,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("I Already Have an Account", style: AppStyle.poppins14xW400Gray,),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),
                                      ));
                                },
                                child: Text("Log In", style: AppStyle.poppins14xW600Red,),
                              ),
                            ],
                          ),
                        ],
                      ),
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
