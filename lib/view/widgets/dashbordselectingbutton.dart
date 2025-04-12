import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:flutter/material.dart';

class DashbordSelectingButton extends StatelessWidget {
  String? buttontitle;
  final Function? onTap;
  DashbordSelectingButton({Key? key, required this.buttontitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as Function(),
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 215, 224, 226),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              buttontitle ?? '',
              style: AppTheme.titleStyle,
            ),
          ),
        ),
      ),
    );
  }
}
