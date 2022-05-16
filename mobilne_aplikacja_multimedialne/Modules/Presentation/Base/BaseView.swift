import UIKit

class BaseView: UIView {

    var activityIndicator: UIActivityIndicatorView?

    init() {
        super.init(frame: .zero)
    }

    deinit {
        print("\(self)".replacingOccurrences(of: "mobilne_aplikacje_multimedialne.", with: ""))
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


