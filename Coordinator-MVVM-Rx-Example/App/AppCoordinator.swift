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
  
  override init(window: UIWindow, baseViewController: UIViewController = UIViewController(), transitionType: CoordinatorTransitionType = .root, animated: Bool = true) {
    super.init(window: window, baseViewController: baseViewController, transitionType: transitionType)
  }
  
  override func start() -> Observable<Void> {
    let loginCoordinator = LoginCoordinator(window: window)
    return coordinate(to: loginCoordinator)
  }
}
