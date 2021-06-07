//
//  CheapProgramCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import UIKit

class CheapProgramCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var programNameLabel: UILabel!
    @IBOutlet weak var universityNameLabel: UILabel!
    @IBOutlet weak var tuitionLabel: UILabel!
    @IBOutlet weak var tuitionContainerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        tuitionContainerView.layer.cornerRadius = 13
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ viewModel: CheapProgramDataContainer) {
        countryLabel.text = viewModel.countryName
        programNameLabel.text = viewModel.programName
        universityNameLabel.text = viewModel.universityName
        tuitionLabel.text = "\(viewModel.total) \(viewModel.currency)"
    }
}
