//
//  LeftTabViewModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 6/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import RxSwift
import RxCocoa

protocol LeftTabViewModelInputs {
    
}

protocol LeftTabViewModelOutputs {
    
}

protocol LeftTabViewModelType {
  var inputs: LeftTabViewModelInputs { get }
  var outputs: LeftTabViewModelOutputs { get }
}

class LeftTabViewModel: LeftTabViewModelType, LeftTabViewModelInputs, LeftTabViewModelOutputs {
  
  // MARK: Property
  
  // MARK: Init
    
  public init() {
  }
  
  // MARK: Private
  
  // MARK: Input
    
  // MARK: Output
    
  // MARK: Input&Output
    
  public var outputs: LeftTabViewModelOutputs { return self }
  public var inputs: LeftTabViewModelInputs { return self }
}
