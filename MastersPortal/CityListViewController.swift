//
//  CityListViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import SkeletonView
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
        view.showAnimatedGradientSkeleton()
        loadCities(in: countryName)
    }

    func loadCities(in country: String) {
        cities = DatabaseService.shared.getAllCitiesInCountry(country: country)
        view.hideSkeleton()
        tableView.reloadData()
    }
}

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let city = cities?[indexPath.row] else { return }
        let cityDetailVC = StoryboardScene.City.cityDetailViewController.instantiate()
        cityDetailVC.city = city
    }
}

extension CityListViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = cities?.count else {
            if !view.isSkeletonActive {
                tableView.setEmptyView(title: "Cities not found.", message: "There is no city has a Master's Program in \(countryName ?? "country").")
            }

            return 0
        }

        tableView.restore()
        return count
    }

    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        "CityListCell"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let city = cities?[indexPath.row] else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListCell", for: indexPath)
        cell.textLabel?.text = city.name
        return cell
    }
}
