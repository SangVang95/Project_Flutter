import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/counter/widget/bottom_loader.dart';
import 'package:flutterbloc/counter/widget/comment_widget.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_bloc.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_event.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_state.dart';

class InfiniteListHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InfiniteListHomeState();
  }
}

class InfiniteListHomeState extends State<InfiniteListHome> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  InfiniteBloc _infiniteBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
    _infiniteBloc = BlocProvider.of<InfiniteBloc>(context);
  }
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _infiniteBloc.add(GetComment());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite List'),),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: BlocBuilder<InfiniteBloc, InfiniteState>(
                builder: (context, state) {
                  if (state is InitialComment) {
                    return Center (child: CircularProgressIndicator ());
                  } else if (state is SuccessComment) {
                    if (state.list.isEmpty) {
                      return Center(child: Text('No commnet'),);
                    }
                    return Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: state.hasReachedMax ? state.list.length : state.list.length + 1,
                          itemBuilder: (BuildContext context, index) {
                            return index >= state.list.length ? BottomLoader() : CommentWidget(comment: state.list[index],);
                          }),
                    );
                  } else {
                    return Center(child: Text('Error'),);
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }

}