import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/PlaceRank.dart';

class RankByBusyDepartments extends StatefulWidget {

  final List<PlaceRank> placeRank;
  final String optimization;
  const RankByBusyDepartments({Key? key, required this.placeRank, required this.optimization}) : super(key: key);

  @override
  _RankByBusyDepartmentState createState() => _RankByBusyDepartmentState();

}

class _RankByBusyDepartmentState extends State<RankByBusyDepartments> {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        color: const Color(0xff2c4260),
        child: _BarChart(placeRank: widget.placeRank, text: widget.optimization,),
      ),
    );
  }

}

class _BarChart extends StatelessWidget {

  final List<PlaceRank> placeRank;
  final double barWidth = 22.0;
  final String text;

  const _BarChart({Key? key, required this.placeRank, required this.text}) : super(key: key);

  BarTouchData get _barTouchDate => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: const EdgeInsets.all(0),
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex
          ) {
        String placeName = placeRank[group.x.toInt()].place.name;
        String departments = placeRank[group.x.toInt()].place.departments;
        return BarTooltipItem(
          placeName + '\n' + departments + '\n',
          const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      margin: 20,
      getTitles: (double value) {
        return placeRank[value.toInt()].place.departments;
      },
    ),
    leftTitles: SideTitles(showTitles: false),
    topTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(showTitles: false),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  List<BarChartGroupData> get barGroups {
    return placeRank.map(
            (data) => BarChartGroupData(
            x: data.id,
            barRods: [
              BarChartRodData(
                  y: data.count.toDouble(),
                  width: barWidth,
                  colors: [data.color],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                  )
              )
            ]
        )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(text, style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 4,),
            Padding (
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                BarChartData(
                  barTouchData: _barTouchDate,
                  titlesData: titlesData,
                  borderData: borderData,
                  barGroups: barGroups,
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                )
            )
          ),
        ]
      ),
    );
  }
}