import XCTest
@testable import RESTClient

final class GetRequestTests : XCTestCase {
    struct GetRequest : TestRequest {
        typealias Response = String

        var httpMethod: HTTPMethod { .get }

        var resourcePath: String { "tests/get" }
    }

    func testGetRequestIsValid() {
        let request = GetRequest()

        XCTAssertEqual(request.httpMethod, HTTPMethod.get)
    }

    static var allTests = [
        ("testGetRequestIsValid", testGetRequestIsValid),
    ]
}
