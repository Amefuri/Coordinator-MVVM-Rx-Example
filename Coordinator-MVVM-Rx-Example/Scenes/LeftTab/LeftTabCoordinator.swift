//
//  LeftTabCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 6/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

class LeftTabCoordinator: BaseCoordinator<Void> {
  
  override func start() -> Observable<Void> {
    let viewModel = LeftTabViewModel()
    let viewController = LeftTabViewController.initFromStoryboard(name: Storyboard.main.identifier)
    viewController.viewModel = viewModel
    
    transition(to: viewController)
    
    return .never()
  }
}
