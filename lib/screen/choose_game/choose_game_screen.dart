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
                    : Material(child: LoadingWidget()),
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
              _buildGameRowWidget(GameTag.addition_r10, selectGameData),
              _buildGameRowWidget(GameTag.subtraction_r10, selectGameData),
              _buildGameRowWidget(GameTag.addition_r20, selectGameData),
              _buildGameRowWidget(GameTag.subtraction_r20, selectGameData),
            ],
          ),
        ),
      );
  Widget _buildGameRowWidget(GameTag gameTag, SelectGameData selectGameData) =>
      GameRowWidget(
        gameTag: gameTag,
        lastTimeDoneOrNull: selectGameData.lastTimeGameDoneOrNull(gameTag),
        isInProgress: selectGameData.isGameInProgress(gameTag));
}
