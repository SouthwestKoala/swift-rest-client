import XCTest
@testable import RESTClient

final class PostRequestTests : XCTestCase {
    struct PostRequest : TestRequest {
        typealias Response = String

        var httpMethod: HTTPMethod { .post }

        var resourcePath: String { "tests/post" }
    }

    func testPostRequestIsValid() {
        let request = PostRequest()

        XCTAssertEqual(request.httpMethod, HTTPMethod.post)
    }

    static var allTests = [
        ("testPostRequestIsValid", testPostRequestIsValid),
    ]
}
