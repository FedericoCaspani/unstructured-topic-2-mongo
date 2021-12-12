import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:unstructured_topic_2/BusinessLogic/DataModels/RankAgeVaccine.dart';

class RankAgeCategories extends StatelessWidget {
  final double barWidth = 22;
  final List<RankAgeVaccineModel> rankAgeCategories;

  const RankAgeCategories({
    Key? key,
    required this.rankAgeCategories}) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Vaccination by age groups', style: TextStyle(fontSize: 24),),
                  const SizedBox(height: 4,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 150,
                      width: 300,
                      child: BarChart(
                          BarChartData(
                              alignment: BarChartAlignment.center,
                              maxY: 1,
                              minY: 0,
                              groupsSpace: 5,
                              barTouchData: BarTouchData(
                                  touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.blueGrey,
                                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                        String ageGroup = rankAgeCategories[group.x.toInt()].ageCategory;
                                        return BarTooltipItem(
                                            ageGroup + '\n',
                                            const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                            children: <TextSpan> [
                                              TextSpan(
                                                  text: (rod.y).toString(),
                                                  style: const TextStyle(
                                                      color: Colors.yellow,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500
                                                  )
                                              )
                                            ]
                                        );
                                      }
                                  )
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: SideTitles(showTitles: false),
                                topTitles: SideTitles(showTitles: false),
                                bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) => const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),
                                    margin: 16,
                                ),
                                leftTitles: SideTitles(
                                    showTitles: false
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: FlGridData(show: false),
                              barGroups: rankAgeCategories.map(
                                      (data) => BarChartGroupData(
                                      x: data.id,
                                      barRods: [
                                        BarChartRodData(
                                            y: data.vaccineRatio,
                                            width: barWidth,
                                            colors: [data.color],
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(6),
                                              topRight: Radius.circular(6),
                                            )
                                        )
                                      ]
                                  )
                              ).toList()
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}