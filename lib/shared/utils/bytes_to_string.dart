import 'dart:math';

String bytesToString(int bytes, {int numbers = 3}) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  int i = (log(bytes) / log(1000)).floor();
  double value = bytes / pow(1000, i);
  return "${value.toStringAsPrecision(numbers)} ${suffixes[i]}";
}

String kibibytesToString(int bytes, {int numbers = 3}) {
  if (bytes <= 0) return "0 B";
  const suffixes = [
    "B",
    "KiB",
    "MiB",
    "GiB",
    "TiB",
    "PiB",
    "EiB",
    "ZiB",
    "YiB"
  ];
  int i = (log(bytes) / log(1024)).floor();
  double value = bytes / pow(1024, i);
  return "${value.toStringAsPrecision(numbers)} ${suffixes[i]}";
}
