import Foundation
import SwiftUI
import TootSDK

/// rename to DraftImageAttachment
///  define DraftVideoAttachment
///   define DraftAudioAttachment
@Observable
public class DraftAttachment: Identifiable, Equatable {

  public var id: UIImage {
    image  // .image
  }

  public static func == (lhs: DraftAttachment, rhs: DraftAttachment) -> Bool {
    lhs.id == rhs.id && lhs.text == rhs.text
  }

  public var image: UIImage
  public var compress = 0.0

  public let type: MIMEType = .jpeg

  public var data: Data? {
    switch type {
    default:
      image.jpeg(compress)
    }
  }

  public var text: String = ""

  public init(
    _ image: UIImage,
    compress: Double,
    text: String = ""
  ) {
    self.image = image
    self.text = text
    self.compress = compress
  }
}
