import 'package:flutter/material.dart';
import 'homePage.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                "images/fgm.png",
                width: 300,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    "Get start",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 220,
          ),
          Text(
            "ALL RIGHTS RESERVED @ 2024 ANJULAPASINDU",
            style: TextStyle(
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
