//
//  ThemeControl.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/26.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SwiftTheme

fileprivate let lastThemeIndexKey = "lastedThemeIndex"

enum ThemeControlType: Int {
    case White = 0
    case Night = 1
    
    static var current: ThemeControlType { return ThemeControlType(rawValue: ThemeManager.currentThemeIndex)! }
    static var before = ThemeControlType.White
    
    // MARK: - Switch Theme
    
    static func switchTo(theme: ThemeControlType) {
        before = current
        ThemeManager.setTheme(index: theme.rawValue)
    }
    
    static func switchToNext() {
        var next = ThemeManager.currentThemeIndex + 1
        if next > 2 { next = 0 } // cycle and without Night
        switchTo(theme: ThemeControlType(rawValue: next)!)
    }
    
    // MARK: - Switch Night
    
    static func switchNight(isToNight: Bool) {
        switchTo(theme: isToNight ? .Night : before)
    }
    
    static func isNight() -> Bool {
        return current == .Night
    }
    
    // MARK: - Save & Restore
    
    static func restoreLastTheme() {
        switchTo(theme: ThemeControlType(rawValue: UserDefaults.standard.integer(forKey: lastThemeIndexKey))!)
    }
    
    static func saveLastTheme() {
        UserDefaults.standard.set(ThemeManager.currentThemeIndex, forKey: lastThemeIndexKey)
    }
    
}

class ThemeControl: NSObject {
    
    static var themeControlManager = ThemeControl()
    fileprivate override init() {}
    
    /// 修改主题
    public func changeTheme() {
        // status bar
        UIApplication.shared.theme_setStatusBarStyle([.default, .lightContent], animated: true)
        
        // navigation bar
        let navigationBar = UINavigationBar.appearance()
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        let titleAttributes: [[NSAttributedStringKey : NSObject]] = globalBarTextColors.map { hexString in
            return [
                NSAttributedStringKey.foregroundColor: UIColor(rgba: hexString),
                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16),
                NSAttributedStringKey.shadow: shadow
            ]
        }
        
        navigationBar.theme_tintColor = globalBarTextColorPicker
        navigationBar.theme_barTintColor = globalBarTintColorPicker
        navigationBar.theme_titleTextAttributes = ThemeDictionaryPicker.pickerWithDicts(titleAttributes)
        
        // tab bar
        let tabBar = UITabBar.appearance()
        tabBar.theme_tintColor = globalBarTextColorPicker
        tabBar.theme_barTintColor = globalBarTintColorPicker
    }
}
