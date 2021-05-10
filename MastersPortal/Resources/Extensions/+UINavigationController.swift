//
//  File.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

extension UINavigationController {
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

    func configureNavigationBar() {
        navigationBar.prefersLargeTitles = true
        navigationBar.barStyle = .black
        navigationBar.backgroundColor = Asset.Colors.primaryColor.color
        setStatusBar(backgroundColor: Asset.Colors.primaryColor.color)
    }
}
