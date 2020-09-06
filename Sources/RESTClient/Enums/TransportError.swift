import Foundation

public enum TransportError: Error {
    case invalidRequest
    case invalidResponse
    case httpStatus(Int)
    case other(Error)

    static func map(_ error: Error) -> TransportError { error as? TransportError ?? .other(error) }
}

extension TransportError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("Invalid request", comment: "Failed to create URLRequest.")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "The server response was not expected.")
        case let .httpStatus(statusCode):
            return NSLocalizedString("HTTP", comment: "Unexpected HTTP Status Code \(statusCode)")
        case .other:
            return NSLocalizedString("Unknown error", comment: "")
        }
    }
}
