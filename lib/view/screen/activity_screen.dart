import 'dart:developer';

import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Activity List',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 9,
          children: List.generate(81, (index) {
            const String number =
                '000111000100110000110101001100010011100011010110110001101010110001001010001010011';
            final spilt = number.split('');

            return Center(
              child: spilt[index] == '1'
                  ? Container(
                      width: 20,
                      height: 20,
                      color: Colors.red,
                    )
                  : const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                    ),
            );
          }),
        ),
      ),
    );
  }
}
