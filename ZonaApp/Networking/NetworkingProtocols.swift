import Foundation

protocol EndPoint {
	var baseUrl: URL {get}
	var apiSecret: String {get}
}

struct ApiNode {
	var path: String
}

protocol NetworkManager {
	typealias Response = (_ data: Data?, _ error: NetworkError?) -> Void
	var endPoint: EndPoint {get}

	func getData(param: RequestParameters, completion: Response?)
}

protocol Parametrizable {
	func toParameters() -> [Parameter]
}

struct RequestParameters {
	private var data: Parametrizable
	
	init(data: Parametrizable) {
		self.data = data
	}
	
	func queryString() -> String {
		let parameters = data.toParameters()
		if parameters.isEmpty {
			return ""
		}
		return parameters.reduce("", { (result, parameter) -> String in
			return result + parameter.key + "=" + parameter.value + "&"
		})
	}
}

struct Parameter {
	var key: String
	var value: String
}

enum NetworkError: Error {
	case noError
	case invalidRequest
	case badURL
	case connectionError(error: Error)
}
