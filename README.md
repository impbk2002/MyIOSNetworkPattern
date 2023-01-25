# MyIOSNetworkPattern

A description of this package.


iOS Network Request 작성패턴 기술

Moya의 프로토콜 기반 구현과 rSwift 네임스페이스에 영감을 받았습니다.

Moya 패키지는 편리하지만, 회사내에서 앱 개발하는데에 사용하기에는 맞지 않은 점이 많았습니다.

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
