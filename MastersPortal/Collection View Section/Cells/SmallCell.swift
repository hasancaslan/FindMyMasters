import UIKit

final class SmallCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var actionButton: UIView!
    @IBOutlet weak var actionButtonLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 12
        actionButton.layer.cornerRadius = 15
    }

    func configure(_ data: SmallCellItem) {
        actionButtonLabel.text = data.buttonTitle
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        iconImageView.image = data.icon
    }
}
