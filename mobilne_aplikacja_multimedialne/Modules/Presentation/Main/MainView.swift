import UIKit
import RxSwift
import RxCocoa

protocol MainViewProtocol: UIView {}

class MainView: Main.View {
    
    let viewModel: Main.ViewModel
    
    let testButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Test", for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let videoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(VideoCell.self, forCellReuseIdentifier: VideoCell.toString())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    lazy var searchBar = createSearchBar()
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: Main.ViewModel) {
        self.viewModel = viewModel
        super.init()
        setupView()
        setupObservers()
    }
    
    // MARK: RX
    
    private func setupObservers() {
        bindTestButton()
        bindTableView()
    }
    
    private func bindTestButton() {
        testButton.rx.tap.bind { [weak self] in
            guard let self = self else { return }
            self.viewModel.onVideoDetailsTap?(self.viewModel.videos.value[6].title)
        }.disposed(by: viewModel.disposeBag)
    }
    
    private func bindTableView() {
        viewModel.videos
            .bind(to: videoTableView.rx.items(cellIdentifier: VideoCell.toString(), cellType: VideoCell.self)) { _, model, cell in
                cell.configure(videoTitle: model.title)
            }.disposed(by: viewModel.disposeBag)
        
        videoTableView
            .rx
            .modelSelected(VideoDto.self)
            .bind { [weak self] model in
                self?.viewModel.onVideoDetailsTap?(model.title)
            }.disposed(by: viewModel.disposeBag)
    }
    
    // MARK: LAYOUT
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(searchBar)
        addSubview(videoTableView)
    }
    private func addConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(50)
        }
        videoTableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: UI CREATION
    
    private func createSearchBar() -> UISearchBar {
        let view = UISearchBar()
        let whiteBackgroundImage = UIImage(color: .lightGray.withAlphaComponent(0.1),
                                           size: CGSize(width: 10, height: 12))?.withRoundCorners(18)
        view.setSearchFieldBackgroundImage(whiteBackgroundImage, for: UIControl.State.normal)
        view.searchBarStyle = .minimal
        view.searchTextField.layer.cornerRadius = 18
        view.searchTextField.layer.masksToBounds = true
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGreen,
            .font: UIFont.boldSystemFont(ofSize: 16),
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        view.showsCancelButton = false
        view.placeholder = "Search videos"
        view.returnKeyType = .search
        view.delegate = self
        return view
    }
}

extension MainView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            let filteredVideos: [VideoDto] = viewModel.allVideos
                .filter({ $0.title.contains(searchText.lowercased()) })
            viewModel.videos.accept(filteredVideos)
        } else {
            viewModel.setupVideos()
        }
    }
}


