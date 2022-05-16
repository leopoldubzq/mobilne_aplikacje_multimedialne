import UIKit

class Coordinator: NSObject, CoordinatorProtocol {
    
    let navigationController: UINavigationController
    let dependencies: CoordinatorDependenciesProtocol
    
    override init() {
        dependencies = CoordinatorDependencies()
        navigationController = BaseNavigationController()
    }
    
    func showMainScreen() {
        navigationController.setViewControllers([mainVC()], animated: false)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss(completion: DismissCallback) {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
