import Foundation

class URLSessionManager: NetworkManager {
	var endPoint: EndPoint
	
	private lazy var urlSession: URLSession = {
		return URLSession.shared
	}()
	
	init(endPoint: EndPoint) {
		self.endPoint = endPoint
	}
	
	func getData(apiNode: ApiNode, param: RequestParameters, parser: Parser, completion: NetworkManager.Response?) {
		var url = URL(string: endPoint.baseUrl.absoluteString + apiNode.path)
		guard url != nil else {
			completion?(nil, NetworkError.badURL)
			return
		}
		
		url!.appendPathComponent(param.queryString())
		var request = URLRequest(url: url!)
		request.httpMethod = "GET"
		
		let task = urlSession.dataTask(with: request) { (data, response, error) in
			if let data = data {
				let result = parser.map(data: data)
				completion?(result, nil)
			} else if let error = error {
				completion?(nil, NetworkError.connectionError(error: error))
			}
		}
		task.resume()
	}
}
