import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AIMoneylineAddsToBetsTracker extends StatelessWidget {
  const AIMoneylineAddsToBetsTracker({super.key});

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
      body: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
        ),
        child: Column(
          children: [
            AddToBetsTrackerMatchInformation(),
            SizedBox(height: 20,),
            NewBetForm(),
            SizedBox(height: 30,),
            AddButton(),
            SizedBox(height: 10,),
            RedirectionMessage(),
          ],
        ),
      )
    );
  }
}

class AddToBetsTrackerMatchInformation extends StatelessWidget {
  const AddToBetsTrackerMatchInformation(
      this.homeTeamImage,
      this.homeTeamName,
      this.date,
      this.time,
      this.isLive,
      this.awayTeamImage,
      this.awayTeamName,
      {super.key}
      );

  final String homeTeamImage;
  final String homeTeamName;
  final String date;
  final String time;
  final bool isLive;
  final String awayTeamImage;
  final String awayTeamName;

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
      ],
    );
  }
}

class NewBetForm extends StatelessWidget {
  const NewBetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Column(
          spacing: 5,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Bet name",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            TextField(
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  filled: false,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white.withValues(alpha: 20),
                      )
                  )
              ),
            ),
          ],
        ),
        Column(
          spacing: 5,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Sportsbook",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: Colors.white.withValues(alpha: 20), width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(child: Text("Select Sportsbook"), value: ""),
                    DropdownMenuItem(child: Text("Fliff"), value: "Fliff"),
                  ],
                  onChanged: (value) {},
                ),
              ),
            )
          ],
        ),
        Column(
          spacing: 5,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Odd price",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            TextField(
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  filled: false,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white.withValues(alpha: 20),
                      )
                  )
              ),
            ),
          ],
        ),
        Column(
          spacing: 5,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Bet Amount",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            TextField(
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white.withValues(alpha: 20),
                  )
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 1,
              color: Colors.white.withValues(alpha: 20),
            ),
          ),
          backgroundColor: Color(0xFFFF7950),
          foregroundColor: Colors.white.withValues(alpha: 20),
          textStyle: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(
          "Add to bet tracker",
        ),
      ),
    );
  }
}

class RedirectionMessage extends StatelessWidget {
  const RedirectionMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        spacing: 1,
        children: [
          Icon(Icons.info_outline_rounded, color: Colors.white.withValues(alpha: 70),),
          Text(
            "You’ll be redirected to the Bets page",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 70),
            ),
          ),
        ],
      ),
    );
  }
}
