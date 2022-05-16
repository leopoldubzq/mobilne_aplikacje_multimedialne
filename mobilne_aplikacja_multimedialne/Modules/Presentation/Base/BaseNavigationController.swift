import UIKit

class BaseNavigationController: UINavigationController {
    
    deinit {
        print("\(self)".replacingOccurrences(of: "mobilne_aplikacje_multimedialne.", with: ""))
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        viewControllers.last?.preferredStatusBarStyle ?? .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
    }
}

