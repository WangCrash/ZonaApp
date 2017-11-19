protocol Repository {
	var networkManager: NetworkManager {get}
	
}

class DefaultRepository: Repository {
	var networkManager: NetworkManager
	
	private lazy var continentsRequest: (RequestParameters, XMLContinentsParser) = {
		let parameters = create() as ContinentsParameters
		return (RequestParameters(data: parameters), XMLContinentsParser())
	}()
	
	init(networkManager: NetworkManager) {
		self.networkManager = networkManager
	}
	
	func getContinents(completion: (([Continent]?, Error?) -> Void)?) {
		let (parameters, parser) = continentsRequest
		networkData(params: parameters, parser: parser) { (data: [Continent]?, error) in
			if let continents = data {
				completion?(continents, nil)
			} else if let error = error {
				completion?(nil, error)
			}
		}
	}
	
	private func create<T: BaseParameters>() -> T {
		return T(affiliateId: networkManager.endPoint.apiSecret, language: "es")
	}
	
	private func networkData<Result, P: Parser>(params: RequestParameters, parser: P, completion: ((Result?, Error?) -> Void)?) where Result == P.Result {
		networkManager.getData(param: params) { (data, error) in
			if let data = data {
				completion?(parser.map(data: data), nil)
			} else if let error = error {
				completion?(nil, error)
			}
		}
	}
}
