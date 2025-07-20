part of 'permission_cubit.dart';

sealed class PermissionState extends Equatable {
  const PermissionState();

  @override
  List<Object> get props => [];
}

final class PermissionInitial extends PermissionState {}

final class PermissionsStatusState extends PermissionState {
  final Map<Permission, PermissionStatus> permissionStatusMap;

  const PermissionsStatusState({required this.permissionStatusMap});

  @override
  List<Object> get props => [permissionStatusMap];
}
