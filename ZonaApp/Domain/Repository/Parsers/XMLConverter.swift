import AEXML

class XMLConverter: DataConverter {
	typealias Conversion = AEXMLDocument
	
	func convert(data: Data) -> AEXMLDocument? {
		guard let xmlDoc = try? AEXMLDocument(xml: data, options: AEXMLOptions()) else {
			print("Error could not deserialize")
			return nil
		}
		print("\(xmlDoc.xml)")
		return xmlDoc
	}
}
