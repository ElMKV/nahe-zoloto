import 'package:get_it/get_it.dart';

import 'pages/auth/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => AuthBloc());


  // // Use cases
  // getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  // getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  // getIt.registerLazySingleton(() => SearchMovies(getIt()));
  //
  // // Repositories
  // getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));
  //
  // // Data sources
  // getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: getIt()));

  // Http service
  // getIt.registerLazySingleton(() => http.Client());

}