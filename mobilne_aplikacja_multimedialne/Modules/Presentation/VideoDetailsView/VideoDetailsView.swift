import UIKit
import RxSwift
import RxCocoa
import AVFoundation

protocol VideoDetailsViewProtocol: UIView {}

class VideoDetailsView: VideoDetails.View {
    
    // MARK: PUBLIC PROPERTIES
    
    let viewModel: VideoDetails.ViewModel
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.backward")?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.white)
        button.setImage(image,for: .normal)
        return button
    }()
    
    // MARK: INITIALIZERS
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: VideoDetails.ViewModel) {
        self.viewModel = viewModel
        super.init()
        setupUI()
        setupObservers()
    }
    
    // MARK: OVERRIDDEN FUNCTIONS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        showVideoLayer()
    }
    
    // MARK: RX
    
    private func setupObservers() {
        bindBackButton()
    }
    
    private func bindBackButton() {
        backButton.rx.tap.bind { [weak self] in
            self?.viewModel.popVC()
        }.disposed(by: viewModel.disposeBag)
    }
    
    // MARK: LAYOUT
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(backButton)
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.size.equalTo(50)
        }
    }
    
    // MARK: VIDEO
    
    private func initializePlayer() {
        player = viewModel.createVideoPlayer(name: viewModel.showVideoTitle(),
                                             type: .mp4)
    }
    
    private func showVideoLayer() {
        initializePlayer()
        addVideoLayer()
        setVideoPlayerFrame()
        playVideo()
    }
    
    private func addVideoLayer() {
        playerLayer = viewModel.createAVLayer()
        if let playerLayer = playerLayer {
            layer.addSublayer(playerLayer)
        }
    }
    
    private func setVideoPlayerFrame() {
        playerLayer?.backgroundColor = UIColor.systemBackground.cgColor
        guard let window = window else { return }
        let topOffset = window.safeAreaInsets.top + backButton.frame.size.height + 20
        playerLayer?.frame = CGRect(x: 0, y: window.safeAreaInsets.top +
                                    backButton.frame.size.height + 20,
                                    width: UIScreen.main.bounds.width,
                                    height: frame.size.height - (topOffset * 2))
    }
    
    private func playVideo() {
        viewModel.playVideo()
    }
}
