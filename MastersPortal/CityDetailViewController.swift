//
//  CityDetailViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import UIKit

class CityDetailViewController: UIViewController {
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    var city: City! {
        didSet {
            tableViewModel = [
                city.qualityOfLifeIndex,
                city.purchasingPowerIndex,
                city.safetyIndex,
                city.healthCareIndex,
                city.costOfLivingIndex,
                city.propertyPricetoIncome,
                city.trafficCommuteTimeIndex,
                city.pollutionIndex,
                city.climateIndex
            ]
        }
    }

    var tableViewModel = [Double]()
    var headerViewModel: [City.CodingKeys] = [
        .qualityOfLifeIndex,
        .purchasingPowerIndex,
        .safetyIndex,
        .healthCareIndex,
        .costOfLivingIndex,
        .propertyPricetoIncome,
        .trafficCommuteTimeIndex,
        .pollutionIndex,
        .climateIndex
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(city: city)
    }

    public func configureView(city: City) {
        cityNameLabel.text = city.name
        countryNameLabel.text = city.country
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension CityDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        9
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerViewModel[section].rawValue.replacingOccurrences(of: "_", with: " ")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CityDetailCell", for: indexPath)
        let data = tableViewModel[indexPath.section]
        cell.textLabel?.text = String(data)
        return cell
    }
}
