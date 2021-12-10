import 'package:demo_flutterbloc/demo/bloc/counter_bloc.dart';
import 'package:demo_flutterbloc/demo/bloc/counter_event.dart';
import 'package:demo_flutterbloc/demo/bloc/counter_state.dart';
import 'package:demo_flutterbloc/demo/bloc/counter_state.dart';
import 'package:demo_flutterbloc/widget/search_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        leading: SearchWiget(),
        actions: [
          IconButton(
              onPressed: () {
                counterBloc.add(CounterIncrement());
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                counterBloc.add(CounterDecrement());
              },
              icon: const Icon(Icons.exposure_minus_1))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterSate>(
          builder: (context, state) {
            // if (state is CounterInitial) {
            //   return Text(
            //     '${state.count}',
            //     style: const TextStyle(
            //       fontSize: 34,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   );
            // }
            // if (state is CounterCompleted) {
            //   return Text(
            //     '${state.count}',
            //     style: const TextStyle(
            //       fontSize: 34,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   );
            // } else {
            //   return Container();
            // }
            switch (state.status) {
              case CounterStatus.initial:
                return Text(
                  '${state.count}',
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                );
              case CounterStatus.complete:
                return Text(
                  '${state.count}',
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
