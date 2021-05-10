import UIKit

final class SectionTitleCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var navigationLabel: UILabel!

    var showsNavigationLabel = true {
        didSet {
            navigationLabel.isHidden = !showsNavigationLabel
        }
    }

    func configure(_ data: SectionTitleItem) {
        titleLabel.text = data.title
        navigationLabel.text = data.navigationTitle
        showsNavigationLabel = data.navigationTitle != nil
    }
}
