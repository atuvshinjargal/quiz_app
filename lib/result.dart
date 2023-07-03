import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function ResetHandler;
  const Result(this.totalScore, this.ResetHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Та асуултаа дуусгалаа",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 10),
          Text(
            "Таны авсан оноо: $totalScore",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => ResetHandler(),
            child: Text("Дахин эхлэх"),
          )
        ],
      ),
    );
  }
}
