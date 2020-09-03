import Foundation
import FoundationNetworking
import OpenCombine
import OpenCombineFoundation

extension URLSession : Transport {
    public func send<T>(_ request: T) -> AnyPublisher<Data, TransportError> where T : Request {
        guard let urlRequest = URLRequest(request: request) else {
            return Fail(error: TransportError.invalidRequest).eraseToAnyPublisher()
        }

        return dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw TransportError.invalidResponse
                }
                
                switch httpResponse.statusCode {
                case (200..<300):
                    break
                default:
                    throw TransportError.httpStatus(httpResponse.statusCode)
                }
                
                return data
            }
            .mapError { error in
                if let error = error as? TransportError {
                    return error
                } else {
                    return TransportError.other(error)
                }
            }
            .eraseToAnyPublisher()
    }

    public func send<T>(_ request: T) -> AnyPublisher<T.Response, TransportError> where T : Request {
        send(request)
            .decode(type: T.Response.self, decoder: JSONDecoder())
            .mapError { error in
                if let error = error as? TransportError {
                    return error
                } else {
                    return TransportError.other(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
