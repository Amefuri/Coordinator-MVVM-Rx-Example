//
//  LeftTabViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 6/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LeftTabViewController: UIViewController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  // MARK: Property 
  
  var viewModel: LeftTabViewModelType!
  var rightBarButtonItem: UIBarButtonItem!
  let disposeBag = DisposeBag()
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindViewModel()
  }
  
  func bindViewModel() {
    rightBarButtonItem
      .rx
      .tap
      .bind(to: viewModel.inputs.rightBarButtonTrigger)
      .disposed(by: disposeBag)
  }
  
  func setup() {
    rightBarButtonItem = UIBarButtonItem(title: "Push", style: .done, target: self, action: nil/*#selector()*/)
    self.navigationItem.rightBarButtonItem = rightBarButtonItem
  }
}
