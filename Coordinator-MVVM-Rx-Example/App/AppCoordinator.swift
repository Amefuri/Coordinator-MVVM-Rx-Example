//
//  AppCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
  
  private let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  override func start() -> Observable<Void> {
    let loginCoordinator = LoginCoordinator(window: window)
    return coordinate(to: loginCoordinator)
  }
}
