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
  var rightBarButtonTrigger: PublishSubject<Void> { get }
}

protocol RightTabViewModelOutputs {
    
}

protocol RightTabViewModelCoordinates {
  var navigateToTabDetail: PublishSubject<Void> { get }
}

protocol RightTabViewModelType {
  var inputs: RightTabViewModelInputs { get }
  var outputs: RightTabViewModelOutputs { get }
  var coordinates: RightTabViewModelCoordinates { get }
}

class RightTabViewModel: RightTabViewModelType, RightTabViewModelInputs, RightTabViewModelOutputs, RightTabViewModelCoordinates {
  
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
  public var outputs: RightTabViewModelOutputs { return self }
  public var inputs: RightTabViewModelInputs { return self }
  internal var coordinates: RightTabViewModelCoordinates { return self }
}
