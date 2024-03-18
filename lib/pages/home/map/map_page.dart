import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';
import 'package:nashe_zoloto/core/strings.dart';
import 'package:nashe_zoloto/pages/home/map/bloc/map_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  final MapObjectId mapObjectId = const MapObjectId('map');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc()..add(GetAddressEvent()),
      child: BlocConsumer<MapBloc, MapState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is MapLoading) {
            return Scaffold(
                body: const Center(child: CircularProgressIndicator()));
          } else if (state is MapError) {
            return Scaffold(
              body: Center(
                  child: Text(
                state.pageState.errMsg,
                style: TextStyle(color: Colors.white),
              )),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                fit: BoxFit.scaleDown,
                                'assets/pin.svg',
                              ),
                              SizedBox(width: 10,),
                              Text(
                                'Город - N салонов',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            S.city,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(S.all_salons, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  context
                                      .read<MapBloc>()
                                      .add(MapChangeTab(true)),
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/pin.svg',
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      S.on_map,
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),

                              SvgPicture.asset(
                                'assets/line.svg',
                              ),
                              GestureDetector(
                                onTap: () => {
                                  context
                                      .read<MapBloc>()
                                      .add(MapChangeTab(false)),
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/menu.svg',
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      S.list,
                                      style: TextStyle(fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                              // Expanded(
                              //   flex: 1,
                              //   child: ListTile(
                              //     title: Text(S.list),
                              //     leading: SvgPicture.asset(
                              //       'assets/pin.svg',
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Divider(color: HexColor('EBEBEB')),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  text: TextSpan(
                    text: '${S.city} ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text:
                          '(${state.pageState.mapModel.length.toString()})',
                          style: TextStyle(
                              color:
                              HexColor(AppConstants.hexColor))),
                    ],
                  ),
                ),
              ),
              Divider(color: HexColor('EBEBEB')),
              state.pageState.mapView
                  ? Expanded(
                      flex: 5,
                      child: YandexMap(
                        mapObjects: [
                          ClusterizedPlacemarkCollection(
                              mapId: mapObjectId,
                              radius: 30,
                              minZoom: 15,
                              placemarks: state.pageState.pointMap)
                        ],
                      ),
                    )
                  : Expanded(
                flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.pageState.mapModel.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${state.pageState.mapModel[index].name} (${state.pageState.mapModel[index].stores.length})'),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor(AppConstants.hexColor),
                                size: 10,
                              )
                            ],
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return Divider(color: HexColor('EBEBEB'));
                        },
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
