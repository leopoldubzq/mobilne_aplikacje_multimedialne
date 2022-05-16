import Foundation
import UIKit

class BaseViewController: UIViewController {

    override init(nibName _: String?, bundle _: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    deinit {
        print("\(self)".replacingOccurrences(of: "mobilne_aplikacje_multimedialne.", with: ""))
    }
}

