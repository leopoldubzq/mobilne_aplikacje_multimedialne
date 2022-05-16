import Foundation
import AVFoundation

protocol MainViewModelProtocol {
    var videos: [String] { get }
    func createVideoPlayer(name: String, type: VideoType) -> AVPlayer?
    func createAVLayer() -> AVPlayerLayer?
    func playVideo()
}

class MainViewModel: Main.ViewModel {
    
    private let coordinator: CoordinatorProtocol
    private let videoManager: Helpers.Video
    
    var videos: [String] = []
    
    init(coordinator: CoordinatorProtocol, videoManager: Helpers.Video) {
        self.coordinator = coordinator
        self.videoManager = videoManager
        super.init()
        setupVideos()
    }
    
    func createVideoPlayer(name: String, type: VideoType) -> AVPlayer? {
        videoManager.createVideoPlayer(name: name, type: type)
    }
    
    func createAVLayer() -> AVPlayerLayer? {
        videoManager.createAVLayer()
    }
    
    func playVideo() {
        videoManager.playVideo()
    }
    
    private func setupVideos() {
        for index in 1...9 {
            videos.append("short_video_\(index)")
        }
    }
    
}
