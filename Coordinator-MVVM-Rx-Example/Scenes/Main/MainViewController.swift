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

class MainViewController: UIViewController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var tokenLabel: UILabel!
  
  // MARK: Property
  
  var viewModel: MainViewModelType!
  let disposeBag = DisposeBag()
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
  }
  
  func bindViewModel() {
    
    backButton.rx.tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)
  }
}
