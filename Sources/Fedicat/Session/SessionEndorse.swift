import TootSDK

// doesn't seem like it does anything now
// (no way to display endorsed accounts from another account)
// but keep it around until it's officially deprecated?
extension Session {

  public var supportsEndorse: Bool {
    false
  }

  @discardableResult
  public func endorse(_ account: Account) async throws -> Relationship {
    try await client.endorse(account)
  }

  @discardableResult
  public func unEndorse(_ account: Account) async throws -> Relationship {
    try await client.unEndorse(account)
  }

  public func getEndorsements(_ page: PagedInfo? = nil) async throws
    -> PagedResult<[Account]>
  {
    let result = try await client.getEndorsements(
      page,
      limit: endorsementsLimit)
    await addAccounts(result.result)
    return result
  }

  private var endorsementsLimit: Int { 80 }  // platform
}
