import Foundation

class URLSessionManager: NetworkManager {
	var endPoint: EndPoint
	
	private lazy var urlSession: URLSession = {
		return URLSession.shared
	}()
	
	init(endPoint: EndPoint) {
		self.endPoint = endPoint
	}
	
	func getData(param: RequestParameters, completion: NetworkManager.Response?) {
		let url = URL(string: endPoint.baseUrl.absoluteString + "?" + param.queryString())
		guard url != nil else {
			completion?(nil, NetworkError.badURL)
			return
		}
		
		var request = URLRequest(url: url!)
		request.httpMethod = "GET"
		
		let task = urlSession.dataTask(with: request) { (data, response, error) in
			if let data = data {
				completion?(data, nil)
			} else if let error = error {
				completion?(nil, NetworkError.connectionError(error: error))
			}
		}
		task.resume()
	}
}
