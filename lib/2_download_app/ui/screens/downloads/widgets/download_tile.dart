import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  Ressource get ressource => controller.ressource;
  String get subtitle => controller.status != DownloadStatus.notDownloaded
      ? "${(controller.progress * 100).toStringAsFixed(1)} % completed - ${(controller.progress * ressource.size).toStringAsFixed(1)} of ${ressource.size} MB"
      : "";

  IconData get statusIcon {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;

      case DownloadStatus.downloading:
        return Icons.downloading;

      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Card(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            title: Text(ressource.name),
            subtitle: Text(subtitle),
            trailing: IconButton(
              icon: Icon(statusIcon),
              onPressed: () => controller.startDownload(),
            ),
          ),
        );
      },
    );
  }
}
