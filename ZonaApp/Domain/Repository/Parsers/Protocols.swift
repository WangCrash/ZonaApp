import Foundation

protocol Parser {
	associatedtype Result
	func map(data: Data) -> Result?
}

protocol DataConverter {
	associatedtype Conversion
	func convert(data: Data) -> Conversion?
}
