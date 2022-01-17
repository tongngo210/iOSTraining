import Foundation

enum APIURLs {
    static let baseURL = "https://api.opendota.com"
    
    private var domain: String {
        return APIURLs.baseURL
    }
    
    private var apiVersion: String {
        return "/api"
    }
    
    private var endPoint: String {
        return domain + apiVersion
    }
    
    case home
    
    var url: String {
        switch self {
        case .home:
            return endPoint + "/heroStats"
        }
    }
}
