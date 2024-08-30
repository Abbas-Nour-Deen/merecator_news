class NewsModel {
  final String id;
  final String customUrlTitle;
  final String name;
  final String date;
  final String time;
  final String dateCreated;
  final String description;
  final bool hasDescription;
  final String mainImage;
  final String mainImageSrc;
  final String detailsImage;
  final String detailsImageSrc;
  final String videoImage;
  final String videoImageSrc;
  final dynamic featured;
  final dynamic templateId;
  final String team1;
  final String score1;
  final String team2;
  final String score2;
  final String section;
  final String source;
  final String sourceImage;
  final String sourceImageSrc;
  final String author;
  final String authorImage;
  final String authorImageSrc;
  final String websiteUrl;
  final dynamic shareURL;
  final bool important;
  final String hasVideo;
  final List<dynamic> keywords;
  final List<dynamic> photos;
  final List<dynamic> videos;

  NewsModel({
    required this.id,
    required this.customUrlTitle,
    required this.name,
    required this.date,
    required this.time,
    required this.dateCreated,
    required this.description,
    required this.hasDescription,
    required this.mainImage,
    required this.mainImageSrc,
    required this.detailsImage,
    required this.detailsImageSrc,
    required this.videoImage,
    required this.videoImageSrc,
    this.featured,
    this.templateId,
    required this.team1,
    required this.score1,
    required this.team2,
    required this.score2,
    required this.section,
    required this.source,
    required this.sourceImage,
    required this.sourceImageSrc,
    required this.author,
    required this.authorImage,
    required this.authorImageSrc,
    required this.websiteUrl,
    this.shareURL,
    required this.important,
    required this.hasVideo,
    required this.keywords,
    required this.photos,
    required this.videos,
  });

  // Factory method to create an instance from JSON
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? '',
      customUrlTitle: json['customUrlTitle'] ?? '',
      name: json['name'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      dateCreated: json['dateCreated'] ?? '',
      description: json['description'] ?? '',
      hasDescription: json['hasDescription'] ?? false,
      mainImage: json['mainImage'] ?? '',
      mainImageSrc: json['mainImageSrc'] ?? '',
      detailsImage: json['detailsImage'] ?? '',
      detailsImageSrc: json['detailsImageSrc'] ?? '',
      videoImage: json['videoImage'] ?? '',
      videoImageSrc: json['videoImageSrc'] ?? '',
      featured: json['featured'],
      templateId: json['templateId'],
      team1: json['team1'] ?? '',
      score1: json['score1'] ?? '',
      team2: json['team2'] ?? '',
      score2: json['score2'] ?? '',
      section: json['section'] ?? '',
      source: json['source'] ?? '',
      sourceImage: json['sourceImage'] ?? '',
      sourceImageSrc: json['sourceImageSrc'] ?? '',
      author: json['author'] ?? '',
      authorImage: json['authorImage'] ?? '',
      authorImageSrc: json['authorImageSrc'] ?? '',
      websiteUrl: json['websiteUrl'] ?? '',
      shareURL: json['shareURL'],
      important: json['important'] ?? false,
      hasVideo: json['hasVideo'] ?? '',
      keywords: List<dynamic>.from(json['keywords'] ?? []),
      photos: List<dynamic>.from(json['photos'] ?? []),
      videos: List<dynamic>.from(json['videos'] ?? []),
    );
  }
}
