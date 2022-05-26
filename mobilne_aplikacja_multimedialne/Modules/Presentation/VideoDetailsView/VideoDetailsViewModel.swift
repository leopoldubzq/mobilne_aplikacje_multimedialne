import Foundation
import RxSwift
import RxCocoa
import AVFoundation

protocol VideoDetailsViewModelProtocol {
    func createVideoPlayer(name: String, type: VideoType) -> AVPlayer?
    func createAVLayer() -> AVPlayerLayer?
    func playVideo()
    func showVideoTitle() -> String
    func popVC()
}

class VideoDetailsViewModel: VideoDetails.ViewModel {
    
    private let coordinator: CoordinatorProtocol
    private let videoManager: Helpers.Video
    private let videoTitle: String
    
    init(coordinator: CoordinatorProtocol, videoManager: Helpers.Video, videoTitle: String) {
        self.coordinator = coordinator
        self.videoManager = videoManager
        self.videoTitle = videoTitle
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
    
    func showVideoTitle() -> String {
        return videoTitle
    }
    
    func popVC() {
        coordinator.pop()
    }
}
