import 'package:flutter/material.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/db/db_client.dart';
import 'package:matematica_vera/db/model/select_game_data.dart';
import 'package:matematica_vera/game/game_builder.dart';
import 'package:matematica_vera/screen/choose_game/widget/game_row_widget.dart';
import 'package:matematica_vera/widget/loading_widget.dart';

class ChooseGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder<SelectGameData>(
        stream: dbClient.watchSelectGameData(),
        builder:
            (BuildContext context, AsyncSnapshot<SelectGameData> snapshot) =>
                (snapshot.data != null)
                    ? _buildScreen(context, snapshot.data)
                    : LoadingWidget(),
      );

  Widget _buildScreen(BuildContext context, SelectGameData selectGameData) =>
      Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context).app_name),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GameRowWidget(
                config: GameConfigBuilder.forTag(GameTag.addition_r10),
              ),
              GameRowWidget(
                config: GameConfigBuilder.forTag(GameTag.subtraction_r10),
              ),
              GameRowWidget(
                config: GameConfigBuilder.forTag(GameTag.addition_r20),
              ),
              GameRowWidget(
                config: GameConfigBuilder.forTag(GameTag.subtraction_r20),
              ),
            ],
          ),
        ),
      );
}
