class ContinentsParameters: ContinentParameters {
	override var continentId: String! {
		get {
			return "1"
		}
		set {}
	}
	
	required init(affiliateId: String, language: String) {
		super.init(affiliateId: affiliateId, language: language)
	}
}

class ContinentParameters: BaseParameters {
	var continentId: String!
	
	required init(affiliateId: String, language: String) {
		super.init(affiliateId: affiliateId, language: language)
	}
	
	override func toParameters() -> [Parameter] {
		return super.toParameters() + [Parameter(key: "continente", value: continentId)]
	}
}
