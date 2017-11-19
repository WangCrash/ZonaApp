import Foundation

class XMLParser<Type>: Parser {
	typealias Result = Type
	func map(data: Data) -> Result? {
		fatalError("map method must be implemented")
	}
	
	lazy var converter: XMLConverter = {
		return XMLConverter()
	}()
}
