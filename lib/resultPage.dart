import 'package:blood_suagr_monitoring_app/homePage.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int beforeMealsValue;
  final int afterMealsValue;

  ResultPage({required this.beforeMealsValue, required this.afterMealsValue});

  @override
  Widget build(BuildContext context) {
    // Perform blood sugar category calculation
    String bloodSugarCategory =
        calculateCategory(beforeMealsValue, afterMealsValue);
    Color boxColor = _getBoxColor(bloodSugarCategory);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Blood sugar category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(
              height: 50,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 30, left: 20, bottom: 30, right: 20),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                ' $bloodSugarCategory',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            color: Colors.blueGrey,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.person, color: Colors.white),
                Icon(Icons.notifications, color: Colors.white),
                Icon(Icons.help_outlined, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String calculateCategory(int beforeValue, int afterValue) {
    if (beforeValue >= 70 && beforeValue <= 100 && afterValue < 140) {
      return 'Normal';
    } else if ((beforeValue >= 100 && beforeValue <= 125) ||
        (afterValue >= 140 && afterValue <= 199)) {
      return 'Prediabetic';
    } else {
      return 'Type 2 Diabetic';
    }
  }

  Color _getBoxColor(String category) {
    switch (category) {
      case 'Normal':
        return Colors.green;
      case 'Prediabetic':
        return Colors.pink[100]!;
      case 'Type 2 Diabetic':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
