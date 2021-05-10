import UIKit

final class ExtraLargeCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet private var captionLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var thumbnailView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.layer.cornerRadius = 13
    }

    func configure(_ data: ExtraLargeCellItem) {
        captionLabel.text = data.caption
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        thumbnailImageView.image = data.thumbnail
    }
}
