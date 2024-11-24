import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
symmetricverticalPadding(double value) => EdgeInsets.symmetric( vertical: value.h );

symmetricHorizontalPadding(double value) => EdgeInsets.symmetric(horizontal: value.w);

allPadding(double value) => EdgeInsets.all(value.w);
rightPadding(double value) => EdgeInsets.only(right: value.w);
leftPadding(double value) => EdgeInsets.only(left: value.w);
topPadding(double value) => EdgeInsets.only(top: value.h);
bottomPadding(double value) => EdgeInsets.only(bottom: value.h);