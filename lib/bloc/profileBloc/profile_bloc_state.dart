import 'dart:io';

import 'package:equatable/equatable.dart';

class ProfileBlocState extends Equatable {
  final int activeImages;
  // final List<File> images=List.filled(4, File(''));
  final File? image;
  const ProfileBlocState({this.activeImages=0,this.image});

  ProfileBlocState copyWith({int? activeImages, File? image}) {
    return ProfileBlocState(
      activeImages: activeImages ?? this.activeImages,
      image: image ??this.image,
    );
  }

  @override
  List<Object> get props => [];
}
