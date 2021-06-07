//
//  ProgramDetailViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 6/6/21.
//

import UIKit

class ProgramDetailViewController: UIViewController {
    @IBOutlet var universityNameLabel: UILabel!
    @IBOutlet var programNameLabel: UILabel!

    @IBOutlet var deadlineLabel: UILabel!
    @IBOutlet var deadlineView: UIView!

    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var languageView: UIView!

    @IBOutlet var tutionLabel: UILabel!
    @IBOutlet var tutionView: UIView!

    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var durationView: UIView!

    @IBOutlet var cityView: UIView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!

    @IBOutlet var requirementsTextField: UITextView!

    @IBOutlet var applyButton: UIButton!

    var model: ProgramDetailDataContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setSmoothCorners()
        configureView(model: model)
    }

    private func setSmoothCorners() {
        deadlineView.layer.cornerRadius = 13
        languageView.layer.cornerRadius = 13
        tutionView.layer.cornerRadius = 13
        durationView.layer.cornerRadius = 13
        applyButton.layer.cornerRadius = 13
        cityView.layer.cornerRadius = 13
        requirementsTextField.layer.cornerRadius = 13
    }

    public func configureView(model: ProgramDetailDataContainer) {
        universityNameLabel.text = model.universityName
        programNameLabel.text = model.programName

        deadlineLabel.text = formatTimestamp(model.deadline)
        languageLabel.text = model.language
        tutionLabel.text = model.tution
        durationLabel.text = model.duration

        cityNameLabel.text = model.cityName
        countryNameLabel.text = model.countryName

        requirementsTextField.attributedText = model.academicRequirement.htmlToAttributedString
    }

    @IBAction func presentCityDetails(_ sender: Any) {
        guard let city = DatabaseService.shared.findCity(name: model.cityName, country: model.countryName) else {
            let alert = UIAlertController(title: "Couldn't find city.", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            return
        }

        let cityDetailVC = StoryboardScene.City.cityDetailViewController.instantiate()
        cityDetailVC.city = city
        present(cityDetailVC, animated: true)
    }

    private func formatTimestamp(_ timestamp: String) -> String? {
        var dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = dateFormatter.date(from: timestamp) else { return nil }

        dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("dMMMyyyy")
        return dateFormatter.string(from: date)
    }

    @IBAction func applyToProgram(_ sender: Any) {}

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(
                data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }

    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
