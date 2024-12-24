import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'ai_main_screen.dart';

class AIMoneylineOddsSelection extends StatelessWidget {
  const AIMoneylineOddsSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161519),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF1E282F), Color(0xFF161519)]),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                minimumSize: Size.zero,
                iconColor: Colors.white,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: BorderSide(
                  color: Color(0xFFFFFFFF).withValues(alpha: 20),
                  width: 0.5,
                ),
            ),
            onPressed: () {
              PersistentNavBarNavigator.pop(context);
            },
            // child: Text("Back"),
            label: Text("Back"),
            icon: Icon(Icons.chevron_left),
          ),
        ),
        title: Text(
          "AI Predictions - Moneyline",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            OddsSelectionMatchInformation(),
            BetList(),
          ],
        ),
      ),
    );
  }
}

class OddsSelectionMatchInformation extends StatelessWidget {
  const OddsSelectionMatchInformation(
    this.homeTeamImage,
    this.homeTeamName,
    this.date,
    this.time,
    this.homeTeamH2HPercentage,
    this.isLive,
    this.awayTeamImage,
    this.awayTeamName,
    this.awayTeamH2HPercentage,
    this.homeTeamH2H,
    this.awayTeamH2H,
    {super.key}
  );

  final String homeTeamImage;
  final String homeTeamName;
  final String date;
  final String time;
  final String homeTeamH2HPercentage;
  final bool isLive;
  final String awayTeamImage;
  final String awayTeamName;
  final String awayTeamH2HPercentage;
  final List<bool> homeTeamH2H;
  final List<bool> awayTeamH2H;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
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
            Text(
              "H2H",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
                color: Colors.white.withValues(alpha: 50),
              ),
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
      ],
    );
  }
}

class BetList extends StatelessWidget {
  const BetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [],
    );
  }
}

class BetListItem extends StatelessWidget {
  const BetListItem(
    this.betImage,
    this.firstCoefficient,
    this.isBetNow,
    this.secondCoefficient,
    {
      this.firstCoefficientBackgroundColor = Colors.transparent,
      this.firstCoefficientTextColor = Colors.white,
      this.secondCoefficientBackgroundColor = Colors.transparent,
      this.secondCoefficientTextColor = Colors.white,
      super.key
    }
  );

  final String firstCoefficient;
  final Color firstCoefficientBackgroundColor;
  final Color firstCoefficientTextColor;
  final String secondCoefficient;
  final Color secondCoefficientBackgroundColor;
  final Color secondCoefficientTextColor;
  final String betImage;
  final bool isBetNow;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white.withValues(alpha: 20),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: firstCoefficientBackgroundColor,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              firstCoefficient,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: "Inter",
                color: firstCoefficientTextColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              spacing: 10,
              children: [
                Visibility(
                  visible: isBetNow,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF00FF57)
                    ),
                    child: Text(
                      "Bet Now",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        fontFamily: "Inter",
                        color: Color(0xFF161519),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.antiAlias,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 50),
                      width: 0.5,
                    )
                  ),
                  child: Image.network(
                    betImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Visibility(
                  visible: isBetNow,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF00FF57)
                    ),
                    child: Text(
                      "Bet Now",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        fontFamily: "Inter",
                        color: Color(0xFF161519),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: secondCoefficientBackgroundColor,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              secondCoefficient,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontFamily: "Inter",
                color: secondCoefficientTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
