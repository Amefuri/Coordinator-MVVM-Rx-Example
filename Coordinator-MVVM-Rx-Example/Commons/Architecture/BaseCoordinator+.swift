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
  case rootNavigation
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
    case .rootNavigation:
      (baseViewController as! UINavigationController).pushViewController(destinationViewController, animated: false)
    }
  }
  
  func navigateBack() {
    switch transitionType {
    case .push:
      baseViewController.navigationController?.popViewController(animated: animated)
    case .modal:
      baseViewController.dismiss(animated: animated, completion: nil)
    case .rootWindow:
      break
    case .rootNavigation:
      break
    }
  }
  
}
