

import UIKit

class NewBookInfoCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var newBookImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10.0 // 원하는 둥근 정도 값으로 수정하세요.
      
    }
    
    func configure(_ bookStore: newBookInfo){
        newBookImg?.image = bookStore.imgName
    }

}

