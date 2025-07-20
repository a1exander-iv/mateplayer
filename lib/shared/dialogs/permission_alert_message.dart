import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FilesystemPermissionAlertDialog extends StatelessWidget {
  const FilesystemPermissionAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.center,
      content: Text(
        "Предоставьте разрешение на чтение файлов. Приложение не может получить доступ к аудиофайлам!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
            onPressed: () {
              openAppSettings();
            },
            child: Text("Открыть настройки")),
      ],
    );
  }
}
