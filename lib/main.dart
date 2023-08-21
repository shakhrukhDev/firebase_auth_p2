import 'package:firebase_auth_p2/presentation/auth/login/bloc/login_bloc.dart';
import 'package:firebase_auth_p2/presentation/auth/sign_up/bloc/signup_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/bloc/main_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/home/bloc/home_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/home/detail/bloc/detail_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/order/bloc/order_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/profile/bloc/profile_bloc.dart';
import 'package:firebase_auth_p2/presentation/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginBloc()),
          BlocProvider(create: (_) => SignupBloc()),
          BlocProvider(create: (_)=>MainBloc()),
          BlocProvider(create: (_)=>HomeBloc()),
          BlocProvider(create: (_)=>OrderBloc()),
          BlocProvider(create: (_)=>ProfileBloc()),
          BlocProvider(create: (_)=>HomeBloc()..add(ListProductEvent())..add(TabListEvent())),
         BlocProvider(create: (_)=>DetailBloc()),

        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        ));
  }
}