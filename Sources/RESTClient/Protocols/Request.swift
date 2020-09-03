import Foundation

public protocol Request {
    associatedtype Response: Decodable

    var baseURL: URL { get }
    var httpMethod: HTTPMethod { get }
    var resourcePath: String { get }
}

public extension Request {
    var httpMethod: HTTPMethod { .get }
}
