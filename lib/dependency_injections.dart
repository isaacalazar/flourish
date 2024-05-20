import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flourish/features/auth/data/repository/auth_repository.dart';
import 'package:flourish/features/auth/domain/repository/auth_repository.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/auth/usecases/user_get_data.dart';
import 'package:flourish/features/auth/usecases/user_sign_in.dart';
import 'package:flourish/features/auth/usecases/user_sign_up.dart';
import 'package:flourish/features/budget/data/datasources/budget_remote_data_source.dart';
import 'package:flourish/features/budget/data/repository/budget_repository.dart';
import 'package:flourish/features/budget/domain/repository/budget_repository.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:flourish/features/budget/usecases/fetchAllBudgets.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBudget();

  final supabase = await Supabase.initialize(
      url: "https://xbpvzrqhafvgjrxskjmy.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhicHZ6cnFoYWZ2Z2pyeHNram15Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYyMzUyODMsImV4cCI6MjAzMTgxMTI4M30.A9BL_4wdU7oT_uacTsPsmS1b8omSm6uhRS0Djyvq-t8");

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
  serviceLocator.registerFactory(
    () => UserGetData(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
        userSignIn: serviceLocator(),
        userSignUp: serviceLocator(),
        appUserCubit: serviceLocator(),
        getUserData: serviceLocator()),
  );
}

void _initBudget() {
  serviceLocator.registerFactory<BudgetRemoteDataSource>(
    () => BudgetRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<BudgetRepository>(
    () => BudgetRepositoryImpl(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => FetchAllBudgets(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => BudgetBloc(serviceLocator()),
  );
}
