import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:openvpnapppractice/helpers/colors.dart';
import 'package:openvpnapppractice/models/server.dart';
import 'package:openvpnapppractice/screens/main%20screen/main_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ServerChooser extends ViewModelWidget<MainScreenViewModel> {
  ServerChooser({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, MainScreenViewModel viewModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: viewModel.isBusy
          ? Center(child: CircularProgressIndicator())
          : ServersList(viewModel: viewModel),
    );
  }
}

class ServersList extends StatefulWidget {
  final MainScreenViewModel viewModel;
  const ServersList({Key? key, required this.viewModel}) : super(key: key);

  @override
  _ServersListState createState() => _ServersListState();
}

class _ServersListState extends State<ServersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.viewModel.servers.length,
      itemBuilder: (_, i) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: LocationTile(
          server: widget.viewModel.servers[i],
          index: i,
          onTap: () {
            setState(() {
              widget.viewModel.selected=i;
            });
          },
          selected: widget.viewModel.selected == i,
        ),
      ),
    );
  }
}

class LocationTile extends StatelessWidget {
  final Server server;
  final int index;
  final Function() onTap;
  final bool selected;
  const LocationTile({
    Key? key,
    required this.server,
    required this.index,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      selectedTileColor: Colors.green,
      selected: selected,
      onTap: onTap,
      tileColor: klocationTileColor,
      title: Text(
        server.serverName,
        style: TextStyle(color: klocationTileTextColor),
      ),
      trailing: Image.network('https://www.countryflags.io/${server.countryCode}/flat/32.png'),
    );
  }
}
