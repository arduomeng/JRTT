//
//  UIKit+Extension.swift
//  News
//
//  Created by Lin on 2018/3/20.
//  Copyright © 2018年 Lin. All rights reserved.
//

import Foundation
import UIKit



// MARK: - UIViewController Extension

// 协议扩展 基于协议编程
//遵守某个协议的类的对象调用协议声明的方法时，如果类本身没有提供实现，协议扩展提供的默认实现会被调用。

/**
    Self只是表示特定类型，并且只能用在协议中或者作为某个类的方法的返回值类型
    1.类型限定 where Self: UIViewController
    2.返回值  static func loadStoryboard() -> Self
 
    而self在实例方法中代指当前实例，在类方法中则代指当前类。
 */
protocol StoryboardLoadable {}
extension StoryboardLoadable where Self: UIViewController {
    /// 提供 加载方法
    /// 协议扩展提供的默认实现
    static func loadStoryboard() -> Self {
        return UIStoryboard(name: "\(self)", bundle: nil).instantiateViewController(withIdentifier: "\(self)") as! Self
    }
}

protocol NibLoadable {}
extension NibLoadable {
    static func loadViewFromNib() -> Self {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}

protocol RegisterCell {}
extension RegisterCell {
    // static 实现该协议的类拥有以下类属性
    static var identifier : String {return "\(self)"}
    static var nib : UINib? {return UINib.init(nibName: "\(self)", bundle: nil)}
}

// MARK: - UITableView Extension
// MARK: - Cell注册重用
extension UITableView {
    
    // T.Type 相当于OC中class类型 cell表示实现RegisterCell协议的类对象
    func cs_register<T: UITableViewCell>(cell: T.Type) where T: RegisterCell{
        if let nib = cell.nib{
            register(nib, forCellReuseIdentifier: cell.identifier)
        }else{
            register(cell, forCellReuseIdentifier: cell.identifier)
        }
    }
    func cs_dequeueReusableCell<T: UITableViewCell>(cell: T.Type) -> T where T: RegisterCell {
        return dequeueReusableCell(withIdentifier: cell.identifier) as! T
        
    }
}
// MARK: - UICollectionView Extension
// MARK: - Cell注册重用
extension UICollectionView {
    /// 注册 cell 的方法
    func cs_register<T: UICollectionViewCell>(cell: T.Type) where T: RegisterCell {
        if let nib = cell.nib { register(nib, forCellWithReuseIdentifier: cell.identifier) }
        else { register(cell, forCellWithReuseIdentifier: cell.identifier) }
    }
    
    /// 从缓存池池出队已经存在的 cell
    func cs_dequeueReusableCell<T: UICollectionViewCell>(cell: T.Type, indexPath: IndexPath) -> T where T: RegisterCell {
        
        return dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as! T
    }
    
    /// 注册头部
    func cs_registerSupplementaryHeaderView<T: UICollectionReusableView>(reusableView: T.Type) where T: RegisterCell {
        // T 遵守了 RegisterCellOrNib 协议，所以通过 T 就能取出 identifier 这个属性
        if let nib = T.nib {
            register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier)
        } else {
            register(reusableView, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier)
        }
    }
    
    /// 获取可重用的头部
    func cs_dequeueReusableSupplementaryHeaderView<T: UICollectionReusableView>(indexPath: IndexPath) -> T where T: RegisterCell {
        return dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}

// MARK: - UIView Extension
extension UIView {
    
    /// x
    var x: CGFloat {
        get { return frame.origin.x }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get { return frame.origin.y }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get { return frame.size.height }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get { return frame.size.width }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width  = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get { return frame.size }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size        = newValue
            frame                 = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get { return center.x }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x            = newValue
            center                  = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get { return center.y }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y            = newValue
            center                  = tempCenter;
        }
    }
}

// MARK: - UIColor
extension UIColor {
    
    //        self.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 背景灰色 f8f9f7
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
    
    /// 背景红色
    class func globalRedColor() -> UIColor {
        return UIColor(r: 196, g: 73, b: 67)
    }
    
    /// 字体蓝色
    class func blueFontColor() -> UIColor {
        return UIColor(r: 72, g: 100, b: 149)
    }
    
    /// 背景灰色 132
    class func grayColor132() -> UIColor {
        return UIColor(r: 132, g: 132, b: 132)
    }
    
    /// 背景灰色 232
    class func grayColor232() -> UIColor {
        return UIColor(r: 232, g: 232, b: 232)
    }
    
    /// 夜间字体背景灰色 113
    class func grayColor113() -> UIColor {
        return UIColor(r: 113, g: 113, b: 113)
    }
    
    /// 夜间背景灰色 37
    class func grayColor37() -> UIColor {
        return UIColor(r: 37, g: 37, b: 37)
    }
    
    /// 灰色 210
    class func grayColor210() -> UIColor {
        return UIColor(r: 210, g: 210, b: 210)
    }
    
}
