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
  var rightBarButtonTrigger: PublishSubject<Void> { get }
}

protocol LeftTabViewModelOutputs {
    
}

protocol LeftTabViewModelCoordinates {
  var navigateToTabDetail: PublishSubject<Void> { get }
}

protocol LeftTabViewModelType {
  var inputs: LeftTabViewModelInputs { get }
  var outputs: LeftTabViewModelOutputs { get }
}

class LeftTabViewModel: LeftTabViewModelType, LeftTabViewModelInputs, LeftTabViewModelOutputs, LeftTabViewModelCoordinates {
  
  // MARK: Property
  
  let disposeBag = DisposeBag()
  
  // MARK: Init
    
  public init() {
    inputs.rightBarButtonTrigger
      .bind(to: coordinates.navigateToTabDetail)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  var rightBarButtonTrigger = PublishSubject<Void>()
    
  // MARK: Output
  
  // MARK: Coordinate
  
  var navigateToTabDetail = PublishSubject<Void>()
    
  // MARK: Input&Output&Coordinate
    
  public var outputs: LeftTabViewModelOutputs { return self }
  public var inputs: LeftTabViewModelInputs { return self }
  internal var coordinates: LeftTabViewModelCoordinates { return self }
}
