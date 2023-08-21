part of 'detail_bloc.dart';


class DetailState extends Equatable {
  final int count;


  const DetailState({this.count = 0,});

  DetailState copyWith({int? count,}) {
    return DetailState(
        count: count ?? this.count);
  }

  @override
  List<Object?> get props => [count];
}
