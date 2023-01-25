//
//  HTTPRequestList.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire
/**
 서버 API 호출 선언용 네임스페이스
 
 
 작성 규칙
 
 1. 항상 접미사로 Request를 사용한다
 
 2. get, post, check 등 동작을 기술하지 않고 가져오는 리소스를 중심으로 이름을 작성한다.
 ex) getVersion (x) VersionRequest (O)
 
 3. save, delete등 리퀘스트가 리소스를 가져오기보단 서버에 작업을 요청하는 경우에는 해당 동사를 Request 키워드 바로 앞에 붙인다.
 ex) CatSaveRequest, DogCopyRequest, FishDeleteRequest 등
 
 4. 해당 네임스페이스에는 오직 Api 요청만 작성한다.
 */
enum HTTPRequestList {}
