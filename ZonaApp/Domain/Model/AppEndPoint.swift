import Foundation

enum AppEndPoint: EndPoint {
	case production
	
	var baseUrl: URL {
		return URL(string: "http://api.tiempo.com/index.php")!
	}
}
