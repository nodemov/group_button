import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

void main() {
  runApp(CommonExample());
}

class CommonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShowButtonGroup()
      ),
    );
  }
}


class ShowButtonGroup extends StatelessWidget {

 final Color primaryColor = Color(0xFF007468);
   List<String> imagesList = [
    "https://api.thesilpa.com/storage/product/category/81MleLS4UNRGa.png",
    "https://api.thesilpa.com/storage/product/category/99uCZVEc6I13j.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
          child: GroupButton(
            spacing: 14,
            isRadio: false,
            buttonWidth: MediaQuery.of(context).size.width * 1 - 44,
            buttonHeight: 50,
            buttons: const ['12:00', '13:00'],
            images: imagesList,
            selectedButtons: const [],
            unselectedBorderColor: primaryColor,
            onSelected: (i, selected) => debugPrint('Button #$i selected'),
          ),
        );
  }
}