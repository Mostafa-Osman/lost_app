import 'package:lost_app/presentations/profile/data/profile_model/profile_model.dart';
import 'package:lost_app/presentations/profile/data/profile_web_service/profile_web_service.dart';

class ProfileRepository {
  ProfileWebService profileWebService;
  ProfileRepository(this.profileWebService);

  Future<ProfileModel> getProfileData(int startLimit) async {
    final data = await profileWebService.getProfileData(startLimit);
    return ProfileModel.fromJson(data['data'] as Map<String, dynamic>);
  }
}
