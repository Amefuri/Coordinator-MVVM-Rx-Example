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
  case root
}

extension BaseCoordinator {
  
  func transitionScenes(destinationViewController: UIViewController) {
    switch transitionType {
    case .push:
      baseViewController.navigationController?.pushViewController(destinationViewController, animated: animated)
    case .modal:
      baseViewController.present(destinationViewController, animated: animated, completion: nil)
    case .root:
      window.rootViewController = destinationViewController
    }
  }
  
}
