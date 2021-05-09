//
//  DecideViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

class DecideViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Decide.Navigation.title
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
