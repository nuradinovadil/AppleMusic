//
//  ViewController.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import UIKit
import SnapKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedColor = UIColor(red: 248/255, green: 45/255, blue: 72/255, alpha: 1)
        
        let vc1 = UINavigationController(rootViewController: ListenViewController())
        let vc2 = UINavigationController(rootViewController: ReviewViewController())
        let vc3 = UINavigationController(rootViewController: RadioViewController())
        let vc4 = UINavigationController(rootViewController: AlbumViewController())
        let vc5 = UINavigationController(rootViewController: SearchViewController())
        

        vc1.tabBarItem.image = UIImage(systemName: "play.circle.fill")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "play.circle.fill")?.withTintColor(.init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)
        vc2.tabBarItem.image = UIImage(systemName: "square.grid.2x2.fill")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "square.grid.2x2.fill")?.withTintColor(.init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)
        vc3.tabBarItem.image = UIImage(systemName: "dot.radiowaves.left.and.right")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "dot.radiowaves.left.and.right")?.withTintColor(.init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)
        vc4.tabBarItem.image = UIImage(systemName: "square.stack")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "square.stack.fill")?.withTintColor(.init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)
        vc5.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc5.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass")?.withTintColor(.init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1), renderingMode: .alwaysOriginal)
        
        vc1.title = "Слушать"
        vc1.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        vc2.title = "Обзор"
        vc2.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        vc3.title = "Радио"
        vc3.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        vc4.title = "Медиатека"
        vc4.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        vc5.title = "Поиск"
        vc5.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)

    }
}


