import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:ifresh_originals_admin_panel/controller/home_controller.dart';
import 'package:ifresh_originals_admin_panel/view/widgets/common_widgets.dart';

SizedBox stickerWidget() {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Center(
      child: commonText(
          title: "Sticker Widget"
      ),
    ),
  );
}