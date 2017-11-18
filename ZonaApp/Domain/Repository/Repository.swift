protocol Repository {
	func save<T>(identifier: String, data: T) where T: Codable
	func load<T>(dataWith identifier: String) -> T? where T: Codable
}

class DefaultRepository: Repository {
	func save<T>(identifier: String, data: T) where T : Codable {
		
	}
	
	func load<T>(dataWith identifier: String) -> T? where T : Codable {
		return nil
	}
}
