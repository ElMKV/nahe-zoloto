import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/pages/home/map/bloc/map_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  final MapObjectId mapObjectId =
  const MapObjectId('map');

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
          return YandexMap(
            mapObjects: [
              ClusterizedPlacemarkCollection(
                mapId: mapObjectId,
                radius: 30,
                minZoom: 15,
                placemarks: [
                  PlacemarkMapObject(
                      mapId: const MapObjectId('placemark_1'),
                      point: const Point(
                          latitude: 55.756, longitude: 37.618),
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              'assets/point.png')))),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
