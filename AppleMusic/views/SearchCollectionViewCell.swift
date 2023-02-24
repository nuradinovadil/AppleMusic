//
//  SearchCollectionViewCell.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 24/02/23.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hits")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchCollectionViewCell {
    func setupViews() {
        contentView.addSubview(firstImageView)
    }
    func setupConstraints() {
        firstImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
