import UIKit

class MainViewController: UIViewController {

    let viewModel: Main.ViewModel
    let rootView: Main.View

    init(rootView: Main.View, viewModel: Main.ViewModel) {
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


