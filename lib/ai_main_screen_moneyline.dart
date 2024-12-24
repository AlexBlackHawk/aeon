import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'ai_main_screen.dart';
import 'ai_secondary_screen_moneyline.dart';

class MoneylineList extends StatelessWidget {
  const MoneylineList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [],
    );
  }
}

class MoneylineListItem extends StatelessWidget {
  const MoneylineListItem(
      this.homeTeamName,
      this.awayTeamName,
      this.homeTeamImage,
      this.awayTeamImage,
      this.homeTeamScore,
      this.awayTeamScore,
      this.isLive,
      this.date,
      this.time,
      this.homeTeamH2H,
      this.homeTeamH2HPercentage,
      this.awayTeamH2H,
      this.awayTeamH2HPercentage,
      this.predictedWinnerTeamImage,
      this.statisticInformation,
      this.moneylineName,
      this.moneylineValue,
      this.moneylineImage,
      this.moneylineIndicators,
      this.moneylinePercentage,
      {super.key}
      );

  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamImage;
  final String awayTeamImage;
  final String homeTeamScore;
  final String awayTeamScore;
  final bool isLive;
  final String date;
  final String time;
  final List<bool> homeTeamH2H;
  final String homeTeamH2HPercentage;
  final List<bool> awayTeamH2H;
  final String awayTeamH2HPercentage;
  final String predictedWinnerTeamImage;
  final String statisticInformation;
  final String moneylineName;
  final String moneylineValue;
  final String moneylineImage;
  final List<bool> moneylineIndicators;
  final String moneylinePercentage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          withNavBar: true,
          screen: AISecondaryScreenMoneyline(),
        );
      },
      child: Container(
        // height: 190,
        margin: EdgeInsets.only(
          top: 10,
        ),
        decoration: BoxDecoration(
            color: Color(0xFF1E282F),
            borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(homeTeamImage),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 26,
                          height: 19,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.5,
                              )
                          ),
                          child: Text(
                            homeTeamScore,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              color: Color(0xFF00FF57),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      homeTeamName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        color: Colors.white.withValues(alpha: 70),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        color: Colors.white.withValues(alpha: 70),
                      ),
                    ),
                    Visibility(
                      visible: isLive,
                      child: RichText(
                        text: TextSpan(
                            text: "Live",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inter",
                              color: Color(0xFF00FF57),
                            ),
                            children: [
                              WidgetSpan(
                                child: Container(
                                  width: 7,
                                  height: 7,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF00FF57)
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          width: 26,
                          height: 19,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.5,
                              )
                          ),
                          child: Text(
                            awayTeamScore,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter",
                              color: Color(0xFF00FF57),
                            ),
                          ),
                        ),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(awayTeamImage),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      awayTeamName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    ListView.separated(
                      itemBuilder: (BuildContext context, int index) => Indicator(
                        homeTeamH2H[index] ? Color(0xFF00FF57) : Color(0xFFFC7881),
                      ),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 1,),
                      itemCount: homeTeamH2H.length,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      homeTeamH2HPercentage,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        color: Color(0xFF00FF57),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      indent: 30,
                      endIndent: 10,
                      color: Colors.white.withValues(alpha: 50),
                      thickness: 0.5,
                    ),
                    Text(
                      "L5 H2H",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        color: Colors.white.withValues(alpha: 50),
                      ),
                    ),
                    Divider(
                      endIndent: 30,
                      indent: 10,
                      color: Colors.white.withValues(alpha: 50),
                      thickness: 0.5,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      homeTeamH2HPercentage,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Inter",
                        color: Color(0xFF00FF57),
                      ),
                    ),
                    SizedBox(width: 20,),
                    ListView.separated(
                      itemBuilder: (BuildContext context, int index) => Indicator(
                        homeTeamH2H[index] ? Color(0xFF00FF57) : Color(0xFFFC7881),
                      ),
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 1,),
                      itemCount: homeTeamH2H.length,
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Color(0xFFFF7950),
              height: 0.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "$moneylineName Moneyline ($moneylineValue)",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 22,
                    height: 22,
                    clipBehavior: Clip.antiAlias,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        )
                    ),
                    child: Image.asset(
                      moneylineImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10,),
                  ListView.separated(
                    itemBuilder: (BuildContext context, int index) => Indicator(
                      moneylineIndicators[index] ? Color(0xFF00FF57) : Color(0xFFFC7881),
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 1,),
                    itemCount: moneylineIndicators.length,
                  ),
                  SizedBox(width: 20,),
                  Text(
                    moneylinePercentage,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      color: Color(0xFF00FF57),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              statisticInformation,
              style: TextStyle(
                color: Color(0xFF00FF57),
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                    text: "Predicted winner",
                    style: TextStyle(
                      color: Color(0xFF00FF57),
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      WidgetSpan(
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(predictedWinnerTeamImage),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF00FF57),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
