import UIKit

class CoordinatorDependencies: NSObject, CoordinatorDependenciesProtocol {
    var videoManager: Helpers.Video
    
    override init() {
        videoManager = VideoManager()
    }
}
