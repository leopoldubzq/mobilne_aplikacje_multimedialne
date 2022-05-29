import Foundation
import AVFoundation
import UIKit
import RxCocoa
import RxSwift

protocol MainViewModelProtocol {
    var videos: BehaviorRelay<[VideoDto]> { get }
    var allVideos: [VideoDto] { get }
    var onVideoDetailsTap: VideoDetailsTapClosure { get }
    func setupVideos()
}

class MainViewModel: Main.ViewModel {
    
    // MARK: - PUBLIC PROPERTIES
    
    let onVideoDetailsTap: VideoDetailsTapClosure
    let videos = BehaviorRelay<[VideoDto]>(value: [])
    var allVideos: [VideoDto] = []
    
    // MARK: - PRIVATE PROPERTIES
    
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol, onVideoDetailsTap: VideoDetailsTapClosure) {
        self.coordinator = coordinator
        self.onVideoDetailsTap = onVideoDetailsTap
        super.init()
        setupVideos()
    }
    
    func setupVideos() {
        for index in 1...14 {
            allVideos.append(VideoDto(title: "short_video_\(index)"))
        }
        videos.accept(allVideos)
    }
}
