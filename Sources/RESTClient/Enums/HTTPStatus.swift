import Foundation

public enum HTTPStatus: Int {
    case ok = 200 // swiftlint:disable:this identifier_name
    case created = 201
    case accepted = 202
    case noContent = 204

    case badRequest = 400
    case notFound = 404
}
