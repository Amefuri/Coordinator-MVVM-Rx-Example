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
  
  var viewModel: RightTabViewModelType!
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func bindViewModel() {
  }
}
