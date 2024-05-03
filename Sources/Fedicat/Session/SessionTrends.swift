import TootSDK

/// https://docs.joinmastodon.org/methods/trends/
/// todo - get max limits from Platform
extension Session {

  public var supportsTrends: Bool {
    supportsTrendingPosts || supportsTrendingTags || supportsTrendingLinks
  }

  public var supportsTrendingPosts: Bool {
    platform?.supportsTrendingPosts ?? false
  }

  public var supportsTrendingTags: Bool {
    platform?.supportsTrendingTags ?? false
  }

  public var supportsTrendingLinks: Bool {
    platform?.supportsTrendingLinks ?? false
  }

  public func getTrendingPosts() async throws -> [Post] {
    let posts = try await client.getTrendingPosts(limit: trendingPostsLimit)
    await addAccounts(posts)
    return posts
  }

  public var trendingPostsLimit: Int {
    40
  }

  public func getTrendingTags() async throws -> [Tag] {
    try await client.getTrendingTags(limit: trendingTagsLimit)
    // cache tags?
  }

  public var trendingTagsLimit: Int {
    20
  }

  public func getTrendingLinks() async throws -> [TrendingLink] {
    try await client.getTrendingLinks(limit: trendingTagsLimit)
  }

  public var trendingLinksLimit: Int {
    20
  }
}
