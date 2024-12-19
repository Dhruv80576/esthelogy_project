import 'package:equatable/equatable.dart';
abstract class ProfileBlocEvent extends Equatable {
  const ProfileBlocEvent();

  @override
  List<Object> get props => [];
}

class ProfileImageChange extends ProfileBlocEvent {
//   final String image;
//   const ProfileImageChange(this.image);
//   @override
//   List<Object> get props => [image];
}
