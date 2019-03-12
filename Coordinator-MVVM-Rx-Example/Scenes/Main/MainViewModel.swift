//
//  MainViewModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import RxSwift
import RxCocoa

protocol MainViewModelInputs {
  var tabIndexTrigger: PublishSubject<Int> { get }
}

protocol MainViewModelOutputs {
  
}

protocol MainViewModelCoordinates {
  var navigateTabIndex: PublishSubject<Int> { get }
}

protocol MainViewModelType {
  var inputs: MainViewModelInputs { get }
  var outputs: MainViewModelOutputs { get }
  var coordinates: MainViewModelCoordinates { get }
}

class MainViewModel: MainViewModelType, MainViewModelInputs, MainViewModelOutputs, MainViewModelCoordinates {
  
  // MARK: Property
  
  let disposeBag = DisposeBag()
  let token: String
  
  // MARK: Init
    
  public init(token: String) {
    self.token = token
    
    inputs
      .tabIndexTrigger
      .bind(to: coordinates.navigateTabIndex)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  var tabIndexTrigger = PublishSubject<Int>()
  
  // MARK: Output
  
  // MARK: Coordinate
  var navigateTabIndex = PublishSubject<Int>()
  
  // MARK: Input&Output&Coordinate
    
  public var outputs: MainViewModelOutputs { return self }
  public var inputs: MainViewModelInputs { return self }
  public var coordinates: MainViewModelCoordinates { return self }
}
