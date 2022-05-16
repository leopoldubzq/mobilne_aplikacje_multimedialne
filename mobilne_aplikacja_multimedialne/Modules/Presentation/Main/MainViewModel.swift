import Foundation

protocol MainViewModelProtocol {}

class MainViewModel: Main.ViewModel {
    
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
}
