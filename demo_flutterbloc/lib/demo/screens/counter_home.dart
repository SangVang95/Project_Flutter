import 'package:demo_flutterbloc/demo/bloc/counter_bloc.dart';
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
    final state = context.watch<CounterBloc>();
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: SearchWiget(),
        actions: [
          IconButton(
              onPressed: () {
                counterBloc.add(Increase());
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                counterBloc.add(Decrease());
              },
              icon: const Icon(Icons.exposure_minus_1))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterInitial) {
              return const Text('0',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold));
            } else if (state is CounterCompleted) {
              return Text(
                '${state.count}',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
