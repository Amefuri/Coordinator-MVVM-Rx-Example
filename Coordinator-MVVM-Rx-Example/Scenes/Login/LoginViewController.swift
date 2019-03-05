//
//  LoginViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  @IBOutlet weak var nextButton: UIButton!
  
  // MARK: Property 
  
  var viewModel: LoginViewModelType!
  let disposeBag = DisposeBag()
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
  }
  
  func bindViewModel() {
    
    nextButton.rx.tap
      .map{(username: "", password: "")}
      .bind(to: viewModel.inputs.loginTrigger)
      .disposed(by: disposeBag)
  }
}
