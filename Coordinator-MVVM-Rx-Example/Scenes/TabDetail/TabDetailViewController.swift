//
//  TabDetailViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 12/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TabDetailViewController: UIViewController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  @IBOutlet weak var backButton: UIButton!
  
  // MARK: Property
  
  var viewModel: TabDetailViewModelType!
  let disposeBag = DisposeBag()
  var leftBarButtonItem: UIBarButtonItem!
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindViewModel()
  }
  
  func bindViewModel() {
    leftBarButtonItem
      .rx
      .tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)
    
    backButton
      .rx
      .tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)
    
  }
  
  func setup() {
    leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: nil/*#selector()*/)
    self.navigationItem.leftBarButtonItem = leftBarButtonItem

    if let _ = navigationController {
      backButton.isHidden = true
    } else {
      backButton.isHidden = false
    }
  }
}
