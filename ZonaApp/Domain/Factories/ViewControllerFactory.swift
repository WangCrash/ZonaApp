import UIKit

class Factory {
	func createViewController<P, VC>() -> VC where VC: BaseViewController<P> {
		let viewController: VC = UIViewController.initFromStoryboard(storyboard: VC.storyboardName, identifier: VC.storyboardIdentifier)
		return viewController
	}
}

extension UIViewController {
	class func initFromStoryboard<T>(storyboard: String, identifier: String) -> T where T: UIViewController {
		let storyboard = UIStoryboard(name: storyboard, bundle: nil)
		guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
			fatalError("View Controller Type not valid")
		}
		return viewController
	}
}
