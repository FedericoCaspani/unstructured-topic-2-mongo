import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/VaccineType.dart';

class RankByVaccinationType extends StatefulWidget {

  final List<VaccineTypeModel> vaccineType;
  const RankByVaccinationType({Key? key, required this.vaccineType}) : super(key: key);

  @override
  _RankByVaccinationTypeState createState() => _RankByVaccinationTypeState();

}

class _RankByVaccinationTypeState extends State<RankByVaccinationType> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: AspectRatio(
          aspectRatio: 1.7,
          child: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
            color: const Color(0xff2c4260),
            child: _BarChart(vaccineType: widget.vaccineType,),
          ),
      ),
    );
  }

}

class _BarChart extends StatelessWidget {

  final List<VaccineTypeModel> vaccineType;
  final double barWidth = 22.0;

  const _BarChart({Key? key, required this.vaccineType}) : super(key: key);

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
        String vaccine = vaccineType[group.x.toInt()].vaccine;
        return BarTooltipItem(
          vaccine + '\n',
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
        return vaccineType[value.toInt()].vaccine.substring(0, 3);
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
    return vaccineType.map(
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
    return BarChart(
      BarChartData(
        barTouchData: _barTouchDate,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      )
    );
  }
}