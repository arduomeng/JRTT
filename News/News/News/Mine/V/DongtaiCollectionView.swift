//
//  DongtaiCollectionView.swift
//  News
//
//  Created by 杨蒙 on 2017/12/10.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

class DongtaiCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, NibLoadable, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var didSelect: ((_ selectedIndex: Int)->())?
    /// 是否发布了小视频
    var isPostSmallVideo = false
    /// 是否是动态详情
    var isDongtaiDetail = false

    var isWeitoutiao = false

    var thumbImages = [ThumbImage]() {
        didSet {
            reloadData()
        }
    }

    var largeImages = [LargeImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        dataSource = self
        backgroundColor = .clear
        collectionViewLayout = DongtaiCollectionViewFlowLayout()
        cs_register(cell: DongtaiCollectionViewCell.self)
        isScrollEnabled = false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thumbImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cs_dequeueReusableCell(cell: DongtaiCollectionViewCell.self, indexPath: indexPath) as DongtaiCollectionViewCell
        cell.thumbImage = thumbImages[indexPath.item]
        cell.isPostSmallVideo = isPostSmallVideo
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return isDongtaiDetail ? Calculate.detailCollectionViewCellSize(thumbImages) : Calculate.collectionViewCellSize(thumbImages.count)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isWeitoutiao { didSelect?(indexPath.item); return }
//        let previewBigImageVC = PreviewDongtaiBigImageController()
//        previewBigImageVC.images = largeImages
//        previewBigImageVC.selectedIndex = indexPath.item
//        UIApplication.shared.keyWindow?.rootViewController?.present(previewBigImageVC, animated: false, completion: nil)
    }
}

class DongtaiCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: image3Width, height: image3Width)
        // 设置行间距最小值
        minimumLineSpacing = 5
        //  列间距会自动计算
        minimumInteritemSpacing = 0
    }
}

