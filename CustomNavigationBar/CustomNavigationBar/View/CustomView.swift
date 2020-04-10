//
//  CustomView.swift
//  CustomNavigationBar
//
//  Created by Cuong  Pham on 4/9/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

//
//  CustomView.swift
//  NavigationBar_Tabbar_SearchBar
//
//  Created by Cuong  Pham on 4/9/20.
//  Copyright © 2020 Cuong  Pham. All rights reserved.
//

import UIKit

protocol NavigationHandle : class {
    func navigationBarView(_ navigationView: CustomView, clickLeftMenu sender: AnyObject)
}

class CustomView: UIView {
    
    var delegate : NavigationHandle?
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your contact"
        label.sizeToFit()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var searchButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "search"), for: .normal)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var searchBar : UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Type here"
        search.barTintColor = .white
        search.showsCancelButton = true
        search.showsBookmarkButton = true
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .red
        autoLayout()
    }
    
    func autoLayout(){
        self.addSubview(titleLabel)
        self.addSubview(searchButton)
        self.addSubview(searchBar)
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
        searchButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        searchBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 45).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width).isActive = true
    }
    
    class func instanceFromNib(_ frame: CGRect) -> CustomView {
        let myNavigationBar = CustomView()
        myNavigationBar.frame = frame
        return myNavigationBar
    }
    
    @objc func onTapButton(_ sender : AnyObject){
        delegate?.navigationBarView(self, clickLeftMenu: sender)
    }
}
