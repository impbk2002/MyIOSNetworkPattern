import Foundation
import Alamofire
import Moya

@main
public enum MyIOSNetworkPattern {
    
    nonisolated
    public static func main() async throws {
        do {
            try await runNormal()
        } catch {
            print(error, error.localizedDescription)
        }
        
    }
    
}


func runMoya() async throws {
    let provider = MoyaProvider<MultiTarget>(session: .default, plugins: [NetworkLoggerPlugin()])
    let queryResponse = try await provider.perfomMultiTarget(MyMoyaTargetList.QueryEchoTarget(userName: "A", isSomething: false)).get()
    let dataString = String(decoding: queryResponse.data, as: UTF8.self)
    print(queryResponse, dataString)
}

func runNormal() async throws {
    let request1 = try HTTPRequestList.GoogleSearchDocumentRequest(q: "A").asURLRequest()
    let (_, googleResponse) = try await URLSession.shared.data(for: request1)
    print(request1, googleResponse)
    let request2 = try HTTPRequestList.QueryEchoRequest(userName: "ADD", isSomething: false).asURLRequest()
    let (jsonEchoData, _ ) = try await URLSession.shared.data(for: request2)
    print(String(decoding: jsonEchoData, as: UTF8.self), request2)
}
