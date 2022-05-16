import UIKit

extension Coordinator {
    func mainVC() -> MainViewController {
        let viewModel = MainViewModel(coordinator: self, videoManager: dependencies.videoManager)
        let view = MainView(viewModel: viewModel)
        return MainViewController(rootView: view, viewModel: viewModel)
    }
}
