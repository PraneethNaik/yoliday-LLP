import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTap;

  const BottomNavbarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: navItem(0, "assets/icons/Home svg.svg", "Home")),
          Expanded(
            child: navItem(1, "assets/icons/Portfolia svg.svg", "Portfolio"),
          ),
          Expanded(child: navItem(2, "assets/icons/Input svg.svg", "Input")),
          Expanded(
            child: navItem(3, "assets/icons/Profile svg.svg", "Profile"),
          ),
        ],
      ),
    );
  }

  Widget navItem(int index, String iconPath, String label) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 24.w,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2.w,
                  color: isSelected
                      ? const Color(0xFFDF5532)
                      : Colors.transparent,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          SvgPicture.asset(
            iconPath,
            width: 18.w,
            height: 20.h,
            colorFilter: ColorFilter.mode(
              isSelected ? const Color(0xFFDF5532) : const Color(0xFFD6D1D5),
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? const Color(0xFFDF5532)
                  : const Color(0xFFD6D1D5),
            ),
          ),
        ],
      ),
    );
  }
}
