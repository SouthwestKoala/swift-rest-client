import Foundation
import OpenCombine

public protocol Transport {
    func send<T>(_ request: T) -> AnyPublisher<T.Response, TransportError> where T : Request
}
