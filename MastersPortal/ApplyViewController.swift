//
//  ApplyViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 25/5/21.
//

import Eureka
import PKHUD

class ApplyViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Apply.Navigation.title
        title = L10n.Apply.Navigation.title

        form +++ Section("Student")
            <<< TextRow { row in
                row.title = "Name"
                row.placeholder = "Enter name here"
            }
            <<< TextRow { row in
                row.title = "Gender"
                row.placeholder = "Enter gender here"
            }
            <<< DateRow {
                $0.title = "Birthday"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
            }
            <<< IntRow {
                $0.title = "Social security number"
                $0.placeholder = "Enter SSN here"
            }
            +++ Section("Program")
            <<< TextRow { row in
                row.title = "University"
                row.placeholder = "Enter university here"
            }
            <<< TextRow { row in
                row.title = "Program"
                row.placeholder = "Enter program here"
            }
            +++ Section()
            <<< ButtonRow { row in
                row.title = "Submit"
            }.onCellSelection { cell, row in
                PKHUD.sharedHUD.contentView = PKHUDSuccessView()
                PKHUD.sharedHUD.show()
                PKHUD.sharedHUD.hide(afterDelay: 1.0) { success in
                    // Completion Handler
                }
            }.cellSetup { cell, row in
                cell.backgroundColor = Asset.Colors.primaryColor.color
            }
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
