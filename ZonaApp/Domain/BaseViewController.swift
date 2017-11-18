import UIKit

class BaseViewController<P: Presenter>: UIViewController, View {
	
	var presenter: P!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		setupGUI()
	}
	
	func setupGUI() {}
}
