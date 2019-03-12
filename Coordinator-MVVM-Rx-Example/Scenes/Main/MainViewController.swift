//
//  MainViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UITabBarController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  //@IBOutlet weak var backButton: UIButton!
  //@IBOutlet weak var tokenLabel: UILabel!
  
  // MARK: Property
  
  var viewModel: MainViewModelType!
  let disposeBag = DisposeBag()
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
    delegate = self
  }
  
  func bindViewModel() {
    
    /*backButton.rx.tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)*/
  }
}

extension MainViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    guard let viewControllers = viewControllers else { return false }
    if viewControllers[tabBarController.selectedIndex] == viewController {
      viewModel.inputs.tabIndexTrigger.onNext(tabBarController.selectedIndex)
      return false
    }
    return true
  }
}
