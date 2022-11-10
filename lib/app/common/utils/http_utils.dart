// multipart_request.dart

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

typedef OnUploadProgressCallback = void Function(int uplaodProgress);

Future<Map<String, dynamic>> postMultiPartRequest({
  required String url,
  Map<String, String>? headers,
  Map<String, String>? fields,
  required Map<String, List<File>> filesData,
  required OnUploadProgressCallback onUploadProgress,
}) async {
  final request = MultipartRequest(
    'POST',
    Uri.parse(url),
    onUploadProgress: onUploadProgress,
  );

  request.headers.addAll(headers ?? {});
  request.fields.addAll(fields ?? {});
  filesData.forEach((key, value) async {
    request.files.addAll(
      await getPartsFromFiles(fieldName: key, files: value),
    );
  });
  final response = await request.send();
  final responseBytes = await response.stream.toBytes();
  final responseString = String.fromCharCodes(responseBytes);
  final data = jsonDecode(responseString) as Map<String, dynamic>;
  return data;
}

Future<List<http.MultipartFile>> getPartsFromFiles({
  required String fieldName,
  required List<File> files,
}) async {
  final parts = <http.MultipartFile>[];
  for (final img in files) {
    final name = img.path.split('/').last;
    parts.add(
      await http.MultipartFile.fromPath(fieldName, img.path, filename: name),
    );
    log(img.path);
  }
  return parts;
}

class MultipartRequest extends http.MultipartRequest {
  /// Creates a new [MultipartRequest].
  MultipartRequest(
    String method,
    Uri url, {
    this.onUploadProgress,
  }) : super(method, url);

  final void Function(int sentPercentage)? onUploadProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();
    if (onUploadProgress == null) return byteStream;

    final totalByteLength = contentLength;
    int sentBytes = 0;
    int sentPercentage = 0;
    final StreamTransformer<List<int>, List<int>> t =
        StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        sentBytes += data.length;
        final newPercentage = ((sentBytes / totalByteLength) * 100).toInt();
        if (newPercentage != sentPercentage) {
          sentPercentage = newPercentage;
          onUploadProgress?.call(sentPercentage);
        }
        if (totalByteLength >= sentBytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform<List<int>>(t);
    return http.ByteStream(stream);
  }
}
