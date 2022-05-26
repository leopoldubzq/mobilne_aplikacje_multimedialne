import UIKit

class Coordinator: NSObject, CoordinatorProtocol {
    let navigationController: UINavigationController
    let dependencies: CoordinatorDependenciesProtocol
    
    override init() {
        dependencies = CoordinatorDependencies()
        navigationController = BaseNavigationController()
    }
    
    func showMainScreen(onVideoDetailsTap: VideoDetailsTapClosure) {
        navigationController.setViewControllers([mainVC(onVideoDetailsTap: onVideoDetailsTap)], animated: false)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss(completion: DismissCallback) {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    func onVideoDetailsTap(videoTitle: String) {
        navigationController.pushViewController(detailsVC(videoTitle: videoTitle), animated: true)
    }
}
