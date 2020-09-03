import Foundation

public enum TransportError : Error {
    case invalidRequest
    case invalidResponse
    case httpStatus(Int)
    case other(Error)
    
    static func map(_ error: Error) -> TransportError {
        return (error as? TransportError) ?? .other(error)
    }
}

extension TransportError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("Invalid request", comment: "Failed to create URLRequest.")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "The server response was not expected.")
        case .httpStatus(let statusCode):
            return NSLocalizedString("HTTP", comment: "Unexpected HTTP Status Code \(statusCode)")
        case .other(_):
            return NSLocalizedString("Unknown error", comment: "")
        }
    }
}
