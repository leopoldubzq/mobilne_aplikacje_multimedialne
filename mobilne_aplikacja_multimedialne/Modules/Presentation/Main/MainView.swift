import UIKit
import AVFoundation

protocol MainViewProtocol: UIView {}

class MainView: Main.View {
    
    let viewModel: Main.ViewModel
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        showVideoLayer()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: INITIALIZATION

    init(viewModel: Main.ViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    private func initializePlayer() {
        player = viewModel.createVideoPlayer(name: "short_video_1", type: .mp4)
    }
    
    private func initializeLayer() {
        
    }
    
    // MARK: LAYOUT
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {}
    private func addConstraints() {}
    
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
        playerLayer?.frame = bounds
    }
    
    private func playVideo() {
        viewModel.playVideo()
    }
}


