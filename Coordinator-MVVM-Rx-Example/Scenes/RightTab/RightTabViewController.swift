//
//  RightTabViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 6/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RightTabViewController: UIViewController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  // MARK: Property 
  
  let disposeBag = DisposeBag()
  var viewModel: RightTabViewModelType!
  var rightBarButtonItem: UIBarButtonItem!
  
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
    rightBarButtonItem = UIBarButtonItem(title: "Modal", style: .done, target: self, action: nil/*#selector()*/)
    self.navigationItem.rightBarButtonItem = rightBarButtonItem
  }
}
