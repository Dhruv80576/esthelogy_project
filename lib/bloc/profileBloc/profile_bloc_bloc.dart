import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:esthelogy_project/bloc/profileBloc/profile_bloc_event.dart';
import 'package:esthelogy_project/bloc/profileBloc/profile_bloc_state.dart';
import 'package:esthelogy_project/utils/imagePick.dart';


class ProfileBlocBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  final ImagePick imagePick;
  ProfileBlocBloc(this.imagePick) : super(const ProfileBlocState(
    activeImages:0,
    image: null
  )) {
    on<ProfileImageChange>((event, emit) async {
      print("hello \n\n");
        // await ImagePick.takePictureWithCamera();
        // File? image=ImagePick.getSelectedImage();
        File? image=await imagePick.selectWithCamera();
        if (image != null) {
          emit(state.copyWith(
            activeImages: state.activeImages + 1,
            image: image
          ));
        }
    });
  }
}
