/*
 * corona
 * chart_view.dart
 * Created by Cong Fandi on 2/4/2020
 * email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 *
 */

import 'package:corona/providers/chart_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChartState cs = Provider.of<ChartState>(context);
    return Scaffold(
      body: RotationTransition(
        turns: new AlwaysStoppedAnimation(90/360),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: const Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                cs.showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 200,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final weekDays = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  lineChart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              'Average Line',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              ' and ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Text(
              'Indicators',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        SizedBox(
          width: 300,
          height: 140,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      final FlSpot spot = barData.spots[spotIndex];
                      if (spot.x == 0 || spot.x == 6) {
                        return null;
                      }
                      return TouchedSpotIndicatorData(
                        const FlLine(color: Colors.blue, strokeWidth: 4),
                        const FlDotData(
                            dotSize: 8, dotColor: Colors.deepOrange),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          final flSpot = barSpot;
                          if (flSpot.x == 0 || flSpot.x == 6) {
                            return null;
                          }

                          return LineTooltipItem(
                            '${weekDays[flSpot.x.toInt()]} \n${flSpot.y} k calories',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      })),
              extraLinesData: ExtraLinesData(horizontalLines: [
                HorizontalLine(
                  y: 1.8,
                  color: Colors.green.withOpacity(0.7),
                  strokeWidth: 4,
                ),
              ]),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 1.3),
                    FlSpot(1, 1),
                    FlSpot(2, 1.8),
                    FlSpot(3, 1.5),
                    FlSpot(4, 2.2),
                    FlSpot(5, 1.8),
                    FlSpot(6, 3),
                  ],
                  isCurved: false,
                  barWidth: 4,
                  colors: [
                    Colors.orange,
                  ],
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [
                      Colors.orange.withOpacity(0.5),
                      Colors.orange.withOpacity(0.0),
                    ],
                    gradientColorStops: [0.5, 1.0],
                    gradientFrom: const Offset(0, 0),
                    gradientTo: const Offset(0, 1),
                    spotsLine: BarAreaSpotsLine(
                      show: true,
                      flLineStyle: const FlLine(
                        color: Colors.blue,
                        strokeWidth: 2,
                      ),
                      checkToShowSpotLine: (spot) {
                        if (spot.x == 0 || spot.x == 6) {
                          return false;
                        }

                        return true;
                      },
                    ),
                  ),
                  dotData: FlDotData(
                      show: true,
                      dotColor: Colors.deepOrange,
                      dotSize: 6,
                      checkToShowDot: (spot) {
                        return spot.x != 0 && spot.x != 6;
                      }),
                ),
              ],
              minY: 0,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) {
                  if (value == 0) {
                    return const FlLine(
                      color: Colors.deepOrange,
                      strokeWidth: 2,
                    );
                  } else {
                    return const FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  }
                },
                getDrawingVerticalLine: (value) {
                  if (value == 0) {
                    return const FlLine(
                      color: Colors.black,
                      strokeWidth: 2,
                    );
                  } else {
                    return const FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  }
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return '';
                      case 1:
                        return '1k calories';
                      case 2:
                        return '2k calories';
                      case 3:
                        return '3k calories';
                    }

                    return '';
                  },
                  textStyle: const TextStyle(color: Colors.black, fontSize: 10),
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    return weekDays[value.toInt()];
                  },
                  textStyle: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
