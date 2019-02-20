class GetData {
  final int AlbumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  GetData({this.AlbumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      AlbumId: json['AlbumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      url: json['url'] as String,
    );
  }
}