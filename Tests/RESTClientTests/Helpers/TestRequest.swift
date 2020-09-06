import Foundation
import RESTClient

protocol TestRequest : Request {}

extension TestRequest {
    var baseURL: URL { 
        guard let url = URL(string: "https://localhost" ) else {
            preconditionFailure("Invalid URL")
        }

        return url
    }       
}
