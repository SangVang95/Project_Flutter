

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_event.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_state.dart';
import 'package:flutterbloc/infinite_list/model/comment.dart';
import 'package:flutterbloc/infinite_list/networking/infinite_api.dart';

class InfiniteBloc extends Bloc<InfiniteEvent, InfiniteState> {

  @override
  // TODO: implement initialState
  InfiniteState get initialState => InitialComment();

  @override
  Stream<InfiniteState> mapEventToState(InfiniteEvent event) async* {
    final currentState = state;
    if (event is GetComment && !hasReachMax(currentState)) {
      if (currentState is InitialComment) {
        final comments = await CommentAPI.getUser(0, 20);
        yield SuccessComment(list: comments, hasReachedMax: false);
      } else if (currentState is SuccessComment) {
        final comments = await CommentAPI.getUser(currentState.list.length, 20);
        yield comments.isEmpty ? currentState.copyWith(hasReachedMax: true) : SuccessComment(list: currentState.list + comments, hasReachedMax: false);
      }
    } else {
      yield FailureComment();
    }
  }

  bool hasReachMax(InfiniteState state) {
    return state is SuccessComment && state.hasReachedMax;
  }
}