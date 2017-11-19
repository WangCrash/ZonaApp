import UIKit

class iOSDependencies: Dependencies {
	var window: UIWindow
	var appConfiguration: AppConfiguration
	
	init(appConfiguration: AppConfiguration, window: UIWindow) {
		self.appConfiguration = appConfiguration
		self.window = window
	}
	
	lazy var gpsManager: GPSManager = {
		return iOSGPSManager()
	}()
	
	lazy var repository: Repository = {
		return DefaultRepository(networkManager: networkManager)
	}()
	
	lazy var rootWireFrame: RootWireframe = {
		return iOSRootWireframe(window: window, dependencies: self)
	}()
	
	private lazy var networkManager: URLSessionManager = {
		return URLSessionManager(endPoint: appConfiguration.appEndPoint)
	}()
	
	private lazy var factory: Factory = {
		return Factory()
	}()
	
	func mainViewController() -> MainViewController {
		let mainViewController: MainViewController = factory.createViewController()
		return mainViewController
	}
}
