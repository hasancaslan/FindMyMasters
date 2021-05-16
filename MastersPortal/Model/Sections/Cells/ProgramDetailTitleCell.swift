//
//  ProgramDetailTitleCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import UIKit

class ProgramDetailTitleCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet var universityLabel: UILabel!
    @IBOutlet var programNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ viewModel: Program) {
        universityLabel.text = viewModel.university.capitalized
        programNameLabel.text = viewModel.name
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
