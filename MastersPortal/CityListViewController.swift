//
//  CityListViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import UIKit

class CityListViewController: UIViewController {
    var countryName: String!
    @IBOutlet var tableView: UITableView!
    var cities: [City]?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = countryName
        tableView.tableFooterView = UIView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCities(in: countryName)
    }

    func loadCities(in country: String) {
        cities = DatabaseService.shared.getAllCitiesInCountry(country: country)
        tableView.reloadData()
    }

    func loadPrograms(in city: City) -> [Program]? {
        return DatabaseService.shared.getAllProgramsInCity(name: city.name, country: city.country)
    }
}

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let city = cities?[indexPath.row] else { return }

        let programs = loadPrograms(in: city)

        let programsViewController = ProgramPageViewController(title: "Programs in \(city.name)", dataSource: programs)

        navigationController?.pushViewController(programsViewController, animated: true)
    }
}

extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cities = cities, !cities.isEmpty
        else {
            tableView.setEmptyView(
                title: "Cities not found.",
                message: "There is no city has a Master's Program in \(countryName ?? "country").")
            return 0
        }

        tableView.restore()
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = cities?[indexPath.row] else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath)
        cell.textLabel?.text = city.name
        return cell
    }
}
