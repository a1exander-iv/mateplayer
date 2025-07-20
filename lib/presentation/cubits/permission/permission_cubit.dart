import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());

  Map<Permission, PermissionStatus> permissionStatusMap = {};

  void checkPermissions() async {
    if (Platform.isAndroid) {
      var storageStatus = await Permission.storage.status;
      var audioStatus = await Permission.audio.status;

      permissionStatusMap[Permission.storage] = storageStatus;
      permissionStatusMap[Permission.audio] = audioStatus;
      if (permissionStatusMap[Permission.audio] != PermissionStatus.granted &&
          permissionStatusMap[Permission.storage] != PermissionStatus.granted) {
        await requestPermissions(permissionStatusMap);
      }
    }
  }

  Future<void> requestPermissions(
      Map<Permission, PermissionStatus> permissionMap) async {
    permissionStatusMap = await [
      Permission.storage,
      Permission.audio,
    ].request();

    emit(PermissionsStatusState(permissionStatusMap: permissionStatusMap));
  }
}
