

import 'package:equatable/equatable.dart';
import 'package:flutterbloc/infinite_list/model/comment.dart';

abstract class InfiniteState extends Equatable{
  InfiniteState();



  @override
  // TODO: implement props
  List<Object> get props => [];
}


class InitialComment extends InfiniteState {}
class FailureComment extends InfiniteState {}
class SuccessComment extends InfiniteState {
  final List<Comment> list;
  final bool hasReachedMax;
  SuccessComment({this.list, this.hasReachedMax});

  SuccessComment copyWith({
    List<Comment> list, bool hasReachedMax
  }) {
    return SuccessComment(
      list: list ?? this.list,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [list, hasReachedMax];

}



