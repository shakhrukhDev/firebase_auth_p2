import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState()) {
    on<CountAddEvent>(_increment);
    on<CountRemoveEvent>(_decrement);
  }
  void _increment(CountAddEvent event,Emitter<DetailState>emit){
    emit(state.copyWith(count: event.count+1));
  }

  void _decrement(CountRemoveEvent event,Emitter<DetailState>emit){
    int newNumber=state.count-1;
    newNumber<0?newNumber=0:state.count;
    emit(state.copyWith(count: newNumber));
  }
}
