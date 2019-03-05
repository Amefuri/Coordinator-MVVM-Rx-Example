//
//  LoginCoordinator.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxSwift

class LoginCoordinator: BaseCoordinator<Void> {
  
  let window: UIWindow!
  
  init(window: UIWindow) {
    self.window = window
  }
  
  override func start() -> Observable<Void> {
    let viewModel = LoginViewModel()
    let viewController = LoginViewController.initFromStoryboard(name: Storyboard.main.storyboardID)
    let navigationController = UINavigationController(rootViewController: viewController)
    
    viewController.viewModel = viewModel
    
    viewModel.coordinates.navigateToMain
      .flatMapLatest { [weak self] _ -> Observable<Void> in
        guard let `self` = self else { return Observable.just(()) }
        return self.navigateToMain(on: viewController)
      }
      .subscribe()
      .disposed(by: disposeBag)
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    return .never()
  }
  
  private func navigateToMain(on rootViewController: UIViewController) -> Observable<Void> {
    let mainCoordinator = MainCoordinator(rootViewController: rootViewController)
    return coordinate(to: mainCoordinator)
  }
}
