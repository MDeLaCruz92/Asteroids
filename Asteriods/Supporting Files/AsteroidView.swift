//
//  AsteriodView.swift
//  Asteriods
//
//  Created by Michael De La Cruz on 7/19/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class AsteroidView: UIImageView {

    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        image = UIImage(named: "asteroid\((arc4random()%9)+1)")
        frame.size = image?.size ?? CGSize.zero
    }

}
