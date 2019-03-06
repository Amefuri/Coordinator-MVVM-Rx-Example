//
//  MainCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

protocol MainCoordinatorInputParamsType: class {
  var token: String { get set }
}

class MainCoordinator: BaseCoordinator<Void>, MainCoordinatorInputParamsType {
  
  var token: String = ""
  
  override func start() -> Observable<Void> {
    let viewModel = MainViewModel(token: token)
    let viewController = MainViewController.initFromStoryboard(name: Storyboard.main.identifier)
    viewController.viewModel = viewModel
    
    viewModel.coordinates.navigateBack
      .subscribe(onNext: { _ in
        viewController.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)
    
    transitionScenes(destinationViewController: viewController)
    
    return viewModel.coordinates.navigateBack
  }
  
  var inputParams: MainCoordinatorInputParamsType { return self }
}
