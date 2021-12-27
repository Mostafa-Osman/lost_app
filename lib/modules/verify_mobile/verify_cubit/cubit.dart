import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/verify_mobile/verify_cubit/states.dart';

class VerifyCubit extends Cubit<VerifyStates> {
  VerifyCubit() : super(VerifyInitialState());

  static VerifyCubit get(context) => BlocProvider.of(context);


}
