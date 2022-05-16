import Foundation
import IQKeyboardManagerSwift

extension IQKeyboardManager {
    static func configure() {
        shared.enable = true
        shared.shouldResignOnTouchOutside = true
        shared.layoutIfNeededOnUpdate = true
        shared.enableAutoToolbar = false
        shared.previousNextDisplayMode = .alwaysHide
        shared.keyboardDistanceFromTextField = 22.0
    }
}
