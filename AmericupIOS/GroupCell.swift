//
//  GroupCell.swift
//  AmericupIOS
//
//  Created by German Rivera P on 7/23/19.
//  Copyright © 2019 Santiago Muñoz. All rights reserved.
//

import Foundation
import UIKit

class GroupCell:UITableViewCell {
    var t1 : String?
    var t2 : String?
    var fl1 : UIImage?
    var fl2 : UIImage?
    
    
    var t1View : UITextView = {
        var textV = UITextView()
        textV.translatesAutoresizingMaskIntoConstraints = false
        return textV
    }()
    var t2View : UITextView = {
        var textV = UITextView()
        textV.translatesAutoresizingMaskIntoConstraints = false
        return textV
    }()
  
    var fl1View : UIImageView = {
        var imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }()
    var fl2View : UIImageView = {
        var imageV2 = UIImageView()
        imageV2.translatesAutoresizingMaskIntoConstraints = false
        return imageV2
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(fl1View)
        self.addSubview(t1View)
        self.addSubview(t2View)
        self.addSubview(fl2View)
        
        fl1View.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        fl1View.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        fl1View.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        fl1View.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fl1View.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        t1View.leftAnchor.constraint(equalTo: self.fl1View.rightAnchor).isActive = true
        //t1View.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        t1View.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        t1View.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        t1View.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        t2View.leftAnchor.constraint(equalTo: self.t1View.rightAnchor).isActive = true
        //t2View.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        t2View.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        t2View.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        t2View.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        //fl2View.leftAnchor.constraint(equalTo: self.t2View.rightAnchor).isActive = true
        fl2View.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        fl2View.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        fl2View.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        fl2View.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fl2View.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        fl1View.image = fl1
        t1View.text = t1
        t2View.text = t2
        fl2View.image = fl2
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
}
