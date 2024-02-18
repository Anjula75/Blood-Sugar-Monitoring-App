import 'package:blood_suagr_monitoring_app/getStarted.dart';
import 'package:flutter/material.dart';
import 'resultPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController beforeMealsController = TextEditingController();
  TextEditingController afterMealsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetStartedPage()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Home page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Enter your blood sugar values",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Before meals (mg/dL)"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: beforeMealsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter your blood sugar value",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 5,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("After meals (mg/dL)"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: afterMealsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter your blood sugar value",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Column(
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            int beforeMealsValue =
                                int.tryParse(beforeMealsController.text) ?? 0;
                            int afterMealsValue =
                                int.tryParse(afterMealsController.text) ?? 0;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  beforeMealsValue: beforeMealsValue,
                                  afterMealsValue: afterMealsValue,
                                ),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                          ),
                          child: Text("Show Info"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomAppBar(
            color: Colors.blueGrey,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.home_rounded,
                  color: Colors.white,
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
}
