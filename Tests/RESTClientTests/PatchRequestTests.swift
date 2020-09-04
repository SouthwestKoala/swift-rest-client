import XCTest
@testable import RESTClient

final class PatchRequestTests : XCTestCase {
    struct PatchRequest : TestRequest {
        typealias Response = String

        var httpMethod: HTTPMethod { .patch }

        var resourcePath: String { "tests/patch" }
    }

    func testPatchRequestIsValid() {
        let request = PatchRequest()

        XCTAssertEqual(request.httpMethod, HTTPMethod.patch)
    }

    static var allTests = [
        ("testPatchRequestIsValid", testPatchRequestIsValid),
    ]
}
