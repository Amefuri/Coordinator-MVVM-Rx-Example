//
//  RightTabCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 6/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

class RightTabCoordinator: BaseCoordinator<Void> {
  
  override func start() -> Observable<Void> {
    let viewModel = RightTabViewModel()
    let viewController = RightTabViewController.initFromStoryboard(name: Storyboard.main.identifier)
    viewController.viewModel = viewModel
    
    return .never()
  }
}
