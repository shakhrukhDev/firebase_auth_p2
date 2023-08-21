import 'package:firebase_auth_p2/constants/app_images.dart';
import 'package:firebase_auth_p2/constants/widgets/button_style.dart';
import 'package:firebase_auth_p2/constants/widgets/text_styles.dart';
import 'package:firebase_auth_p2/presentation/main/home/bloc/home_bloc.dart';
import 'package:firebase_auth_p2/presentation/main/home/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.items});

  final TabListProduct items;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 300,
                flexibleSpace: Image.asset(
                  items.image,
                  fit: BoxFit.cover,
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffEB0029),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    height: media.size.height*400/800,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 26,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    items.detailName,
                                    style: AppStyle.poppins16xW300Black,
                                  ),
                                  Image.asset(AppImages.starsImage),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<DetailBloc>().add(
                                          CountRemoveEvent(count: state.count));
                                    },
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(state.count.toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<DetailBloc>()
                                          .add(CountAddEvent(count: state.count));
                                    },
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            items.detailComment,
                            style: AppStyle.poppins14xW400Gray,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Ingredients:",
                            style: AppStyle.poppins14xW400Black,
                          ),
                          Text(
                            "Seledri, telur, blueberry, madu.",
                            style: AppStyle.poppins14xW400Gray,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Total Price:",
                                    style: AppStyle.poppins14xW400Gray,
                                  ),
                                  Text(
                                    "IDR 12.289.000",
                                    style: AppStyle.poppins16xW300Black,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ElevatedButton(
                                  style: ElevatedButtonStyle.items(
                                      radius: 8,
                                      width: media.size.width * 100 / 360,
                                      color: const Color(0xffEB0029)),
                                  onPressed: () {},
                                  child: Text("Order Now", style: AppStyle.poppins14xW500White,)),
                            ],
                          ),
                        ],
                      ),
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
