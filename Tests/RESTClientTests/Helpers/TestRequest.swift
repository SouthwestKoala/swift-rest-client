import Foundation
import RESTClient

protocol TestRequest : Request {}

extension TestRequest {
    var baseURL: URL { URL(string: "https://localhost/")! }        
}
