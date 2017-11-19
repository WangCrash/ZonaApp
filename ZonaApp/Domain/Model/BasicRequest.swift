class BaseParameters: Parametrizable {
	var affiliateId: String
	var language: String
	
	required init(affiliateId: String, language: String) {
		self.affiliateId = affiliateId
		self.language = language
	}
	
	func toParameters() -> [Parameter] {
		let affiliateId = Parameter(key: "affiliate_id", value: self.affiliateId)
		let language = Parameter(key: "api_lang", value: self.language)
		
		return [affiliateId, language]
	}
}
