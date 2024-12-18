import 'dart:convert';
import 'package:http/http.dart' as http;

class BaiduNetdisk {
  String accessToken;
  String refreshToken;
  String clientId;
  String clientSecret;

  BaiduNetdisk({
    required this.accessToken,
    required this.refreshToken,
    required this.clientId,
    required this.clientSecret,
  });

  // Refresh token
  Future<void> refreshTokens() async {
    final url = Uri.parse('https://openapi.baidu.com/oauth/2.0/token');
    final response = await http.post(url, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    }, body: {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': clientId,
      'client_secret': clientSecret,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      accessToken = data['access_token'];
      refreshToken = data['refresh_token'];
    } else {
      throw Exception('Failed to refresh token: ${response.body}');
    }
  }

  // Generic HTTP request
  Future<http.Response> request(String url, String method, {
    Map<String, String>? queryParams,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParams);
    headers = {
      ...?headers,
      'Authorization': 'Bearer $accessToken',
    };

    switch (method.toUpperCase()) {
      case 'GET':
        return await http.get(uri, headers: headers);
      case 'POST':
        return await http.post(uri, headers: headers, body: body);
      default:
        throw UnsupportedError('$method is not supported');
    }
  }

  // Fetch files
  Future<List<dynamic>> getFiles(String dir) async {
    final params = {
      'method': 'list',
      'dir': dir,
      'web': 'web',
    };

    final response = await request(
      'https://pan.baidu.com/rest/2.0/xpan/file',
      'GET',
      queryParams: params,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['list'];
    } else {
      throw Exception('Failed to fetch files: ${response.body}');
    }
  }

  // Create file or directory
  Future<void> create(String path, int size, int isDir, {
    String? uploadId,
    String? blockList,
    int? mtime,
    int? ctime,
  }) async {
    final params = {'method': 'create'};
    final form = {
      'path': path,
      'size': size.toString(),
      'isdir': isDir.toString(),
      'rtype': '3',
      if (uploadId != null) 'uploadid': uploadId,
      if (blockList != null) 'block_list': blockList,
      if (mtime != null) 'local_mtime': mtime.toString(),
      if (ctime != null) 'local_ctime': ctime.toString(),
    };

    final response = await request(
      'https://pan.baidu.com/rest/2.0/xpan/file',
      'POST',
      queryParams: params,
      body: form,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create file: ${response.body}');
    }
  }

  // Get download link
  Future<String> getDownloadLink(String fileId) async {
    final params = {
      'method': 'filemetas',
      'fsids': '[$fileId]',
      'dlink': '1',
    };

    final response = await request(
      'https://pan.baidu.com/rest/2.0/xpan/multimedia',
      'GET',
      queryParams: params,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['list'][0]['dlink'] + '&access_token=$accessToken';
    } else {
      throw Exception('Failed to get download link: ${response.body}');
    }
  }

  // Manage files (e.g., delete, move)
  Future<void> manageFiles(String operation, List<String> fileList) async {
    final params = {
      'method': 'filemanager',
      'opera': operation,
    };
    final form = {
      'filelist': jsonEncode(fileList),
      'async': '0',
      'ondup': 'fail',
    };

    final response = await request(
      'https://pan.baidu.com/rest/2.0/xpan/file',
      'POST',
      queryParams: params,
      body: form,
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to manage files: ${response.body}');
    }
  }

  // Decrypt MD5
  static String decryptMd5(String encryptedMd5) {
    if (RegExp(r'^[0-9a-fA-F]{32}\$').hasMatch(encryptedMd5)) {
      return encryptedMd5;
    }

    final output = StringBuffer();
    for (int i = 0; i < encryptedMd5.length; i++) {
      int value = int.tryParse(encryptedMd5[i], radix: 16) ?? 0;
      if (i == 9) {
        value ^= 15 & i;
        output.write(String.fromCharCode(value + 'g'.codeUnitAt(0)));
      } else {
        value ^= 15 & i;
        output.write(value.toRadixString(16));
      }
    }

    return output.toString();
  }

  // Encrypt MD5
  static String encryptMd5(String originalMd5) {
    final reversed = originalMd5.substring(8, 16) +
        originalMd5.substring(0, 8) +
        originalMd5.substring(24, 32) +
        originalMd5.substring(16, 24);

    final output = StringBuffer();
    for (int i = 0; i < reversed.length; i++) {
      int value = int.tryParse(reversed[i], radix: 16) ?? 0;
      value ^= 15 & i;
      if (i == 9) {
        output.write(String.fromCharCode(value + 'g'.codeUnitAt(0)));
      } else {
        output.write(value.toRadixString(16));
      }
    }

    return output.toString();
  }

  // Get slice size
  int getSliceSize({int customSize = 0, int vipType = 0}) {
    const defaultSliceSize = 4 * 1024 * 1024; // 4MB
    const vipSliceSize = 16 * 1024 * 1024; // 16MB
    const svipSliceSize = 32 * 1024 * 1024; // 32MB

    if (customSize > 0) {
      return customSize;
    }
    switch (vipType) {
      case 1:
        return vipSliceSize;
      case 2:
        return svipSliceSize;
      default:
        return defaultSliceSize;
    }
  }
}
