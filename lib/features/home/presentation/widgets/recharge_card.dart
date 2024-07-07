import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/navigator/router.gr.dart';

class RechargeCard extends StatelessWidget {
  final UserEntity userEntity;
  const RechargeCard({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 125.w,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, -3),
          ),
          BoxShadow(
            color: grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(3, 0),
          ),
          BoxShadow(
            color: grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(-3, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GenericText(
            text: '${userEntity.firstName} ${userEntity.lastName}',
            weight: FontWeight.w600,
            color: blue,
          ),
          GenericText(
            text: userEntity.phone,
            size: 14.sp,
            color: deepGrey,
          ),
          GestureDetector(
            onTap: () => context.pushRoute(TopUpRoute(userEntity: userEntity)),
            child: Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(20, 31, 91, 1.0), // Main color
                    Color.fromRGBO(20, 31, 91, 0.8),
                    Color.fromRGBO(20, 31, 91, 0.6),
                    Color.fromRGBO(20, 31, 91, 0.5),
                    Colors.white, // Lighter color at the bottom
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.5, 0.8, 0.9, 1.0], // Control gradient spread
                ),
              ),
              child: GenericText(
                text: 'Recharge now',
                weight: FontWeight.w500,
                size: 13.sp,
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
