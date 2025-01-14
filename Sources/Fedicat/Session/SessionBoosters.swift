import TootSDK

extension Session {

  public var supportsBoosters: Bool {
    platform?.supportsBoosters ?? false
  }

  public func getBoosters(
    of post: Post,
    _ page: PagedInfo? = nil
  ) async throws -> PagedResult<[Account]> {
    let result = try await client.getBoosters(
      of: post,
      page, limit: boosterPageLimit)
    await addAccounts(result.result)
    return result
  }

  private var boosterPageLimit: Int? {
    platform?.boosterPageLimit
  }
}
