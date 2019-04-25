//
//  ServerAPI.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 4/4/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import Moya
import ObjectMapper
import SwiftyJSON
import RxSwift

enum ServerError: LocalizedError {
  case wrongStatusCode(String)
  case notSuccess
  case cannotParseResponse
  case tokenInvalid
  case custom(String)
  
  var errorDescription: String? {
    switch self {
    case .wrongStatusCode(let descriptonText):
      return descriptonText
    case .notSuccess:
      return "notSuccess"
    case .cannotParseResponse:
      return "cannotParseResponse"
    case .tokenInvalid:
      return "Invalid Token"
    case .custom(let descriptonText):
      return descriptonText
    }
  }
}

enum ServerResult<T> {
  case success(T)
  case error(ServerError)
  case fail(MoyaError)
}

extension ServerResult: Equatable {}

func ==<T>(lhs: ServerResult<T>, rhs: ServerResult<T>) -> Bool {
  switch (lhs, rhs) {
  case (.success(_), .success(_)):
    return true
  case (.fail(_), .fail(_)):
    return true
  case (.error(_), .error(_)):
    return true
    
  case (.success(_), .fail(_)):
    return false
  case (.success(_), .error(_)):
    return false
    
    
  case (.fail(_), .success(_)):
    return false
  case (.fail(_), .error(_)):
    return false
    
  case (.error(_), .success(_)):
    return false
  case (.error(_), .fail(_)):
    return false

  }
}

protocol ServerAPIType {
  func rx_searchRepo(keyword: String) -> Observable<[SearchModel]>
}

public class ServerAPI: ServerAPIType {
  
  private var provider = MoyaProvider<Server>()
  
  func rx_searchRepo(keyword: String) -> Observable<[SearchModel]> {
    return handleResponseMapArray(with: .searchRepo(keyword: keyword),
                                  of: SearchModel.self,
                                  dataPath: ["items"])
  }
  
  // MARK: Private
  
  private func handleResponse(with targetType: Server) -> Observable<JSON> {
    return provider
      .rx
      .request(targetType).debug()
      .asObservable()
      .do(onNext:{ (data) in print("handleResponse---->",(try? data.mapJSON()) ?? "-" ) } )
      .filterSuccessfulStatusCodes()
      .map { JSON($0.data) }
      .catchError { throw ServerAPI.Error(error: $0) }
  }
  
  private func handleResponseValue<T>(with targetType: Server, of type: T.Type, dataPath: [String] = ["data"]) -> Observable<T> where T: Any {
    return handleResponse(with: targetType)
      .mapApiValue(of: T.self, dataPath: dataPath)
      .catchError { throw ServerAPI.Error(error: $0) }
  }
  
  private func handleResponseMap<T>(with targetType: Server, of type: T.Type, dataPath: [String] = ["data"]) -> Observable<T> where T: Mappable {
    return handleResponse(with: targetType)
      .mapApiModel(of: T.self, dataPath: dataPath)
      .catchError { throw ServerAPI.Error(error: $0) }
  }
  
  private func handleResponseMapArray<T>(with targetType: Server, of type: T.Type, dataPath: [String] = ["data"]) -> Observable<[T]> where T: Mappable {
    return handleResponse(with: targetType)
      .mapApiModelArray(of: T.self, dataPath: dataPath)
      .catchError { throw ServerAPI.Error(error: $0) }
  }
  
}
