# _matematica vera_ mobile app

## Overview

_Matematica vera_ is a mobile app, that helps children get familiar with the basics of mathematics. It features a list of games where the user is presented with a number of mathematical tasks like addition, subtraction, multiplication or division. For each of them, several answers are shown. By selecting the correct answer user goes to the next task, selecting the incorrect one increases errors count and shuffles possible answers. Additionally, the app features a game creator where user can define their games.

![App screenshots](/promo/screenshots.jpg "App screenshots")

App got written in Dart using the Flutter framework. It uses `flutter_bloc` to manage games' states, `moor` database to store games' templates, games' states and last time game done timestamps, `json_serilizable` to (surprise) serialize object to/from JSON and `flutter_localizations` for internationalization (app is available in English, Polish and Italian).

## Installing

Please refer to the [official documentation](https://flutter.dev/docs/get-started/install) to learn how to set up Flutter on your machine, build the app for the desired platform, install on your device and run.  Also, please notice, that the app was never tested on iOS phones.