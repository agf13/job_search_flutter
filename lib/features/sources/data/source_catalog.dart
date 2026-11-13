class SourceCatalogItem {
  const SourceCatalogItem(
    this.name,
    this.type,
    this.summary,
    this.url,
    this.automated,
  );
  final String name;
  final String type;
  final String summary;
  final String url;
  final bool automated;
}
