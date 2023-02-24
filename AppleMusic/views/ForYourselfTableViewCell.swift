//
//  ForYourselfTableViewCell.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 24/02/23.
//

import UIKit

class ForYourselfTableViewCell: UITableViewCell {

    private lazy var resentlyPlayedCollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(PlayedCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.playedCollectionViewCell)
            return collectionView
        }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        resentlyPlayedCollectionView.dataSource = self
        resentlyPlayedCollectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ForYourselfTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.playedCollectionViewCell, for: indexPath) as! PlayedCollectionViewCell
        return cell
    }
}

extension ForYourselfTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.frame.size.width * 0.4
        let height = contentView.frame.size.height * 0.22
        return CGSize(width: width, height: height)
    }
}

private extension ForYourselfTableViewCell {
    func setupViews() {
        contentView.addSubview(resentlyPlayedCollectionView)
    }
    func setupConstraints() {
        resentlyPlayedCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
