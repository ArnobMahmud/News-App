class ArticleModel {
  String author;
  String title;
  String url;
  String description;
  String urlToImage;
  String content;
  DateTime publishedAt;

  ArticleModel(
      {this.author,
      this.title,
      this.content,
      this.description,
      this.urlToImage,
      this.url,
      this.publishedAt});
}
