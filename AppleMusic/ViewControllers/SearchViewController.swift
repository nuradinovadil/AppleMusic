//
//  SearchViewController.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import UIKit

class SearchViewController: UIViewController {

    private let contentView = UIView()
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.text = "Поиск"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        return label
    }()
    
    private lazy var searchMusicBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск музыки"
        return searchBar
    }()
    
    private lazy var secondLabel: UILabel = {
       let label = UILabel()
        label.text = "Browse categories"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private lazy var searchCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.searchCollectionViewCell)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.searchCollectionViewCell, for: indexPath) as! SearchCollectionViewCell
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width * 0.46
        let height = view.frame.size.height * 0.17
        return CGSize(width: width, height: height)
    }
}

private extension SearchViewController {
    func setupViews() {
        view.addSubview(contentView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(searchMusicBar)
        contentView.addSubview(secondLabel)
        contentView.addSubview(searchCollectionView)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        searchMusicBar.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        searchMusicBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(searchMusicBar.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        searchCollectionView.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
