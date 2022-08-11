import Foundation
import XCTestDynamicOverlay

extension DependencyValues {
  public var calendar: Calendar {
    get { self[CalendarKey.self] }
    set { self[CalendarKey.self] = newValue }
  }

  private enum CalendarKey: LiveDependencyKey {
    static let liveValue = Calendar.autoupdatingCurrent
    static var testValue: Calendar {
      XCTFail(#"Unimplemented: @Dependency(\.calendar)"#)
      return .autoupdatingCurrent
    }
  }
}