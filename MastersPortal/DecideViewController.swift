//
//  DecideViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import Parchment
import UIKit

struct DecideCellDataContainer {
    var title: String
    var subtitle: String
    var icon: UIImage
}

class DecideViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Decide.Navigation.title
    }

    var tableViewModel: [DecideCellDataContainer] = {
        let largeConfig = UIImage.SymbolConfiguration(textStyle: .largeTitle)

        return [DecideCellDataContainer(title: "Cheapest in Country",
                                        subtitle: "3 cheapest programs in the given field of each country, if any.",
                                        icon: UIImage(systemName: "dollarsign.circle.fill", withConfiguration: largeConfig)!),
                DecideCellDataContainer(title: "Keywords in Program",
                                                subtitle: "For those who are not sure, the cheapest schools for given keywords.",
                                                icon: UIImage(systemName: "person.fill.questionmark", withConfiguration: largeConfig)!),
                DecideCellDataContainer(title: "Cheapest in Country",
                                                subtitle: "3 cheapest programs in the given field of each country, if any.",
                                                icon: UIImage(systemName: "dollarsign.circle.fill", withConfiguration: largeConfig)!),
                DecideCellDataContainer(title: "Cheapest in Country",
                                                subtitle: "3 cheapest programs in the given field of each country, if any.",
                                                icon: UIImage(systemName: "dollarsign.circle.fill", withConfiguration: largeConfig)!),
                DecideCellDataContainer(title: "Cheapest in Country",
                                                subtitle: "3 cheapest programs in the given field of each country, if any.",
                                                icon: UIImage(systemName: "dollarsign.circle.fill", withConfiguration: largeConfig)!)]
    }()
}

extension DecideViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableViewModel.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DecideCell", for: indexPath)
        let data = tableViewModel[indexPath.section]

        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.subtitle
        cell.imageView?.image = data.icon

        if indexPath.section % 2 == 0 {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
            cell.imageView?.tintColor = .white
            cell.backgroundColor = Asset.Colors.primaryColor.color
        } else {
            cell.textLabel?.textColor = .black
            cell.detailTextLabel?.textColor = .black
            cell.imageView?.tintColor = Asset.Colors.primaryColor.color
            cell.backgroundColor = .white
        }

        return cell
    }
}

extension DecideViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.section {
        case 0:
            let cheapViewController = CheapProgramSearchViewController()
            navigationController?.pushViewController(cheapViewController, animated: true)

        default:
            break
        }
    }
}
