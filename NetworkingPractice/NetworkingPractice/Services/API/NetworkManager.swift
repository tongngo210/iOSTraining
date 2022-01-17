import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private func request<T: Decodable>(from apiURL: APIURLs,
                                       completion: @escaping (Result<[T], NetworkError>) -> Void) {
        guard let url = URL(string: apiURL.url) else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let _ = error {
                    completion(.failure(.unableToRequest))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let safeData = data else {
                    completion(.failure(.unsafeData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([T].self, from: safeData)
                    completion(.success(result))
                } catch {
                    completion(.failure(.invalidData))
                }
            }.resume()
        }
    }
    
    func allHeroesRequest(completion: @escaping (Result<[Hero], NetworkError>) -> Void) {
        request(from: .home, completion: completion)
    }
}
