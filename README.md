# MyIOSNetworkPattern

A description of this package.


iOS Network Request 작성패턴 기술
Moya로 회사내에서 프로젝트하면서, Api인터페이스를 구상하다가 한계에 도달해서 대체안으로 작성한 인터페이스 패턴
Moya의 프로토콜 기반 구현과 rSwift 네임스페이스에 영감을 받았습니다.

Moya 패키지는 편리하지만, 회사내에서 앱 개발하는데에 사용하기에는 맞지 않는 점이 많았습니다.

- status code 기반의 validation만 사용하거나, plugin에 각 request 마다 다른 validation 처리를 전부 구현해야함

- 시스템에서 제공한 localized error를 가져오기 어려움

- Alamofire에서 제공하는 URLQueryParameterEncoder를 사용할 수 없음


Moya와 비교했을 때, 직접 개발한 패턴의 장/단점

- 단점: 
    Alamofire 인터페이스가 직접적으로 노출되어있음

- 장점: 
    Alamofire의 최신기능을 추가 오버헤드 없이 사용할 수 있음.(Concurrency, Combine)
    Encodable 프로토콜 자동합성을 사용해서 API 파라미터 구현 및 인코딩을 단순화할 수 있음
    파라미터 인코딩 분기처리를 간단한게 구현할 수 있음
    많은 쿼리 파라미터를 관리하기 용이함
    `MyMoyaTargetList.QueryEchoTarget` 구현을 보면 Query 파라미터가 다양해질수록 Moya로는 유지/보수가 어려워집니다.
    그에 반해서 `HTTPRequestList.QueryEchoRequest`는 Alamofire의 URLEncoder를 사용할 수 있어서 파라미터가 추가 및 Encoding이 간단합니다.

아래의 경우 중 하나를 만족할 경우, 이 repository의 패턴이 유용해 보입니다.

- API에 많은 쿼리 파라미터가 있을 경우
- Alamofire.Validation이 강하게 요구되는 경우
- Moya의 endpoint 인터페이스 대신 Alamofire의 Cocurrency feature를 사용하고 싶은 경우

