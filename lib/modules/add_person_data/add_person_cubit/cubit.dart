import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/modules/add_person_data/add_person_cubit/states.dart';

class AddPersonDataCubit extends Cubit<PersonDataStates> {
  AddPersonDataCubit() : super(PersonDataInitialState());

  static AddPersonDataCubit get(context) => BlocProvider.of(context);

  List<int> listPhoto=[] ;

  addPicture() {
    listPhoto.add(1);
    emit(PictureState());
  }
}
