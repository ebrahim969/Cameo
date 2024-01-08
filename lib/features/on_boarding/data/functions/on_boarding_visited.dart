import 'package:tigor_store/core/database/cache/cache_helper.dart';
import 'package:tigor_store/core/services/service_locator.dart';

void onBoardingVisited()
{
  getIt<CacheHelper>().saveData(key: "OnBoardingVisited", value: true);
}