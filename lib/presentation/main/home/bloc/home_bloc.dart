import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth_p2/constants/app_images.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ListProductEvent>(_listProduct);
    on<TabListEvent>(_tabListProducts);
  }

  void _listProduct(ListProductEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(items: products));
  }

  void _tabListProducts(TabListEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(tabItems: productTab));
  }
}

final List<ListProduct> products = [
  ListProduct(
    text: 'Cherry Healthy',
    image: AppImages.listImage3,
  ),
  ListProduct(
    text: 'Burger Tamayo',
    image: AppImages.listImage2,
  ),
];

final List<TabListProduct> productTab = [
  TabListProduct(
      image: AppImages.soupImage,
      title: 'Soup Bumil',
      subtitle: 'IDR 289.000',
      detailComment: '''Makanan khas Bandung yang cukup sering\ndipesan oleh anak muda dengan pola makan\nyang cukup tinggi dengan mengutamakan\ndiet yang sehat dan teratur.''',
      detailImage: AppImages.listImage1,
      detailName: 'Cherry Healthy'),
  TabListProduct(
      image: AppImages.chickenImage,
      title: 'Chicken',
      subtitle: 'IDR 4.509.000',
      detailComment: 'It is such hdde aan dbgga aai cck a min\n sisn',
      detailImage: AppImages.chickenImage,
      detailName: 'Chicken'),
  TabListProduct(
      image: AppImages.shrimpImage,
      title: 'Shrimp',
      subtitle: 'IDR 999.000',
      detailComment:
      'axaa perfect such hdde aan dbgga aai cck a min\n ain the fridge',
      detailImage: AppImages.shrimpImage,
      detailName: 'Shrimp'),
  TabListProduct(
      image: AppImages.burgerImage,
      title: 'Burger',
      subtitle: 'IDR 459.000',
      detailComment: 'ooo very good hdde aan dbgga aai cck a min\n ain the box',
      detailImage: AppImages.burgerImage, detailName: 'Burger'),
];
