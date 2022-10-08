
import 'package:flutter/material.dart';
import 'constants.dart';

class bottomButton extends StatelessWidget {
  bottomButton({@required this.ontap, @required this.buttontitle});
  final Function ontap;
  final String buttontitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(child: Text(buttontitle, style: kLargeButtomStyle,)),
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
            color: kBottomContainerColor,
            borderRadius: BorderRadius.circular(10.0)
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}