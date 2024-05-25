//
//  ViewController.swift
//  ReelsCreated
//
//  Created by Arpit iOS Dev. on 25/05/24.
//
struct Reel {
    let filename: String
    let username: String
    let description: String
    let audioTrackname: String
}

import UIKit

class ReelsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private var reels = [Reel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadReels()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(ReelCollectionViewCell.self, forCellWithReuseIdentifier: ReelCollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    
    private func loadReels() {
        reels = [
            Reel(filename: "video", username: "@arpitdhameliya", description: "This is the first video description", audioTrackname: "Original Video song"),
            Reel(filename: "video1", username: "@hirenkanani", description: "This is the second video description", audioTrackname: "Original Video song"),
            Reel(filename: "video2", username: "@harshil", description: "This is the Third video description", audioTrackname: "Original Video song"),
            Reel(filename: "video3", username: "@harshad", description: "This is the Four video description", audioTrackname: "Original Video song"),
            Reel(filename: "video4", username: "@vrushbhbhai", description: "This is the Five video description", audioTrackname: "Original Video song"),
            Reel(filename: "video5", username: "@darshandhameliya", description: "This is the Six video description", audioTrackname: "Original Video song"),
            Reel(filename: "video6", username: "@neelsutariya", description: "This is the Seven video description", audioTrackname: "Original Video song"),
            Reel(filename: "video7", username: "@veddhameliya", description: "This is the Eight video description", audioTrackname: "Original Video song"),
            Reel(filename: "video8", username: "@divyeshdhameliya", description: "This is the nine video description", audioTrackname: "Original Video song"),
            Reel(filename: "video3", username: "@Harshkheni", description: "This is the Ten video description", audioTrackname: "Original Video song"),
        ]
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReelCollectionViewCell.identifier, for: indexPath) as! ReelCollectionViewCell
        cell.configure(with: reels[indexPath.row])
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
}
