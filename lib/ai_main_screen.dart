import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'ai_main_screen_moneyline.dart';
import 'ai_main_screen_spread.dart';
import 'ai_main_screen_totals.dart';

class AIMainScreen extends StatelessWidget {
  const AIMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFF161519),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4),
            // child: Container(),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/cfl.png"),
                    label: Text(
                      "CFL",
                    ),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/mlb.png"),
                    label: Text(
                      "MLB",
                    ),
                    selected: true,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/nfl.png"),
                    label: Text(
                      "NFL",
                    ),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/nba.png"),
                    label: Text(
                      "NBA",
                    ),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/wnba.png"),
                    label: Text(
                      "WNBA",
                    ),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/nhl.png"),
                    label: Text(
                      "NHL",
                    ),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                  FilterChip(
                    showCheckmark: false,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xFFFF7950)),
                    ),
                    avatar: Image.asset("assets/leagues/ncaa.png"),
                    label: Text(
                      "NCAA",
                    ),
                    selected: false,
                    onSelected: (bool value) {},
                  ),
                ],
              ),
            ),
          ),
          leadingWidth: 100,
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
                )
              ),
              onPressed: () {
                PersistentNavBarNavigator.pop(context);
              },
              // child: Text("Back"),
              label: Text("Back"),
              icon: Icon(Icons.chevron_left),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    text: "AI Predictions",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      fontSize: 16,
                    ),
                    children: [
                      WidgetSpan(
                        child: SizedBox(width: 10,)
                      ),
                      TextSpan(
                        text: "17 Games",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                          fontSize: 14,
                        )
                      )
                    ]
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 27,
                width: MediaQuery.of(context).size.width * 0.56,
                decoration: BoxDecoration(
                  color: Color(0xFF2F3D48),
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    color: Colors.green,
                  ),
                  labelColor: Color(0xFF161519),
                  unselectedLabelColor: Colors.white.withValues(alpha: 50),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(
                      text: "Moneyline",
                    ),
                    Tab(
                      text: "Spread",
                    ),
                    Tab(
                      text: "Totals",
                    ),
                  ],
                ),
              ),
              TabBarView(
                children: [
                  MoneylineList(),
                  SpreadList(),
                  TotalsList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator(this.indicatorColor, {super.key});

  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: indicatorColor,
      ),
    );
  }
}

