import XCTest
@testable import RESTClient

final class DeleteRequestTests : XCTestCase {
    struct DeleteRequest : TestRequest {
        typealias Response = String

        var httpMethod: HTTPMethod { .delete }

        var resourcePath: String { "tests/delete" }
    }

    func testDeleteRequestIsValid() {
        let request = DeleteRequest()

        XCTAssertEqual(request.httpMethod, HTTPMethod.delete)
    }

    static var allTests = [
        ("testDeleteRequestIsValid", testDeleteRequestIsValid),
    ]
}
