import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension URLRequest {
    init?<T>(request: T) where T : Request {
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.resourcePath))

        urlRequest.httpMethod = request.httpMethod.rawValue
        
        self = urlRequest
    }
}
