import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size; // in MB

  Ressource({required this.name, required this.size});
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  double _progress = 0.0; // 0.0 → 1.0

  // GETTERS
  DownloadStatus get status => _status;
  double get progress => _progress;

  // ACTIONS
  Future<void> startDownload() async {
    notifyListeners();
    if (_status == DownloadStatus.downloading ||
        _status == DownloadStatus.downloaded) {
      return;
    }

    _status = DownloadStatus.downloading;
    for (int i = 0; i < 10; i++) {
      _progress += 0.1;
      await Future.delayed(const Duration(milliseconds: 1000));
      notifyListeners();
    }

    _status = DownloadStatus.downloaded;
    notifyListeners();
  }
}
