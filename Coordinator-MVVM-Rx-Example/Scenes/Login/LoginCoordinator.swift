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
  
  override func start() -> Observable<Void> {
    let viewModel = LoginViewModel()
    let viewController = LoginViewController.initFromStoryboard(name: Storyboard.main.identifier)
    let navigationController = UINavigationController(rootViewController: viewController)
    
    viewController.viewModel = viewModel
    
    viewModel.coordinates.navigateToMain
      .flatMapLatest { [weak self] token -> Observable<Void> in
        guard let `self` = self else { return Observable.just(()) }
        return self.navigateToMain(window: self.window, baseViewController: viewController, token: token)
      }
      .subscribe()
      .disposed(by: disposeBag)
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    return .never()
  }
  
  private func navigateToMain(window: UIWindow, baseViewController: UIViewController, token: String) -> Observable<Void> {
    let mainCoordinator = MainCoordinator(window: window, baseViewController: baseViewController)
    mainCoordinator.inputParams.token = token
    return coordinate(to: mainCoordinator)
  }
}
