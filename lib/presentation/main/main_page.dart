import 'package:firebase_auth_p2/presentation/main/bloc/main_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/home/home_page.dart';
import 'package:firebase_auth_p2/presentation/main/order/order_page.dart';
import 'package:firebase_auth_p2/presentation/main/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: [
              HomePage(),
              OrderPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomMenu.index,
            onTap: (index) {
              context
                  .read<MainBloc>()
                  .add(SetBottomMenuEvent(menu: BottomMenu.values[index]));
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: ''),


            ],
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
