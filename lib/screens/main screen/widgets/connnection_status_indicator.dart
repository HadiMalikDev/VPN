import 'package:flutter/material.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ConnectionStatusIndicator extends ViewModelWidget<MainScreenViewModel> {
  const ConnectionStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MainScreenViewModel viewModel) {
    return StreamBuilder(
      stream: viewModel.vpnStatus,
      builder: (_, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          if(snapshot.hasError){
            return Text('Error',style: TextStyle(color: Colors.white),);
          }
          else{
            return Text(snapshot.data,style: TextStyle(color: Colors.white),);
          }
        }
        else{
          if(snapshot.hasError){
            return Text(snapshot.error.toString(),style: TextStyle(color: Colors.white),);
          }
          else{
            return Text('',style: TextStyle(color: Colors.white),);
          }
        }
      },
    );
  }
}
