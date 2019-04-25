//
//  TabDetailViewController.swift
//  Coordinator-MVVM-Rx-Example
//
//  Created by xAdmin on 12/3/2562 BE.
//  Copyright © 2562 DayDreamClover. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TabDetailViewController: UIViewController, StoryboardInitializable {
  
  // MARK: IBOutlet
  
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var resultTextView: UITextView!
  
  
  // MARK: Property
  
  var viewModel: TabDetailViewModelType!
  let disposeBag = DisposeBag()
  var leftBarButtonItem: UIBarButtonItem!
  
  // MARK: View Life Cycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindViewModel()
  }
  
  func bindViewModel() {
    leftBarButtonItem
      .rx
      .tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)
    
    backButton
      .rx
      .tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)
    
    searchButton
      .rx
      .tap
      .subscribe(onNext: { [weak self] _ in
        guard let keyword = self?.searchTextField.text else { return }
        self?.viewModel
          .inputs
          .searchButtonTrigger
          .onNext(keyword)})
      .disposed(by: disposeBag)
    
    viewModel
      .outputs
      .displaySearchData
      .subscribe(onNext: { [weak self] searchDatas in
        self?.resultTextView.text = ""
        for searchData in searchDatas {
          self?.resultTextView.text += "\(searchData.name) \(searchData.fullName) \n"
        }})
      .disposed(by: disposeBag)
    
  }
  
  //MARK: Setup
  
  func setup() {
    leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: nil/*#selector()*/)
    self.navigationItem.leftBarButtonItem = leftBarButtonItem
    backButton.isHidden = (navigationController != nil)
    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
}
