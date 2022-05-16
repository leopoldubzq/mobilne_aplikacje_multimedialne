import UIKit

extension Coordinator {
    func mainVC() -> MainViewController {
        let viewModel = MainViewModel(coordinator: self)
        let view = MainView(viewModel: viewModel)
        return MainViewController(rootView: view, viewModel: viewModel)
    }
}
