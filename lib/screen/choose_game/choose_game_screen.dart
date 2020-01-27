import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:matematica_vera/config/app_color.dart';
import 'package:matematica_vera/config/app_localization.dart';
import 'package:matematica_vera/core/navigator.dart';
import 'package:matematica_vera/db/db_client.dart';
import 'package:matematica_vera/db/model/select_game_data.dart';
import 'package:matematica_vera/screen/choose_game/widget/game_row_widget.dart';
import 'package:matematica_vera/screen/generate_game/generate_game_screen.dart';
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
          title: Text(AppLocalization.of(context).appName),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: AppColor.white,),
            onPressed: () => pushScreen(context, GenerateGameScreen())),
        body: selectGameData.configs.isNotEmpty ? ListView.builder(
          itemCount: selectGameData.configs.length + 1,
          itemBuilder: (context, index) => _buildGameRowWidget(
              context,
              index,
              selectGameData),) : _buildNoGamesPlaceHolder(context),
        );

  Widget _buildGameRowWidget(BuildContext context, int index, SelectGameData selectGameData) {
    if (index == selectGameData.configs.length) {
      return Container(
        height:  88.0,
      );
    } else {
      final config = selectGameData.configs[index];
      return Slidable(
        actionPane: SlidableScrollActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: AppLocalization.of(context).delete,
            color: Colors.red,
            icon: Icons.delete,
            onTap: () async => await dbClient.removeGameConfig(config.id),
          ),
        ],
        child: GameRowWidget(
            gameConfig: config,
            lastTimeDoneOrNull: selectGameData.lastTimeGameDoneOrNull(config.id),
            isInProgress: selectGameData.isGameInProgress(config.id)),
      );
    }
  }

  Widget _buildNoGamesPlaceHolder(BuildContext context) =>
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalization.of(context).noGamesTextPlaceholder,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: AppColor.gray,
            ),
      ),
        ),);
}
