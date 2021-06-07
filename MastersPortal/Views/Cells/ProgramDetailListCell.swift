//
//  ProgramDetailListCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 8/6/21.
//

import UIKit

class ProgramDetailListCell: UITableViewCell, ConfigurableCell {
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var programNameLabel: UILabel!
    @IBOutlet var tutionContainerView: UIView!
    @IBOutlet var deadlineContainerView: UIView!
    @IBOutlet var tutionLabel: UILabel!
    @IBOutlet var deadlineLabel: UILabel!
    @IBOutlet var universityNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        tutionContainerView.layer.cornerRadius = 13
        deadlineContainerView.layer.cornerRadius = 13
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ viewModel: ProgramDetailDataContainer) {
        countryLabel.text = viewModel.countryName
        programNameLabel.text = viewModel.programName
        universityNameLabel.text = viewModel.universityName
        tutionLabel.text = viewModel.tution
        deadlineLabel.text = formatTimestamp(viewModel.deadline)
    }
}
