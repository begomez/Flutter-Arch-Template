import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.actionColor,
        ),
      ),
    );
  }
}
