import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/data/model/barcode/barcode.dart';
import 'package:nashe_zoloto/pages/home/detail/bloc/detail_bloc.dart';
import 'package:nashe_zoloto/pages/home/qr_code/bloc/qr_code_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../futures/core_widgets/custom_button.dart';

class DetailPage extends StatelessWidget {
  final BarcodeModel barcode;

  DetailPage({super.key, required this.barcode});

  final CarouselController _controller = CarouselController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => DetailBloc(),
      child: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // if (state is HomeLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (state is HomeError) {
          //   return Center(
          //       child: Text(
          //         state.pageState.errMsg,
          //         style: TextStyle(color: Colors.white),
          //       ));
          // }
          return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            CarouselSlider.builder(
                              itemCount: barcode.attachments.length,
                              itemBuilder:
                                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                                  Container(
                                    child: Image.network(
                                      barcode.attachments[itemIndex].path,
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, error, stackTrace) {
                                        return SizedBox();
                                      },
                                    ),
                                  ),
                              carouselController: _controller,
                              options: CarouselOptions(
                                  height: 370,
                                  autoPlay: true,
                                  enlargeCenterPage: false,
                                  onPageChanged: (index, reason) {
                                    context.read<DetailBloc>().add(DetailonChangePage(index));
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: barcode.attachments.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => _controller.animateToPage(entry.key),
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Container(
                                        width: 12.0,
                                        height: 12.0,
                                        margin:
                                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.black, width: 1)
                                        ),
                                      ),
                                      state.pageState.current == entry.key ?
                                      Container(
                                        width: 4.0,
                                        height: 4.0,
                                        margin:
                                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.black, width: 1)
                                        ),
                                      ) : SizedBox()
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ]),
                      Text(barcode.name, style: TextStyle(fontSize: 24, ), textAlign: TextAlign.center,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(barcode.brand),
                          Text('${S.code} ${barcode.code}', style: TextStyle(color: Colors.grey),),
                        ],
                      )
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}

