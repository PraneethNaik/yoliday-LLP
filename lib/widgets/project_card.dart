import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subject;
  final String author;
  final String grade;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subject,
    required this.author,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.w),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              bottomLeft: Radius.circular(12.r),
            ),
            child: SizedBox(
              width: 110.w,
              height: 110.h,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 10.w,
                top: 12.h,
                bottom: 12.h,
              ),
              child: Stack(
                children: [
                  // text section
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 8.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: const Color(0xFF303030),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          subject,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF303030),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          author,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9E9E9E),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // grade badge
                  Align(
                    alignment: Alignment(1, 0.7),
                    child: Container(
                      width: 50.w,
                      height: 26.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF39519), Color(0xFFFFCD67)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          grade,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
