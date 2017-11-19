import Foundation

protocol EndPoint {
	var baseUrl: URL {get}
}

struct ApiNode {
	var path: String
}

protocol NetworkManager {
	typealias Response = (_ data: Codable?, _ error: NetworkError?) -> Void
	var endPoint: EndPoint {get}

	func getData(apiNode: ApiNode, param: RequestParameters, parser: Parser, completion: Response?)
}

protocol Parametrizable {
	func toParameters() -> [Parameter]
}

struct RequestParameters {
	private var data: Parametrizable
	
	func queryString() -> String {
		let parameters = data.toParameters()
		if parameters.isEmpty {
			return ""
		}
		return parameters.reduce("?", { (result, parameter) -> String in
			return result + parameter.key + "=" + parameter.value + "&"
		})
	}
}

struct Parameter {
	var key: String
	var value: String
}

protocol Parser {
	func map(data: Data) -> Codable?
}

enum NetworkError: Error {
	case noError
	case invalidRequest
	case badURL
	case connectionError(error: Error)
}
