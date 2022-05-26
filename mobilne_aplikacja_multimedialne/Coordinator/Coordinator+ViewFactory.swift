import UIKit

extension Coordinator {
    func mainVC(onVideoDetailsTap: VideoDetailsTapClosure) -> UIViewController {
        let viewModel = MainViewModel(coordinator: self,
                                      onVideoDetailsTap: onVideoDetailsTap)
        let view = MainView(viewModel: viewModel)
        return MainViewController(rootView: view, viewModel: viewModel)
    }
    func detailsVC(videoTitle: String) -> UIViewController {
        let viewModel = VideoDetailsViewModel(coordinator: self,
                                              videoManager: dependencies.videoManager,
                                              videoTitle: videoTitle)
        let view = VideoDetailsView(viewModel: viewModel)
        return VideoDetailsViewController(rootView: view, viewModel: viewModel)
    }
}
