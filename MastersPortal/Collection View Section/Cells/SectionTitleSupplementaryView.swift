//
//  SectionTitleSupplementaryView.swift
//  MastersPortal
//
//  Created by HASAN CAN on 11/5/21.
//

import UIKit

class SectionTitleSupplementaryView: UICollectionReusableView {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let button = UIButton(type: .system)
    private let inset = CGFloat(20)

    var titleButtonAction: (() -> Void)?

    private let outerStackView = UIStackView()
    private let labelStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedinit()
    }
    required init?(coder: NSCoder) {
        fatalError("Instantiation from Storyboard not supported")
    }
}

extension SectionTitleSupplementaryView: ConfigurableCell {
    public func configure(_ data: SectionHeaderItem) {
        titleLabel.text = data.title
        if let subtitle = data.subtitle {
            subtitleLabel.text = subtitle
        }

        self.button.isHidden = !data.visibleButton
    }

    func sharedinit() {
        addSubview(outerStackView)
        outerStackView.axis = .horizontal
        outerStackView.alignment = .fill
        outerStackView.distribution = .equalSpacing
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            outerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: inset),
            outerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -inset)
        ])

        labelStackView.axis = .vertical
        labelStackView.translatesAutoresizingMaskIntoConstraints = true
        outerStackView.addArrangedSubview(labelStackView)

        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .heavy)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1

        labelStackView.addArrangedSubview(titleLabel)

        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 1
        labelStackView.addArrangedSubview(subtitleLabel)

        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        button.setTitleColor(Asset.Colors.primaryColor.color, for: .normal)
        self.button.addTarget(self, action: #selector(getButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        outerStackView.addArrangedSubview(button)
    }

    @IBAction func getButtonTapped(_ sender: UIButton) {
        titleButtonAction?()
    }
}
