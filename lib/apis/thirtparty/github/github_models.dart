class Repository {
  final int id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool isPrivate;
  final User? owner; // Use nullable type for owner
  final String? htmlUrl;
  final String? description;
  final bool? isFork;
  final String? url;
  final String? forksUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final String? homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final String? hasIssues;
  final bool? hasProjects;
  final bool? hasWiki;

  Repository({
    required this.id,
    this.nodeId,
    this.name,
    this.fullName,
    required this.isPrivate,
    this.owner, // Use nullable type
    this.htmlUrl,
    this.description,
    this.isFork,
    this.url,
    this.forksUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasWiki,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      isPrivate: json['private'],
      owner: User?.fromJson(json['owner']), // Use nullable type
      htmlUrl: json['html_url'],
      description: json['description'],
      isFork: json['fork'] ?? false, // Default to false if null
      url: json['url'],
      forksUrl: json['forks_url'],
      createdAt: DateTime.tryParse(json['created_at']),
      updatedAt: DateTime.tryParse(json['updated_at']),
      pushedAt: DateTime.tryParse(json['pushed_at']),
      gitUrl: json['git_url'],
      sshUrl: json['ssh_url'],
      cloneUrl: json['clone_url'],
      svnUrl: json['svn_url'],
      homepage: json['homepage'],
    );
  }

  @override
  String toString() {
    return 'Repository(id: $id, nodeId: $nodeId, name: $name, fullName: $fullName, isPrivate: $isPrivate)';
  }
}

class User {
  final int id;
  final String? nodeId;
  final String? login;

  User({
    required this.id,
    this.nodeId,
    this.login,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nodeId: json['node_id'],
      login: json['login'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, nodeId: $nodeId, login: $login)';
  }
}

class License {
  final String? key;
  final String? name;
  final String? spdxId;

  License({
    this.key,
    this.name,
    this.spdxId,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      key: json['key'],
      name: json['name'],
      spdxId: json['spdx_id'],
    );
  }

  @override
  String toString() {
    return 'License(key: $key, name: $name, spdxId: $spdxId)';
  }
}
