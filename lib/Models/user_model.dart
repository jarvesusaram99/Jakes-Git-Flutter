class Post {
  // ignore: non_constant_identifier_names
  final String name, language, description , avatar_url , open_issues,watchers;

  Post({
    required this.name,
    required this.language,
    required this.description,
    required this.avatar_url,
    required this.open_issues,
    required this.watchers,
    
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      name: json['name'].toString(),
      language: json['language'].toString(),
      description: json['description'].toString(),
      avatar_url: json['avatar_url'].toString(),
      open_issues: json['open_issues'].toString(),
        watchers: json['watchers'].toString(),
      
    );
  }
}