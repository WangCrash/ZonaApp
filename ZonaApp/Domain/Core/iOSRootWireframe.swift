import UIKit

class iOSRootWireframe: RootWireframe {
	private let window: UIWindow
	private let dependencies: iOSDependencies
	
	init(window: UIWindow, dependencies: iOSDependencies) {
		self.window = window
		self.dependencies = dependencies
	}
	
	func presentMainView() {
		let rootController = UINavigationController()
		let mainViewController = dependencies.mainViewController()
		rootController.viewControllers = [mainViewController]
		
		window.rootViewController = rootController
		window.makeKeyAndVisible()
	}
	
	func showGlobalNetworkActiviy(show: Bool) {
		
	}
}
