import UIKit

class FontListFontCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var name: String! {
        didSet {
            nameLabel.text = name
        }
    }
}
