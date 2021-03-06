import 'package:flutter/material.dart';
import 'package:flutter_app/models/destination_model.dart';
import 'package:flutter_app/screens/destination_screen_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top destinations",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("See All",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor))
            ],
          ),
        ),
        Container(
            height: 300.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, int index) {
                  Destination destination = destinations[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DestinationScreenState())),
                    child: Container(
                        margin: EdgeInsets.all(10),
                        width: 210,
                        child: Stack(alignment: Alignment.topCenter, children: <
                            Widget>[
                          Positioned(
                            bottom: 15,
                            child: Container(
                                height: 120.0,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            "${destination.activities.length} activities",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold)),
                                        Text(destination.description,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0,
                                            )),
                                      ]),
                                )),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0)
                                  ]),
                              child: Stack(children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      height: 180,
                                      width: 180,
                                      image: AssetImage(destination.imageUrl),
                                      fit: BoxFit.cover),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(destination.city,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600)),
                                        Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.locationArrow,
                                                size: 10, color: Colors.white),
                                            SizedBox(width: 5.0),
                                            Text(destination.country,
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ]),
                                )
                              ])),
                        ])),
                  );
                }))
      ],
    );
  }
}
