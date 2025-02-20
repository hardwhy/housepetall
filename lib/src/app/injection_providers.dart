import 'package:flutter/widgets.dart';
import 'package:housepetall/src/common/network/dio_client.dart';
import 'package:housepetall/src/data/datasources/remote/review_remote_data_source.dart';
import 'package:housepetall/src/data/repositories/review_repository.dart';
import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/domain/repositories/review_repository.dart';
import 'package:provider/provider.dart';

class InjectionProviders extends StatelessWidget {
  final Widget child;
  const InjectionProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioClient>(
          create: (context) => DioClient(),
        ),
        Provider<ReviewRemoteDataSource>(
          create: (context) => ReviewRemoteDataSourceImpl(
            dio: context.read<DioClient>().dio,
          ),
        ),
        Provider<ReviewRepository>(
          create: (context) => ReviewRepositoryImpl(
            context.read<ReviewRemoteDataSource>(),
          ),
        ),
        Provider<GetReviewsUsecase>(
          create: (context) => GetReviewsUsecase(
            repository: context.read<ReviewRepository>(),
          ),
        ),
        Provider<SubmitReviewUsecase>(
          create: (context) => SubmitReviewUsecase(
            repository: context.read<ReviewRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
