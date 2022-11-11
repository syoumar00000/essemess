//white headline 6

import 'package:flutter/material.dart';

//text H6
TextStyle? kHeadline6(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.headline6?.copyWith(
          color: color ?? null,
        );

//text H5
TextStyle? kHeadline5(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.headline5?.copyWith(
          color: color ?? null,
        );

//text Caption
TextStyle? kCaption(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.caption?.copyWith(
          color: color ?? null,
        );

//text subtitle 1
TextStyle? kSubtitle1(BuildContext context, [Color? color]) =>
    Theme.of(context).textTheme.subtitle1?.copyWith(
          color: color ?? null,
        );
