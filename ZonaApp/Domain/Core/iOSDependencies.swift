import UIKit

class iOSDependencies: Dependencies {
	var window: UIWindow
	var appConfiguration: AppConfiguration
	
	init(appConfiguration: AppConfiguration, window: UIWindow) {
		self.appConfiguration = appConfiguration
		self.window = window
	}
	
	lazy var repository: Repository = {
		return DefaultRepository()
	}()
	
	lazy var rootWireFrame: RootWireframe = {
		return iOSRootWireframe(window: window, dependencies: self)
	}()
	
	private lazy var factory: Factory = {
		return Factory()
	}()
	
	func mainViewController() -> MainViewController {
		let mainViewController: MainViewController = factory.createViewController()
		return mainViewController
	}
}
