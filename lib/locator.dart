import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app/core/api/dio_consumer.dart';
import 'app/features/checkout/data/data_source/stripe_remote_data.dart';
import 'app/features/checkout/data/data_source/test/test_cart_data.dart';
import 'app/features/checkout/data/repositories/cart_repository_imp.dart';
import 'app/features/checkout/data/repositories/payment_repository_imp.dart';
import 'app/features/checkout/data/services/stripe_local_service.dart';
import 'app/features/checkout/domain/usecases/get_cart_data_usecase.dart';
import 'app/features/checkout/domain/usecases/make_payment_usecase.dart';
import 'app/features/checkout/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'app/features/checkout/presentation/cubits/payment_cubit/payment_cubit.dart';

final getIt = GetIt.instance;

// should be init in main file before run app
initInjectionsInstances() {
  // Register Core Components like dio client
  registerCoreComponents();
  registerBlocAndCubit();
}

registerBlocAndCubit() {
  getIt.registerFactory(
    () => CartCubit(GetCartDataUseCase(CartRepositoryImp(TestCartData()))),
  );
  getIt.registerFactory(
    () => PaymentCubit(
      MakePaymentUseCase(
        PaymentRepositoryImp(
          stripeRemoteData: StripeRemoteDataImp(getIt<DioConsumer>()),
          stripeLocalService: StripeLocalServiceImpl(),
        ),
      ),
    ),
  );
}

registerCoreComponents() {
  getIt.registerLazySingleton(() => DioConsumer(dio: Dio()));
}
