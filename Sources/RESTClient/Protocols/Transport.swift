import Foundation

#if canImport(Combine)
    import Combine
#else
    import OpenCombine
    import OpenCombineFoundation
#endif

public protocol Transport {
    func send<T>(_ request: T) -> AnyPublisher<T.Response, TransportError> where T: Request
}
