import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/data/model/barcode/barcode.dart';
import 'package:nashe_zoloto/pages/home/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';

import '../../../futures/core_widgets/custom_button.dart';

class DetailPage extends StatelessWidget {
  final BarcodeModel barcode;

  DetailPage({super.key, required this.barcode});

  final CarouselController _controller = CarouselController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return Container(
                              child: barcode.attachments[itemIndex].name
                                      .contains('.mp4')
                                  ? VideoApp(barcode.attachments[itemIndex].path)
                                  : Image.network(
                                      barcode.attachments[itemIndex].path,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return SizedBox();
                                      },
                                    ),
                            );
                          },
                          carouselController: _controller,
                          options: CarouselOptions(
                              height: 370,
                              autoPlay: true,
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) {
                                context
                                    .read<DetailBloc>()
                                    .add(DetailonChangePage(index));
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              barcode.attachments.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 12.0,
                                    height: 12.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                  ),
                                  state.pageState.current == entry.key
                                      ? Container(
                                          width: 4.0,
                                          height: 4.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1)),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ]),
                  Text(
                    barcode.name,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(barcode.brand),
                      Text(
                        '${S.code} ${barcode.code}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}




/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  final String path;
  const VideoApp(this.path);


  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Container(width: 60, height: 60, child: VideoPlayer(_controller)),
    )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
