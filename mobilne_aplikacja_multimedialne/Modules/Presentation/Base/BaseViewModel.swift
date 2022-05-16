import UIKit
import RxSwift
import RxCocoa

protocol BaseViewModelProtocol {
    var disposeBag: DisposeBag { get }
    var isPerformingNetworkingOperation: BehaviorRelay<Bool> { get }
}

class BaseViewModel: NSObject, BaseViewModelProtocol {
    var isPerformingNetworkingOperation = BehaviorRelay<Bool>(value: false)
    var disposeBag = DisposeBag()

    deinit {
        print("\(self)".replacingOccurrences(of: "mobilne_aplikacje_multimedialne.", with: ""))
    }
}

