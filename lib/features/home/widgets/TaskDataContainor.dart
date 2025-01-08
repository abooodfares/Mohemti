import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohemti/core/helper/my_padding_ex.dart';
import 'package:mohemti/core/helper/sizedbox%20extention.dart';
import 'package:mohemti/core/theme/colors.dart';
import 'package:mohemti/core/theme/text_style.dart';
import 'package:mohemti/core/widgets/my_app_button.dart';

class TaskDataContainer extends StatelessWidget {
  const TaskDataContainer(
      {super.key,
      required this.FirstText,
      required this.SecText,
      required this.onTap, required this.imgSrc});
  final String FirstText;
  final String SecText;
  final VoidCallback onTap;
  final String imgSrc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 60.h,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF958DB8)),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: symmetricHorizontalPadding(12),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(imgSrc),
                    size: 24.0, // Adjust size if needed
                    color: Colors.black, // Optional: Set color
                  ),
                  horizontalSpace(5),
                  Text(
                    FirstText,
                    style: AppTextStyles.weight400size16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: symmetricHorizontalPadding(12),
              child: Text(
                SecText,
                style: AppTextStyles.weight400size16
                    .copyWith(color: appcolors.secondaryColor),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
