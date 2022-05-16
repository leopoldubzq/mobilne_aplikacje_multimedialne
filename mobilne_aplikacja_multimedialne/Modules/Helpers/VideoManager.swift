import Foundation
import AVKit
import AVFoundation

enum VideoType: String {
    case mp4
}

protocol VideoManagerProtocol {
    func createVideoPlayer(name: String, type: VideoType) -> AVPlayer?
    func createAVLayer() -> AVPlayerLayer?
    func playVideo()
}

class VideoManager: Helpers.Video {
    
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    init() {}
    
    func createVideoPlayer(name: String, type: VideoType) -> AVPlayer? {
        if let path = Bundle.main.path(forResource: name, ofType: type.rawValue) {
            player = AVPlayer(url: URL(fileURLWithPath: path))
        } else {
            print("There is no such a video called \(name)")
            return nil
        }
        return player
    }
    
    func createAVLayer() -> AVPlayerLayer? {
        guard let player = player else { return nil }
        playerLayer = AVPlayerLayer(player: player)
        return playerLayer
    }
    
    func playVideo() {
        player?.play()
    }
}
