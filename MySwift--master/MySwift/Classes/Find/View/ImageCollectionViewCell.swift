//
//  ImageCollectionViewCell.swift
//  MySwift
//
//  Created by yinhe on 2019/4/17.
//  Copyright © 2019 yinhe. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit
class ImageCollectionViewCell: UICollectionViewCell {
    public var btnClickBlock:( ()->() )?
    var imageView:UIImageView?
    var titleLab:UILabel?
    var descLab:UILabel?
    var hotLab:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(frame: frame)
        self.contentView.backgroundColor  = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(frame:CGRect){
        
        titleLab = UILabel()
        titleLab?.textColor = .black
        titleLab?.font = SystemFont(font: 14)
        titleLab?.numberOfLines = 2;
        titleLab?.textAlignment = NSTextAlignment.left
        
        descLab = UILabel()
        descLab?.font = SystemFont(font: 14)
        descLab?.numberOfLines = 3
        descLab?.textColor = .gray
        descLab?.textAlignment = .left
        
        hotLab = UILabel()
        hotLab?.textColor = .black
        hotLab?.font = SystemFont(font: 10)
        hotLab?.textAlignment = .right
        
        self.contentView .addSubview(titleLab!)
        titleLab?.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(2)
        }
        
        self.contentView .addSubview(descLab!)
        descLab?.snp.makeConstraints{ (make) in
            make.left.equalTo(5)
//            make.left.equalTo(titleLab?.snp_left!)
            make.right.equalToSuperview().offset(-5)
            make.top.equalTo(titleLab!.snp_bottom)
            
        }
        
        self.contentView .addSubview(hotLab!)
        
        hotLab?.snp.makeConstraints({ make in
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-5)
        })
        
        
//        let itemCountInRow:CGFloat = 3
//        let margin:CGFloat = 10
//        let itemW = (SCREENWIDTH - (itemCountInRow+1)*margin) / itemCountInRow
//        let itemH = itemW * 1.3
//
//        imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: itemW, height: itemH))
//        imageView?.backgroundColor = UIColor.green
      imageView = UIImageView()
        imageView?.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewAction))
//        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewAction))
        imageView?.addGestureRecognizer(tap)
        
        imageView?.contentMode = .scaleToFill
        self.contentView.addSubview(imageView!)
        imageView?.snp.makeConstraints({ make in
//            make.centerX.equalTo(self.contentView)
            make.left.equalTo(1)
            make.bottom.equalTo(-1)
            make.width.height.equalTo(60)
        })
        
        
        
    }
    @objc private func imageViewAction(){
        print("图片点击-------------")
        btnClickBlock!()
    }
    func cellForModel(model:HomeModel?){
        
        titleLab?.text = model?.title
        descLab?.text = model?.desc
        hotLab?.text = model?.hotScore
        
        //        let imageStr = model?.images?["small"]
        let imageStr = model?.picurl
        let imageUrl = URL(string: imageStr as! String)
//        let imageUrl = URL(string: imageStr!)
        imageView?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "startImg"), options:.lowPriority , completed: nil)
        
       
        
        
    }
    
}
