import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flourish/features/auth/data/repository/auth_repository.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/auth/usecases/user_sign_in.dart';
import 'package:flourish/features/auth/usecases/user_sign_up.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final supabase = await Supabase.initialize(
    url: "https://mdehuriwdlblkfnmyegp.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kZWh1cml3ZGxibGtmbm15ZWdwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYwMDIzODUsImV4cCI6MjAzMTU3ODM4NX0.BRTFYDup10_k6WQMtlRvUGQR_RR14AB2cwTONhzBZa4",
  );

  serviceLocator.registerLazySingleton(() => AppUserCubit());

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
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
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => AuthBloc(serviceLocator(), serviceLocator(), serviceLocator()),
  );
}

void _initBudget() {}
