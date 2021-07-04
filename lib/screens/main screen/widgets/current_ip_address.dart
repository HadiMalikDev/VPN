import 'package:flutter/material.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CurrentIPAddress extends ViewModelWidget<MainScreenViewModel> {
  const CurrentIPAddress({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, MainScreenViewModel viewModel) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Current IP Address",
            style: TextStyle(color: Colors.purple, fontSize: 25,fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              viewModel.currentIPAddress,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
