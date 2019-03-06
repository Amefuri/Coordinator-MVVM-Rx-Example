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
    let mainViewModel = MainViewModel(token: token)
    let mainViewController = MainViewController.initFromStoryboard(name: Storyboard.main.identifier) 
    mainViewController.viewModel = mainViewModel
  
    let leftTabViewModel = LeftTabViewModel()
    let leftTabViewController = LeftTabViewController.initFromStoryboard(name: Storyboard.main.identifier)
    leftTabViewController.viewModel = leftTabViewModel
    
    let rightTabViewModel = RightTabViewModel()
    let rightTabViewController = RightTabViewController.initFromStoryboard(name: Storyboard.main.identifier)
    rightTabViewController.viewModel = rightTabViewModel
    
    // Setup LeftNavigation
    let leftNav = UINavigationController(rootViewController: leftTabViewController)
    leftNav.tabBarItem = UITabBarItem(title: "LeftBar", image: nil, selectedImage: nil)
    
    // Setup RightNavigation
    let rightNav = UINavigationController(rootViewController: rightTabViewController)
    rightNav.tabBarItem = UITabBarItem(title: "RightBar", image: nil, selectedImage: nil)
    
    // Setup TabBarViewController
    mainViewController.viewControllers = [leftNav, rightNav]
    
    transitionScenes(destinationViewController: mainViewController)
    
    /*viewModel.coordinates.navigateBack
      .subscribe(onNext: { _ in
        viewController.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)*/
    
    return .never() //viewModel.coordinates.navigateBack
  }
  
  var inputParams: MainCoordinatorInputParamsType { return self }
}
