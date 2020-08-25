//
//  Created by Giancarlo Pacheco on 8/21/20.
//

import UIKit

class WACButton: UIButton {

    override open var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? UIColor.primaryButton : UIColor.gray
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.blue : UIColor.primaryButton
        }
    }
}