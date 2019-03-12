//
//  TabDetailViewModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 12/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import RxSwift
import RxCocoa

protocol TabDetailViewModelInputs {
  var navigateBackTrigger: PublishSubject<Void> { get }
}

protocol TabDetailViewModelOutputs {
    
}

protocol TabDetailViewModelCoordinates {
  var navigateBack: PublishSubject<Void> { get }
}

protocol TabDetailViewModelType {
  var inputs: TabDetailViewModelInputs { get }
  var outputs: TabDetailViewModelOutputs { get }
  var coordinates: TabDetailViewModelCoordinates { get }
}

class TabDetailViewModel: TabDetailViewModelType, TabDetailViewModelInputs, TabDetailViewModelOutputs, TabDetailViewModelCoordinates {
  
  // MARK: Property
  
  var viewModel: TabDetailViewModelType!
  let disposeBag = DisposeBag()
  
  // MARK: Init
  
  public init() {
    inputs.navigateBackTrigger
      .bind(to: coordinates.navigateBack)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  var navigateBackTrigger = PublishSubject<Void>()
    
  // MARK: Output

  // MARK: Coordinates
  
  var navigateBack = PublishSubject<Void>()
    
  // MARK: Input&Output&Coordinates
    
  public var outputs: TabDetailViewModelOutputs { return self }
  public var inputs: TabDetailViewModelInputs { return self }
  public var coordinates: TabDetailViewModelCoordinates { return self }
}
