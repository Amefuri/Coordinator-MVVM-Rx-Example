//
//  Storyboard.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

enum Storyboard {
  case main
  
  var identifier: String {
    switch self {
    case .main:
      return "Main"
    }
  }
}
