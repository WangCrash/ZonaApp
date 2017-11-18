import UIKit

class BaseViewController<P: Presenter>: UIViewController, View {
	class var storyboardName: String {
		fatalError("No storyboard name set")
	}
	class var storyboardIdentifier: String {
		fatalError("No identifier name set")
	}
	
	var presenter: P!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupGUI()
	}
	
	func setupGUI() {}
}
