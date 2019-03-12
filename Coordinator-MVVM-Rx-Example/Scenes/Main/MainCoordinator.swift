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
  
  var leftBarCoordinator: LeftTabCoordinator!
  var rightBarCoordinator: RightTabCoordinator!
  
  override func start() -> Observable<Void> {
    let mainViewModel = MainViewModel(token: token)
    let mainViewController = MainViewController.initFromStoryboard(name: Storyboard.main.identifier) 
    mainViewController.viewModel = mainViewModel
  
    /*let leftTabViewModel = LeftTabViewModel()
    let leftTabViewController = LeftTabViewController.initFromStoryboard(name: Storyboard.main.identifier)
    leftTabViewController.viewModel = leftTabViewModel
    
    let rightTabViewModel = RightTabViewModel()
    let rightTabViewController = RightTabViewController.initFromStoryboard(name: Storyboard.main.identifier)
    rightTabViewController.viewModel = rightTabViewModel*/
    
    // Setup LeftNavigation
    let leftNav = UINavigationController()
    leftNav.tabBarItem = UITabBarItem(title: "LeftBar", image: nil, selectedImage: nil)
    
    // Setup RightNavigation
    let rightNav = UINavigationController()
    rightNav.tabBarItem = UITabBarItem(title: "RightBar", image: nil, selectedImage: nil)
    
    // Setup TabBarViewController
    mainViewController.viewControllers = [leftNav, rightNav]
    
    transition(to: mainViewController)
    
    leftBarCoordinator = LeftTabCoordinator(window: window, baseViewController: leftNav, transitionType: .rootNaviagtion)
    coordinate(to: leftBarCoordinator)
      .subscribe()
      .disposed(by: disposeBag)
    
    rightBarCoordinator = RightTabCoordinator(window: window, baseViewController: rightNav, transitionType: .rootNaviagtion)
    coordinate(to: rightBarCoordinator)
      .subscribe()
      .disposed(by: disposeBag)
    
    mainViewModel
      .coordinates
      .navigateTabIndex
      .subscribe(onNext: { index in
        switch index {
        case 0:
          print("0")
        case 1:
          print("1")
        default:
          break
        }
      }).disposed(by: disposeBag)
    
    return .never()
  }
  
  var inputParams: MainCoordinatorInputParamsType { return self }
}
