import UIKit

class VideoDetailsViewController: UIViewController {

    let viewModel: VideoDetails.ViewModel
    let rootView: VideoDetails.View

    init(rootView: VideoDetails.View, viewModel: VideoDetails.ViewModel) {
        self.rootView = rootView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        createView()
    }

    private func createView() {
        view.addSubview(rootView)
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}



