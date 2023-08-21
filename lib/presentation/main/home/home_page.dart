import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_p2/constants/app_images.dart';
import 'package:firebase_auth_p2/constants/widgets/text_styles.dart';
import 'package:firebase_auth_p2/presentation/main/home/bloc/home_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/home/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 108 / 800,
            leading: IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.login_outlined,
                  color: Colors.red,
                )),
            title: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FoodMarket",
                    style: AppStyle.poppins22xW500Black,
                  ),
                  Text(
                    "Let’s get some foods",
                    style: AppStyle.poppins14xW300Gray,
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(AppImages.userImage),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: media.size.height * 216 / 800,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return Material(
                          elevation: 0,
                          child: SizedBox(
                            width: media.size.width * 200 / 360,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(state.items[index].image),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.items[index].text,
                                  style: AppStyle.poppins16xW300Black,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 18,
                        );
                      }),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.tabItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: SizedBox(
                            height: media.size.height * 60 / 800,
                            width: media.size.width * 60 / 360,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          items: state.tabItems[index],
                                        ),
                                      ));
                                },
                                child:
                                    Image.asset(state.tabItems[index].image)),
                          ),
                          title: Text(
                            state.tabItems[index].title,
                            style: AppStyle.poppins16xW300Black,
                          ),
                          subtitle: Text(
                            state.tabItems[index].subtitle,
                            style: AppStyle.poppins16xW300Black,
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 18,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
