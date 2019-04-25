//
//  ObservableType+.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 25/4/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import SwiftyJSON
import ObjectMapper

public extension ObservableType where E == Moya.Response {
  
  /// Maps received data at key path into a SwiftyJSON. If the conversion fails, the signal errors.
  func mapSwiftyJSON() -> Observable<JSON> {
    return self.map { JSON($0.data) }
  }
}

public extension ObservableType where E == JSON {
  
  func filterApiStatus() -> Observable<E> {
    return map { json -> E in
      //print(json)
      let status = json["Status"].intValue
      if status == 200 {
        return json
      }
      else if status == 401 {
        throw
          ServerAPI.Error(
            category: .tokenInvalid,
            name: "Error: filterSuccessfulStatusCodes with Status \(status)",
            message: json["Message"].stringValue)
      }
      else {
        throw
          ServerAPI.Error(
            name: "Error: filterSuccessfulStatusCodes with Status \(status)",
            message: json["Message"].stringValue)
      }
    }
  }
  
  func mapApiValue<T>(of type: T.Type,
                             dataPath: [String] = ["data"]) -> Observable<T> where T: Any {
    return map { json -> T in
      var dataRef = json
      for i in 0..<dataPath.count {
        dataRef = dataRef[dataPath[i]]
      }
      guard let mappedModel = dataRef.rawValue as? T
        else {
          throw
            ServerAPI.Error(
              name: "Error: mapApiModel",
              message: "Cannot map object to model.") }
      return mappedModel
    }
  }
  
  public func mapApiModel<T>(of type: T.Type,
                             dataPath: [String] = ["data"]) -> Observable<T> where T: Mappable {
    return map { json -> T in
      var dataRef = json
      for i in 0..<dataPath.count {
        dataRef = dataRef[dataPath[i]]
      }
      guard let mappedModel = Mapper<T>().map(JSONObject: dataRef.object)
        else {
          throw
            ServerAPI.Error(
              name: "Error: mapApiModel",
              message: "Cannot map object to model.") }
      return mappedModel
    }
  }
  
  func mapApiModelArray<T>(of type: T.Type,
                                  dataPath: [String] = ["data"]) -> Observable<[T]> where T: Mappable {
    return map { json -> [T] in
      var dataRef = json
      for i in 0..<dataPath.count {
        dataRef = dataRef[dataPath[i]]
      }
      guard let mappedModel = Mapper<T>().mapArray(JSONObject: dataRef.object)
        else {
          throw
            ServerAPI.Error(
              name: "Error: mapApiModel",
              message: "Cannot map object to model.") }
      return mappedModel
    }
  }
}

