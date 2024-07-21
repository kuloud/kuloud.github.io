import 'dart:convert';

import 'package:homepage/apis/thirtparty/github/github_models.dart';
import 'package:http/http.dart' as http;
import 'package:x_common/utils/logger.dart';

Future<List<Repository>?> getOwnRepositories(String username) async {
  final url = Uri.parse('https://api.github.com/users/$username/repos');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    try {
      final repos = (json as List).map((e) => Repository.fromJson(e)).toList();
      // logger.d('repos----------: $repos');
      return repos;
    } catch (e) {
      logger.e('Failed to load', error: e);
    }

    // Now you can use the 'projects' list
  } else {
    logger.e('Failed to load');
  }
  return null;
}
