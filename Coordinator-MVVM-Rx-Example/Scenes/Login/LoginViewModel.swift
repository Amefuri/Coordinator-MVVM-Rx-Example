//
//  LoginViewModel.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by peerapat atawatana on 5/3/2562 BE.
//Copyright © 2562 DayDreamClover. All rights reserved.
//

import RxSwift
import RxCocoa

protocol LoginViewModelInputs {
  var loginTrigger: PublishSubject<(username: String, password: String)> { get }
}

protocol LoginViewModelOutputs {
    
}

protocol LoginViewModelCoordinates {
  var navigateToMain: PublishSubject<String> { get }
}

protocol LoginViewModelType {
  var inputs: LoginViewModelInputs { get }
  var outputs: LoginViewModelOutputs { get }
  var coordinates: LoginViewModelCoordinates { get }
}

class LoginViewModel: LoginViewModelType, LoginViewModelInputs, LoginViewModelOutputs, LoginViewModelCoordinates {
  
  // MARK: Property
  
  let disposeBag = DisposeBag()
  
  // MARK: Init
    
  public init() {
    
    inputs.loginTrigger
      .map{ _ in return "hyuhbuknbknjk" }
      .bind(to:  coordinates.navigateToMain)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  let loginTrigger = PublishSubject<(username: String, password: String)>()
  
  // MARK: Output
  
  // MARK: Coordinates
  
  let navigateToMain = PublishSubject<String>()
  
  // MARK: Input&Output&Coordinates
    
  public var outputs: LoginViewModelOutputs { return self }
  public var inputs: LoginViewModelInputs { return self }
  internal var coordinates: LoginViewModelCoordinates { return self }
}
