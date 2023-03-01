//
//  HomeCellDataModel.swift
//  FugleAssignment
//
//  Created by 薛宇振 on 2023/2/28.
//

import Foundation
import UIKit

class CategoryCellDataModel: RowViewModel {
    let text: String
    let image: UIImage
    
    init(text: String, image: UIImage) {
        self.text = text
        self.image = image
    }
}
