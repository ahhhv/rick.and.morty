class APIClient: APIClientProtocol {
    func fetch<T: Codable>(url: String) async throws -> T {
        guard let requestURL = URL(string: url) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: requestURL)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
