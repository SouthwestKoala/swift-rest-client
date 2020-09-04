import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

#if canImport(Combine)
import Combine
#else
import OpenCombine
import OpenCombineFoundation
#endif

extension URLSession : Transport {
    public func send<T>(_ request: T) -> AnyPublisher<Data, TransportError> where T : Request {
        guard let urlRequest = URLRequest(request: request) else {
            return Fail(error: TransportError.invalidRequest).eraseToAnyPublisher()
        }

        return dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> (Data, HTTPStatus) in 
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw TransportError.invalidResponse
                }

                guard let statusCode = HTTPStatus(rawValue: httpResponse.statusCode) else {
                    throw TransportError.httpStatus(httpResponse.statusCode)
                }

                return (data, statusCode)
            }
            .tryMap { data, statusCode -> Data in
                switch statusCode {
                    case .ok, .created, .accepted, .noContent:
                        break
                    default:
                        throw TransportError.httpStatus(statusCode.rawValue)
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
