import 'package:covidapp/worldstats.dart';
import 'package:flutter/material.dart';

class detailscreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  detailscreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      reuseable(
                        title: 'cases : ',
                        value: widget.totalCases.toString(),
                      ),
                      reuseable(
                        title: 'death : ',
                        value: widget.totalDeaths.toString(),
                      ),
                      reuseable(
                        title: 'recovered : ',
                        value: widget.todayRecovered.toString(),
                      ),
                      reuseable(
                        title: 'active : ',
                        value: widget.active.toString(),
                      ),
                      reuseable(
                        title: 'critical : ',
                        value: widget.critical.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}

class reuseable extends StatelessWidget {
  final String title;
  final String value;
  reuseable({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          Divider(),
        ],
      ),
    );
  }
}
