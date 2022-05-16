import UIKit

typealias DismissCallback = (() -> Void)?

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    func showMainScreen()
    func pop()
    func dismiss(completion: DismissCallback)
}
