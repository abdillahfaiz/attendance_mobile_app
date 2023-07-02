// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState{}
class ProfileLoaded extends ProfileState {
  ProfileResponseModel profileResponseModel;
  ProfileLoaded({
    required this.profileResponseModel,
  });
}

class ProfileError extends ProfileState {
  String message;
  ProfileError({
    required this.message,
  });

}
