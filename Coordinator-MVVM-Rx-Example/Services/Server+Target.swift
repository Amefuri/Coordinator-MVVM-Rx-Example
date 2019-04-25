//
//  Server+Target.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 4/4/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import Moya

extension Server: TargetType {
  var baseURL: URL {
    switch developmentState {
    case .development:
      switch self {
      case .searchRepo(_):
        return URL(string: "https://api.github.com/")!
      }
    case .production:
      switch self {
      case .searchRepo(_):
        return URL(string: "https://api.github.com/")!
      }
    }
  }
  
  var path: String {
    switch self {
    case .searchRepo(_):
      return "search/repositories"
    }
  }
  
  var method: Method {
    switch self {
    case .searchRepo(_):
      return .get
    }
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .searchRepo(let keyword):
      return .requestParameters(parameters: ["q" : keyword],
                                encoding: URLEncoding.queryString)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .searchRepo(_):
      return [:]
    }
  }
}
