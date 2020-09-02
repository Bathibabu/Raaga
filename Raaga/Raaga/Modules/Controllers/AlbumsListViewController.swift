//
//  AlbumsListViewController.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit
import Lottie

class AlbumsListViewController: UIViewController,Storyboarded {

    @IBOutlet weak var albumsCollectionView: UICollectionView!
    weak var albumsListCoordinator: AlbumsListCoordinator?
    var loaderAnimationView:AnimationView?
    var albumVM: AlbumsListViewModel?
    var cartBtn: UIBarButtonItem?
    var searchText = "All"
    private let spacing:CGFloat = 4.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        showLoader()
        
    }
    
    func setUpUI() {
        
        cartBtn = UIBarButtonItem(image: UIImage(named: "cart"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(showCart))
        navigationItem.rightBarButtonItem = cartBtn
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.albumsCollectionView?.collectionViewLayout = layout
    }
    
    func showLoader() {
        
        loaderAnimationView = AnimationViewCreator.getAnimateView(frame:AnimationViewCreator.getFrame() ,animation: Animations.loader.getValue(), loopMode: .loop)
        self.view.addSubview(loaderAnimationView!)
        loaderAnimationView?.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        albumVM?.getAlbums(searchText: searchText) {
            
            DispatchQueue.main.async {
                
                self.loaderAnimationView?.removeFromSuperview()
                self.albumsCollectionView.reloadData()
            }
        }
    }
    
    @objc func showCart() {
        
        self.albumsListCoordinator?.parentCoordinator?.albumSearchNavigation()
    }
}


extension AlbumsListViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.albumVM?.getNumberOfAlbums() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let albumCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCollectionViewCell", for: indexPath) as? AlbumCollectionViewCell else { return UICollectionViewCell() }
        guard let album = self.albumVM?.getAlbumWithIndex(index: indexPath) else { return albumCell }
        albumCell.configureWith(album: album)
        return albumCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 4
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
        
        if let collection = self.albumsCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let album = self.albumVM?.getAlbumWithIndex(index: indexPath) else { return }
        self.albumsListCoordinator?.parentCoordinator?.albumPreviewNavigation(album: album)
    }
}

