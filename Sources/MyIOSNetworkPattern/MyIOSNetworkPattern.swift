import Foundation
import Alamofire
import Moya

@main
public enum MyIOSNetworkPattern {
    
    nonisolated
    public static func main() async throws {
        do {
            let request1 = try HTTPRequestList.GoogleSearchDocumentRequest(q: "A").asURLRequest()
            let (_, googleResponse) = try await URLSession.shared.data(for: request1)
            print(request1, googleResponse)
            let request2 = try HTTPRequestList.JsonEchoRequest(userName: "ADD", isSomething: false).asURLRequest()
            let (jsonEchoData, _ ) = try await URLSession.shared.data(for: request2)
            print(String(decoding: jsonEchoData, as: UTF8.self), request2)
        } catch {
            
            print(error, error.localizedDescription)
        }
        
    }
    
}
