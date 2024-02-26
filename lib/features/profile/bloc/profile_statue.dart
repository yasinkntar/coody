class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLodingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileUpdateState extends ProfileStates {}

class ProfileUpdateImage extends ProfileStates {
  String pathimage;
  ProfileUpdateImage({required this.pathimage});
}
class ProfileErrorState extends ProfileStates {
  final String error;

  ProfileErrorState({required this.error});
}

class ProfileAddAddress extends ProfileStates {}

class ProfileupdateAddress extends ProfileStates {}

class ProfiledeleteAddress extends ProfileStates {}
