import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/project_model.dart';
import '../widgets/fliter_widget.dart';
import '../widgets/project_card.dart';
import '../widgets/searchbar_widget.dart';
import '../data/project_data.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int selectedTabIndex = 0;
  final TextEditingController searchController =
      TextEditingController(); //searching

  List<ProjectModel> get filteredProjects {
    final query = searchController.text.toLowerCase().trim();

    if (query.isEmpty) return projectData;

    return projectData.where((project) {
      return project.title.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Portfolio",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF303030),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/bag.svg",
                            width: 22.w,
                            height: 22.h,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFDF5532),
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          SvgPicture.asset(
                            "assets/icons/notification.svg",
                            width: 22.w,
                            height: 22.h,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFDF5532),
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  Container(
                    width: double.infinity,
                    height: 32.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        tabItem("Project", 0),
                        tabItem("Saved", 1),
                        tabItem("Shared", 2),
                        tabItem("Achievement", 3),
                      ],
                    ),
                  ),

                  SizedBox(height: 8.h),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final tabWidth = constraints.maxWidth / 4;

                      return Stack(
                        children: [
                          Container(
                            height: 1.h,
                            color: const Color(0xFFE0E0E0),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            left: selectedTabIndex * tabWidth,
                            child: Container(
                              width: tabWidth,
                              height: 2.h,
                              color: const Color(0xFFDF5532),
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: 16.h),

                  SearchbarWidget(
                    controller: searchController,
                    onChanged: () {
                      setState(() {});
                    },
                  ),

                  SizedBox(height: 16.h),

                  Expanded(
                    child: selectedTabIndex == 0
                        ? ListView.separated(
                            itemCount: filteredProjects.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              final project = filteredProjects[index];

                              return ProjectCard(
                                imagePath: project.imagePath,
                                title: project.title,
                                subject: project.subject,
                                author: project.author,
                                grade: project.grade,
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              "No Data",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Center(child: const FliterWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabItem(String title, int index) {
    final isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },

      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isSelected ? const Color(0xFFDF5532) : const Color(0xFF303030),
        ),
      ),
    );
  }
}
