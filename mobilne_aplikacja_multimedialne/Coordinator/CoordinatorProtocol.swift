import UIKit

typealias DismissCallback = (() -> Void)?

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    func showMainScreen(onVideoDetailsTap: VideoDetailsTapClosure)
    func pop()
    func dismiss(completion: DismissCallback)
    func onVideoDetailsTap(videoTitle: String)
}
