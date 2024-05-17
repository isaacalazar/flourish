import 'package:flourish/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flourish/features/auth/data/repository/auth_repository.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/auth/usecases/sign_user_in.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final supabase = await Supabase.initialize(
    url: "https://freqaeaajvltowpsimty.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZyZXFhZWFhanZsdG93cHNpbXR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU5MTYzMTQsImV4cCI6MjAzMTQ5MjMxNH0.4Jl8iqv4nwYPrwG8UaJz8Qv9pnsfX_nyLA2JL7SIBns",
  );

  serviceLocator.registerLazySingleton(() => supabase);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      serviceLocator(),
    ),
  );
}

void _initBudget() {}
