import 'package:flutter/material.dart';
import 'package:openvpnapppractice/helpers/colors.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen_viewmodel.dart';
import 'package:openvpnapppractice/screens/main%20screen/widgets/connect_button.dart';
import 'package:openvpnapppractice/screens/main%20screen/widgets/connnection_status_indicator.dart';
import 'package:openvpnapppractice/screens/main%20screen/widgets/current_ip_address.dart';
import 'package:stacked/stacked.dart';

import 'widgets/server_chooser.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.nonReactive(
      fireOnModelReadyOnce: true,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (viewModel) => viewModel.initServers(),
      builder: (_, model, __) => Scaffold(
        backgroundColor: kbackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: CurrentIPAddress()
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                    ),
                    ConnectButton(),
                    SizedBox(
                      height: 20,
                    ),
                    ConnectionStatusIndicator(),
                  ],
                ),
              ),
              Expanded(
                child: ServerChooser(),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => MainScreenViewModel(),
    );
  }
}
