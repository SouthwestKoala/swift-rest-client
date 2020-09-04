import XCTest
@testable import RESTClient

final class PutRequestTests : XCTestCase {
    struct PutRequest : TestRequest {
        typealias Response = String

        var httpMethod: HTTPMethod { .put }

        var resourcePath: String { "tests/put" }
    }

    func testPutRequestIsValid() {
        let request = PutRequest()

        XCTAssertEqual(request.httpMethod, HTTPMethod.put)
    }

    static var allTests = [
        ("testPutRequestIsValid", testPutRequestIsValid),
    ]
}
