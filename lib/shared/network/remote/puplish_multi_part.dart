import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';

Future<Map<String, dynamic>> postMultiPartRequest({
  required String url,
  Map<String, String>? headers,
  Map<String, String>? fields,
  required List<MultipartFile> files,
}) async {

  final request = MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll(headers ?? {});
  request.files.addAll(files);
  request.fields.addAll(fields ?? {});

  final response = await request.send();
  final responseBytes = await response.stream.toBytes();
  final responseString = String.fromCharCodes(responseBytes);
  log('request is ${responseString.toString()}');
  final data = jsonDecode(responseString) as Map<String, dynamic>;
  return data;
}

Future<MultipartFile> getPartFromFile(
  String fieldName,
  File file,
) async {
  final fileName = file.path.split('/').last;
  final multipartFile = await MultipartFile.fromPath(
    fieldName,
    file.path,
    filename: fileName,
  );
  return multipartFile;
}

Future<List<MultipartFile>> getPartsFromFiles(
  String fieldName,
  List<File> images,
) async {
  final List<MultipartFile> filesAsParts = [];
  for (final image in images) {
    filesAsParts.add(await getPartFromFile(fieldName,image));
  }
  return filesAsParts;
}
