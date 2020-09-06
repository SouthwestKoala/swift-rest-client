import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DeleteRequestTests.allTests),
        testCase(GetRequestTests.allTests),
        testCase(PatchRequestTests.allTests),
        testCase(PostRequestTests.allTests),
        testCase(PutRequestTests.allTests)
    ]
}
#endif
