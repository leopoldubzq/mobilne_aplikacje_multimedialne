import UIKit

protocol MainViewProtocol: UIView {}

class MainView: Main.View {
    
    let viewModel: Main.ViewModel
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: Main.ViewModel) {
        self.viewModel = viewModel
        super.init()
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {}
    private func addConstraints() {}
}


