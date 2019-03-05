//
//  MainCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

class MainCoordinator: BaseCoordinator<Void> {
  
  let rootViewController: UIViewController!
  
  init(rootViewController: UIViewController) {
    self.rootViewController = rootViewController
  }
  
  override func start() -> Observable<Void> {
    let viewModel = MainViewModel()
    let viewController = MainViewController.initFromStoryboard(name: Storyboard.main.storyboardID)
    viewController.viewModel = viewModel
    
    viewModel.coordinates.navigateBack
      .subscribe(onNext: { _ in
        viewController.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)
    
    rootViewController.navigationController?.pushViewController(viewController, animated: true)
    
    return viewModel.coordinates.navigateBack
  }
}
