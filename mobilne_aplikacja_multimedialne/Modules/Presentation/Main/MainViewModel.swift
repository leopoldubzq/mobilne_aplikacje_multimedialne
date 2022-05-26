import Foundation
import AVFoundation
import UIKit
import RxCocoa
import RxSwift

protocol MainViewModelProtocol {
    var videos: BehaviorRelay<[VideoDto]> { get }
    var onVideoDetailsTap: VideoDetailsTapClosure { get }
    func setupVideos()
}

class MainViewModel: Main.ViewModel {
    
    // MARK: - PUBLIC PROPERTIES
    
    let onVideoDetailsTap: VideoDetailsTapClosure
    let videos = BehaviorRelay<[VideoDto]>(value: [])
    
    // MARK: - PRIVATE PROPERTIES
    
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol, onVideoDetailsTap: VideoDetailsTapClosure) {
        self.coordinator = coordinator
        self.onVideoDetailsTap = onVideoDetailsTap
        super.init()
        setupVideos()
    }
    
    func setupVideos() {
        var videos: [VideoDto] = []
        for index in 1...7 {
            videos.append(VideoDto(title: "short_video_\(index)"))
        }
        self.videos.accept(videos)
    }
}
