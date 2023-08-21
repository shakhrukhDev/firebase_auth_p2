part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}
class CountAddEvent extends DetailEvent {
  final int count;

  CountAddEvent({required this.count});
  @override
  List<Object?>  get props=>[count];
}
class CountRemoveEvent extends DetailEvent {
  final int count;

  CountRemoveEvent({required this.count});
  @override
  List<Object?>  get props=>[count];
}