import UIKit

final class ListCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 20
    }

    func configure(_ data: ListCellItem) {
        titleLabel.text = data.title
    }
}
