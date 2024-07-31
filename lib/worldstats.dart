import 'package:covidapp/country.dart';
import 'package:covidapp/modal/stats.dart';
import 'package:covidapp/services/world.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class worldstats extends StatefulWidget {
  const worldstats({super.key});

  @override
  State<worldstats> createState() => _worldstatsState();
}

class _worldstatsState extends State<worldstats> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // final Colorlist = <Color>[
  //   const Color(0xff428f54),
  //   const Color.fromARGB(255, 250, 9, 9),
  //   const Color(0xffdef246),
  // ];
  @override
  Widget build(BuildContext context) {
    world_data worldata = world_data();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: worldata.getstats(),
                  builder: (context, AsyncSnapshot<worldstatistics> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                          controller: _controller,
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * .01,
                            // ),
                            PieChart(
                              dataMap: {
                                'total': double.parse(
                                  snapshot.data!.cases.toString(),
                                ),
                                'reovered': double.parse(
                                  snapshot.data!.recovered.toString(),
                                ),
                                'deaths': double.parse(
                                  snapshot.data!.deaths.toString(),
                                ),
                              },
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.0,
                              legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left),
                              animationDuration: Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              colorList: const [
                                Color(0xff428f54),
                                Color.fromARGB(255, 250, 9, 9),
                                Color(0xffdef246),
                              ],
                              chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20),
                              child: Card(
                                child: Column(
                                  children: [
                                    reuseable(
                                        title: 'cases',
                                        value: snapshot.data!.cases.toString()),
                                    reuseable(
                                        title: 'recovered',
                                        value: snapshot.data!.recovered
                                            .toString()),
                                    reuseable(
                                        title: 'deaths',
                                        value:
                                            snapshot.data!.deaths.toString()),
                                    reuseable(
                                        title: 'active',
                                        value:
                                            snapshot.data!.active.toString()),
                                    reuseable(
                                        title: 'critical',
                                        value:
                                            snapshot.data!.critical.toString()),
                                    reuseable(
                                        title: 'today cases',
                                        value: snapshot.data!.todayCases
                                            .toString()),
                                    reuseable(
                                        title: 'today deaths',
                                        value: snapshot.data!.todayDeaths
                                            .toString()),
                                    reuseable(
                                        title: 'today recovered',
                                        value: snapshot.data!.todayRecovered
                                            .toString()),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => country()));
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: Center(child: Text('track countries')),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class reuseable extends StatelessWidget {
  final String title;
  final String value;
  reuseable({super.key, required this.title, required this.value});

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
