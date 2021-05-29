import 'package:animation/models/trip.dart';
import 'package:animation/screens/detail.dart';
import 'package:animation/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _buildTrip = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  Tween<Offset> _offSet = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _addTrip();
    });
  }

  void _addTrip() {
    final dummyData = [
      Trip(1, "Navai", "123123", "0.9", "1.jpeg"),
      Trip(2, "Kavai", "123123", "1.9", "2.jpg"),
      Trip(3, "Mavai", "123123", "2.9", "3.jpg"),
    ];

    dummyData.forEach((element) {
      // _buildTrip.add(_item(element, context));
      _listKey.currentState!.insertItem(_buildTrip.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle('Dubai trips'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: AnimatedList(
            key: _listKey,
            initialItemCount: _buildTrip.length,
            itemBuilder: (BuildContext context, index, animation) =>
                SlideTransition(
                  position: animation.drive(_offSet),
                  child: _buildTrip[index],
                )),
      ),
    );
  }

  Widget _item(Trip trip, BuildContext context) {
    return InkWell(
      key: ValueKey(trip.id),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(trip)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(tag: trip.id, child: Image.asset(trip.urlImage)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text(trip.title), Text(trip.desciption)],
            ),
            Text('${trip.prices}')
          ],
        ),
      ),
    );
  }
}
