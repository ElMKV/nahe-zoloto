import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';
import 'package:nashe_zoloto/pages/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // return Scaffold(
    //   body: BlocProvider(
    //       // create: (context) => HomeBloc()..add(WeatherGetEvent()),
    //       create: (context) => HomeBloc(),
    //       child: BlocConsumer<HomeBloc, HomeState>(
    //         listener: (context, state) {
    //           // TODO: implement listener
    //         },
    //         builder: (context, state) {
    //           print(state);
    //           if (state is HomeLoading) {
    //             return const Center(child: CircularProgressIndicator());
    //           } else if (state is HomeError) {
    //             return Center(child: Text(state.pageState.errMsg, style: TextStyle(color: Colors.white),));
    //           }
    //           return SingleChildScrollView(
    //             child: Text('home'),
    //           );
    //         },
    //       )),
    // );

    return BlocProvider(
      create: (context) => HomeBloc(),
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              color: HexColor(AppConstants.hexColor),
              shape: CircularNotchedRectangle(),
              child: Container(
                height: 75,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.home),
                      onPressed: () {
                        context.read<HomeBloc>().add(HomeChangePage(0));
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.search),
                      onPressed: () {
                        context.read<HomeBloc>().add(HomeChangePage(1));

                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        context.read<HomeBloc>().add(HomeChangePage(2));

                        // setState(() {
                        //   _myPage.jumpToPage(2);
                        // });
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: PageView(
              controller: state.pageState.currentPage,
              onPageChanged: (int) {
                print('Page Changes to index $int');
              },
              children: <Widget>[
                Center(
                  child: Container(
                    child: Text('Empty Body 0'),
                  ),
                ),
                Center(
                  child: Container(
                    child: Text('Empty Body 1'),
                  ),
                ),
                Center(
                  child: Container(
                    child: Text('Empty Body 2'),
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
