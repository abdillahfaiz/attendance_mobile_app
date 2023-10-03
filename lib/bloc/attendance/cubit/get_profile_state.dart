// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_profile_cubit.dart';

class GetProfileState extends Equatable {
  const GetProfileState(
      {required this.isLoading,
      required this.profileResponseModel,
      required this.errMsg});

  factory GetProfileState.initial() => GetProfileState(
        isLoading: false,
        profileResponseModel: ProfileResponseModel(
          id: 0,
          email: '',
          name: '',
          position: '',
          role: '',
        ),
        errMsg: '',
      );

  final String errMsg;
  final bool isLoading;
  final ProfileResponseModel profileResponseModel;

  @override
  List<Object?> get props => [
        isLoading,
        profileResponseModel,
        errMsg,
      ];
}
