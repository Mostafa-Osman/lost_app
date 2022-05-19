import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

Future<Map<String, dynamic>> postMultiPartRequest({
  required String url,
  Map<String, String>? headers,
  Map<String, String>? fields,
  required List<File> files,
}) async {
  final parts = await getPartsFromFiles(files);
  final request = MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll(headers ?? {});
  request.files.addAll(parts);
  request.fields.addAll(fields ?? {});
  final response = await request.send();
  final responseBytes = await response.stream.toBytes();
  final responseString = String.fromCharCodes(responseBytes);
  final data = jsonDecode(responseString) as Map<String, dynamic>;
  return data;
}

Future<List<MultipartFile>> getPartsFromFiles(List<File> images) async {
  final List<MultipartFile> parts = [];
  for (final image in images) {
    final fileName = image.path.split('/').last;
    parts.add(
      await MultipartFile.fromPath(
        'images',
        image.path,
        filename: fileName,
      ),
    );
  }
  return parts;
}
