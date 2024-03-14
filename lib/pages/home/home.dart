import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/data/model/profile/profile.dart';
import 'package:nashe_zoloto/futures/core_widgets/custom_button.dart';
import 'package:nashe_zoloto/pages/home/bloc/home_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'qr_code/qr_code_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetProfileEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            return Center(
                child: Text(
              state.pageState.errMsg,
              style: TextStyle(color: Colors.white),
            ));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor(AppConstants.hexColor),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.exit_to_app_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              backgroundColor: HexColor(AppConstants.hexColor),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    'assets/home.svg',
                  ),
                  label: S.home,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    'assets/scan-qr-code.svg',
                  ),
                  label: S.qr_code,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    fit: BoxFit.scaleDown,
                    'assets/map.svg',
                  ),
                  label: S.map,
                ),
              ],
              currentIndex: state.pageState.intCurrentPage,
              selectedLabelStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white),
              onTap: (int index) {
                context.read<HomeBloc>().add(HomeChangePage(index));
              },
            ),
            body: PageView(
              controller: state.pageState.currentPage,
              onPageChanged: (int) {
              },
              children: <Widget>[
                StretchableSliverAppBar(state.pageState.profile),

                Center(
                  child: Container(
                    child: QRCodePage(),
                  ),
                ),
                Center(
                  child: Container(
                    child: Text('Empty Body 3'),
                  ),
                )
              ],
              physics:
                  NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
            ),
          );
        },
      ),
    );
  }
}

class StretchableSliverAppBar extends StatefulWidget {
  final Profile profile;

  const StretchableSliverAppBar(this.profile, {super.key});

  @override
  State<StretchableSliverAppBar> createState() => PlayingSliversState();
}

class PlayingSliversState extends State<StretchableSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                  expandedHeight: 150, profile: widget.profile),
            ),
            SliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final Profile profile;

  CustomSliverDelegate({
    required this.expandedHeight,
    required this.profile,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: HexColor(AppConstants.hexColor),
              elevation: 0.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text(profile.name.toString())),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 1,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 160,
                      child: Image.asset(
                        "assets/profile_with_background.png",
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        GetSubString(profile.name.toString()),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        profile.post.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        profile.division.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  String GetSubString(String name) {
    List<String> nameDivided = name.split(" ");

    if (nameDivided.isNotEmpty) {
      return '${nameDivided[1]} ${nameDivided[2]}';
    } else {
      return '';
    }
  }
}

