open class Sharkey: MastoAPI {

  open override var name: String { "Sharkey" }

  open override var supportsMutePost: Bool { false }
  open override var supportsIsBoosted: Bool { false }
  open override var supportsFaveTimeline: Bool { false }
  open override var supportsNotificationDelete: Bool { false }
  open override var supportsNotificationDeleteAll: Bool { false }
  open override var supportsNotificationTypes: Bool { false }
  open override var supportsTagStats: Bool { false }
}