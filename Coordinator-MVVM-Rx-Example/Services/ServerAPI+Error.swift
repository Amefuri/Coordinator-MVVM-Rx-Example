//
//  ServerAPI+Error.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 25/4/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import Moya

public protocol ServerAPIErrorType {
  var category: ServerAPI.ErrorCategory { get }
  var name: String { get }
  var message: String { get }
}

public extension ServerAPI
{
  enum ErrorCategory {
    case generic
    case tokenInvalid
  }
  
  struct Error: Swift.Error
  {
    private var _category: ErrorCategory = .generic
    private var _name: String?
    private var _message: String?
    private var _domain: Int?
    private var _code: Int?
    
    public init(
      category: ErrorCategory,
      name: String,
      message: String,
      domain: Int,
      code: Int?)
    {
      self._category = category
      self._name = name
      self._message = message
      self._domain = domain
      self._code = code
    }
    
    public init(category: ErrorCategory = .generic, name: String, message: String) {
      self = Error(
        category: category,
        name: name,
        message: message,
        domain: 0,
        code: 0)
    }
    
    public init(error: Swift.Error) {
      
      if let errorResponse = error as? Error {
        self = errorResponse
      }
      else { // Generic Error
        self = Error(name: "Generic Error", message: error.localizedDescription)
      }
    }
  }
}

extension ServerAPI.Error: ServerAPIErrorType {
  
  public var category: ServerAPI.ErrorCategory {
    return _category
  }
  
  public var name: String {
    return _name ?? ""
  }
  
  public var message: String {
    return _message ?? ""
  }
}
