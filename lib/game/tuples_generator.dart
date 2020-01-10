import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class TuplesGenerator {

  static List<Tuple2<int, int>> generateForAddition({
    @required int maxNumber,
    @required int desiredCount
  }) {
    final random = Random(DateTime.now().millisecondsSinceEpoch);

    List<Tuple2<int, int>> numbers = [];

    for (int i=0; i<=maxNumber; i++) {
      for (int j=0; j<=maxNumber; j++) {
        if (i + j <=maxNumber) {
          numbers.add(Tuple2(i, j));
        }
      }
    }

    numbers.shuffle(random);

    if (numbers.length > desiredCount) {
      numbers = numbers.take(desiredCount).toList();
    }

    if (numbers.length < desiredCount) {
      do {
        final a = random.nextInt(maxNumber);
        final b = random.nextInt(maxNumber);

        if (a+b <= maxNumber) {
          numbers.add(Tuple2(a,b));
        }
      }
      while ( numbers.length != desiredCount);
    }

    numbers.shuffle(random);

    return numbers;
  }

  static List<Tuple2<int, int>> generateForSubtraction({
    @required int maxNumber,
    @required int desiredCount
  }) {
    final random = Random(DateTime.now().millisecondsSinceEpoch);

    List<Tuple2<int, int>> numbers = [];

    for (int i=0; i<=maxNumber; i++) {
      for (int j=0; j<=maxNumber; j++) {
        if (i - j <=maxNumber && i - j >=0) {
          numbers.add(Tuple2(i, j));
        }
      }
    }

    numbers.shuffle(random);

    if (numbers.length > desiredCount) {
      numbers = numbers.take(desiredCount);
    }

    if (numbers.length < desiredCount) {
      do {
        final a = random.nextInt(maxNumber);
        final b = random.nextInt(maxNumber);

        if (a+b <= maxNumber && a-b >= 0) {
          numbers.add(Tuple2(a,b));
        }
      }
      while ( numbers.length != desiredCount);
    }

    numbers.shuffle(random);

    return numbers;
  }

}