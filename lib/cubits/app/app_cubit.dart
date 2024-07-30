import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/service/preference.dart';
import 'app_state.dart';

/// AppCubit - for starting App from Login,Main screen,OnBoarding
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

}
