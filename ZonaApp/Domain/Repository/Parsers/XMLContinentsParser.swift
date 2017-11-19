import Foundation
import AEXML

class XMLContinentsParser: XMLParser<[Continent]> {
	override func map(data: Data) -> [Continent]? {
		guard let xmlDocument = converter.convert(data: data) else {
			return nil
		}
		let elements = xmlDocument.root["location"]["data"].all!
		
		var continents = [Continent]()
		elements.forEach { (element) in
			if let _ = element["name"].error {
				return
			}
			let name = element["name"]
			continents += [Continent(identifier: name.attributes["id"]!, name: name.value!)]
		}
		return continents
	}
}
