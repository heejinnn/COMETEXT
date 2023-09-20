
import UIKit

class MyInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customBtn: UIButton!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configure(withTitle title: String) {
        customBtn.setTitle(title, for: .normal)
    }

}
