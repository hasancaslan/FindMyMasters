//
//  SearchFooter.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import UIKit

class SearchFooter: UIView {
  let label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    configureView()
  }
  
  override func draw(_ rect: CGRect) {
    label.frame = bounds
  }
  
  func setNotFiltering() {
    label.text = ""
    hideFooter()
  }
  
  func setIsFilteringToShow(filteredItemCount: Int, of totalItemCount: Int) {
    if (filteredItemCount == totalItemCount) {
      setNotFiltering()
    } else if (filteredItemCount == 0) {
      label.text = "No items match your query"
      showFooter()
    } else {
      label.text = "Filtering \(filteredItemCount) of \(totalItemCount)"
      showFooter()
    }
  }
  
  func hideFooter() {
    UIView.animate(withDuration: 0.7) {
      self.alpha = 0.0
    }
  }
  
  func showFooter() {
    UIView.animate(withDuration: 0.7) {
      self.alpha = 1.0
    }
  }
  
  func configureView() {
    backgroundColor = Asset.Colors.primaryColor.color
    alpha = 0.0
    
    label.textAlignment = .center
    label.textColor = UIColor.white
    addSubview(label)
  }
}
