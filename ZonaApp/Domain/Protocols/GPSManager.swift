struct DeviceLocation {
	var longitude: Float
	var latitude: Float
}

typealias GPSAuthCompletion = (_ status: AuthorizationStatus) -> Void
typealias GPSCompletion = (_ location: DeviceLocation) -> Void

protocol GPSManager {
	func requestAuthorization(completion: GPSAuthCompletion?)
	func getDeviceLocation(completion: GPSCompletion?)
}

enum AuthorizationStatus {
	case notRequested
	case accepted
	case denied
}
