//
//  RightTabViewModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 6/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import RxSwift
import RxCocoa

protocol RightTabViewModelInputs {
    
}

protocol RightTabViewModelOutputs {
    
}

protocol RightTabViewModelType {
  var inputs: RightTabViewModelInputs { get }
  var outputs: RightTabViewModelOutputs { get }
}

class RightTabViewModel: RightTabViewModelType, RightTabViewModelInputs, RightTabViewModelOutputs {
  
  // MARK: Property
  
  // MARK: Init
    
  public init() {
  }
  
  // MARK: Private
  
  // MARK: Input
    
  // MARK: Output
    
  // MARK: Input&Output
    
  public var outputs: RightTabViewModelOutputs { return self }
  public var inputs: RightTabViewModelInputs { return self }
}
