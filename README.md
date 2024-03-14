This repo started out as just a list of all the [Mastodon iOS apps](iosapps.md) I've found, but now it's also the github public home base for my [fediverse app](https://fedicat.com/) in progress and an associated Swift package with some possibly useful reusable code, mainly [TootSDK](https://github.com/TootSDK/TootSDK) extensions featuring:

- an object-oriented interface so you operate on objects like `client.boost(post)` instead of `client.boostPost(id: id)`
- predicates like `post.isBoosted` will treat nil as false (not always correct, sometimes a platform will just choose not supply a value in that context)
- Common operation names on different types, e.g. `post.refresh()` and `account.refresh()`, `tag.follow()` and `account.refresh()`...
- Simplified arguments, try to accomodate most common cases and avoid having to fill out parameter structs, e.g. call `updateProfile()`, `updateAccountSettings`, and `updatePostDefaults` instead of calling `updateCredentials` with a filled-out parameter struct.
- Platform descriptors with feature supports checks based on detected API version. Their inheritance hierarchy mirros forking relationships, e.g. `Hometown` is a subclass of `Mastodon`.
- Random other conveniences

## Style

Try to follow the [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)

Formatted and checked with [swift-format](https://github.com/apple/swift-format).

## Stability

This package is not stable since [Fedicat the app](https://fedicat.com/) is in active development and sometimes relies on my [fork of TootSDK](https://github.com/technicat/TootSDK).
