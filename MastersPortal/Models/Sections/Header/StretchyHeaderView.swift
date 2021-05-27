//
//  StretchyHeaderView.swift
//  MastersPortal
//
//  Created by HASAN CAN on 15/5/21.
//

import UIKit

class StretchyHeaderView: UICollectionReusableView, ConfigurableCell {
    lazy var animator: UIViewPropertyAnimator = {
        let animator = UIViewPropertyAnimator(duration: 4.0, curve: .easeInOut)

        animator.addAnimations {
            self.visualEffectView.alpha = 1
        }

        return animator
    }()

    lazy var visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.alpha = 0
        return visualEffectView
    }()

    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setViewConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func addSubviews() {
        addSubview(imageView)
        addSubview(visualEffectView)
    }

    private func setViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func configure(_ viewModel: UIImage) {
        imageView.image = viewModel
    }
}
