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

    viewModel.coordinates.navigateToTabDetail
      .flatMapLatest { [weak self] _ -> Observable<Void> in
        guard let `self` = self else { return Observable.just(()) }
        return self.navigateToTabDetail(window: self.window, baseViewController: viewController)
      }
      .subscribe()
      .disposed(by: disposeBag)
    
    transition(to: viewController)
    
    return .never()
  }
  
  private func navigateToTabDetail(window: UIWindow, baseViewController: UIViewController) -> Observable<Void> {
    let tabDetailCoordinator = TabDetailCoordinator(window: window, baseViewController: baseViewController, transitionType: .push)
    return coordinate(to: tabDetailCoordinator)
  }
}
