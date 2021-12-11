import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Indicator.dart';

class InfectedTestedRatio extends StatefulWidget {

  final int infected;
  final int notInfected;
  final double ratio;

  const InfectedTestedRatio({Key? key, required this.infected, required this.notInfected, required this.ratio}) : super(key: key);

  @override
  _InfectedTestedRatioState createState() => _InfectedTestedRatioState();

}

class _InfectedTestedRatioState extends State<InfectedTestedRatio> {

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xff0293ee),
                          value: widget.infected.toDouble(),
                          title: (widget.infected / (widget.infected + widget.notInfected)
                              * 100).toStringAsFixed(1) + '%',
                          radius: 1 == touchedIndex ? 60.0 : 50.0,
                          titleStyle: TextStyle(
                              fontSize: 1 == touchedIndex ? 25.0 : 16.0,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffffffff)
                          ),
                        ),
                        PieChartSectionData(
                          color: const Color(0xfff8b250),
                          value: widget.notInfected.toDouble(),
                          title: (widget.notInfected / (widget.notInfected + widget.infected)
                              * 100).toStringAsFixed(1) + '%',
                          radius: 2 == touchedIndex ? 60.0 : 50.0,
                          titleStyle: TextStyle(
                              fontSize: 2 == touchedIndex ? 25.0 : 16.0,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffffffff)
                          ),
                        ),
                      ]
                  )
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Indicator(
                color: Color(0xff0293ee),
                text: 'Infected',
                isSquare: true,
              ),
              const SizedBox(
                height: 3,
              ),
              const Indicator(
                  color: Color(0xfff8b250),
                  text: 'Tested',
                  isSquare: true
              ),
              const SizedBox(
                height: 3,
              ),
              Text('Ratio is ' + widget.ratio.toStringAsFixed(3))
            ],
          )
        ],
      ),
    );
  }
}
