//
//  NewYearCardCell.swift
//  News
//
//  Created by 杨蒙 on 2018/2/10.
//  Copyright © 2018年 hrscy. All rights reserved.
//

import UIKit

class NewYearCardCell: UITableViewCell, RegisterCell {
   
    
    @IBOutlet weak var winnerCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// 点击了生肖卡
    var didSelectCollectionItem: ((_ shengxiao: Shengxiao)->())?
    /// 生肖数组
    var destCards = [Shengxiao]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.collectionViewLayout = ShengxiaoCollectionViewFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        // pilst 文件的路径
        let path = Bundle.main.path(forResource: "shengxiao", ofType: "plist")
        // plist 文件中的数据
        let cards = NSArray(contentsOfFile: path!) as! [Any]
        
        destCards = cards.flatMap({ Shengxiao.deserialize(from: $0 as? [String: Any]) })
        collectionView.cs_register(cell: ShengxiaoCell.self)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewYearCardCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return destCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cs_dequeueReusableCell(cell: ShengxiaoCell.self, indexPath: indexPath) as ShengxiaoCell
        cell.shengxiao = destCards[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCollectionItem?(destCards[indexPath.item])
    }
}

class ShengxiaoCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        let itemWidth: CGFloat = (collectionView!.width - 12) / 7
        itemSize = CGSize(width: itemWidth, height: 60)
        minimumLineSpacing = 2
        minimumInteritemSpacing = 2
    }
    
}
