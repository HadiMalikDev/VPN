import 'package:flutter/material.dart';
import 'package:openvpnapppractice/helpers/colors.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ConnectButton extends ViewModelWidget<MainScreenViewModel> {
  const ConnectButton({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, MainScreenViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        if (viewModel.connectionStatus == ConnectionStatus.Connecting) return;
        viewModel.connectionStatus==ConnectionStatus.Disconnected?viewModel.startVPN():viewModel.stopVPN();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: kbuttonBackgroundColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(
                  viewModel.connectionStatus == ConnectionStatus.Disconnected
                      ? kdisconnectColor
                      : (viewModel.connectionStatus ==
                              ConnectionStatus.Connecting
                          ? kconnectingColor
                          : kconnectedColor)),
            ),
          ),
          Icon(
            Icons.power_settings_new,
            size: 60,
            color: viewModel.connectionStatus == ConnectionStatus.Disconnected
                ? kdisconnectColor
                : (viewModel.connectionStatus == ConnectionStatus.Connecting
                    ? kconnectingColor
                    : kconnectedColor),
          ),
        ],
      ),
    );
  }
}