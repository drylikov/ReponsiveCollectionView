//
//  MainListCollectionViewController.swift
//  CollectionViewResponsiveLayout
//
//  Created by Alfian Losari on 2/8/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

private let listReuseIdentifier = "ListCell"
private let gridReuseIdentifier = "GridCell"

class MainListCollectionViewController: UICollectionViewController {
    
    private let movies = Movie.dummyMovies
    private var layoutOption: LayoutOption = .list {
        didSet {
            setupLayout(with: view.bounds.size)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBarItem()
        setupLayout(with: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupLayout(with: size)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupLayout(with: view.bounds.size)
    }
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "MovieLayoutListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: listReuseIdentifier)
        collectionView.register(UINib(nibName: "MovieLayoutGridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: gridReuseIdentifier)
    }
    
    private func setupLayout(with containerSize: CGSize) {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        switch layoutOption {
        case .list:
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.sectionInset = UIEdgeInsets(top: 8.0, left: 0, bottom: 8.0, right: 0)
            
            if traitCollection.horizontalSizeClass == .regular {
                let minItemWidth: CGFloat = 300
                let numberOfCell = containerSize.width / minItemWidth
                let width = floor((numberOfCell / floor(numberOfCell)) * minItemWidth)
                flowLayout.itemSize = CGSize(width: width, height: 91)
            } else {
                flowLayout.itemSize = CGSize(width: containerSize.width, height: 91)
            }
            
        case .largeGrid, .smallGrid:
            let minItemWidth: CGFloat
            if layoutOption == .smallGrid {
                minItemWidth = 106
            } else {
                minItemWidth = 160
            }
            
            let numberOfCell = containerSize.width / minItemWidth
            let width = floor((numberOfCell / floor(numberOfCell)) * minItemWidth)
            let height = ceil(width * (4.0 / 3.0))

            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.itemSize = CGSize(width: width, height: height)
            flowLayout.sectionInset = .zero
        }
        
        collectionView.reloadData()
    }
    
    private func setupNavigationBarItem() {
        let barButtonItem = UIBarButtonItem(title: "Layout", style: .plain, target: self, action: #selector(layoutTapped(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func layoutTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Select Layout", message: nil, preferredStyle: .actionSheet)
        alertController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        alertController.addAction(UIAlertAction(title: "List", style: .default, handler: { (_) in
            self.layoutOption = .list
        }))
        
        alertController.addAction(UIAlertAction(title: "Large Grid", style: .default, handler: { (_) in
            self.layoutOption = .largeGrid
        }))
        
        alertController.addAction(UIAlertAction(title: "Small Grid", style: .default, handler: { (_) in
            self.layoutOption = .smallGrid
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

extension MainListCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch layoutOption {
        case .list:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listReuseIdentifier, for: indexPath) as! MovieLayoutListCollectionViewCell
            let movie = movies[indexPath.item]
            cell.setup(with: movie)
            return cell
            
        case .largeGrid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gridReuseIdentifier, for: indexPath) as! MovieLayoutGridCollectionViewCell
            let movie = movies[indexPath.item]
            cell.setup(with: movie)
            return cell
            
        case .smallGrid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gridReuseIdentifier, for: indexPath) as! MovieLayoutGridCollectionViewCell
            let movie = movies[indexPath.item]
            cell.setup(with: movie)
            return cell
        }
    }
}
