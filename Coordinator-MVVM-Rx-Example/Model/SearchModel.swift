//
//  SearchModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 25/4/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import ObjectMapper

public class SearchModel: NSObject {
  var id: Int             = 0
  var nodeId: Int         = 0
  var name: String        = ""
  var fullName: String    = ""
  var htmlURL: String     = ""
  var desc: String = ""
  
  required convenience public init?(map: Map) {
    self.init()
  }
}

extension SearchModel: Mappable {
  public func mapping(map: Map) {
    id              <- map["id"]
    nodeId          <- map["node_id"]
    name            <- map["name"]
    fullName        <- map["full_name"]
    htmlURL         <- map["html_url"]
    desc     <- map["description"]
  }
}
