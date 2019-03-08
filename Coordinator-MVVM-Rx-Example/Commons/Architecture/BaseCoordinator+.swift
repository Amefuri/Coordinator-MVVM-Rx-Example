//
//  BaseCoordinator+.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 6/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit

enum CoordinatorTransitionType {
  case push
  case modal
  case rootWindow
  case rootNaviagtion
}

extension BaseCoordinator {
  
  func transition(to destinationViewController: UIViewController) {
    switch transitionType {
    case .push:
      baseViewController.navigationController?.pushViewController(destinationViewController, animated: animated)
    case .modal:
      baseViewController.present(destinationViewController, animated: animated, completion: nil)
    case .rootWindow:
      window.rootViewController = destinationViewController
    case .rootNaviagtion:
      (baseViewController as! UINavigationController).pushViewController(destinationViewController, animated: false)
    }
  }
  
}
