//
//  ReelCollectionViewCell.swift
//  ReelsCreated
//
//  Created by Arpit iOS Dev. on 25/05/24.
//
import AVKit

class ReelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ReelCollectionViewCell"
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    
    private let usernameLable: UILabel = {
        let label  = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let captionLable: UILabel = {
        let label  = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let audioLable: UILabel = {
        let label  = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // Button
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "04"), for: .normal)
       
       return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlayerLayer()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlayerLayer() {
        playerLayer = AVPlayerLayer()
        playerLayer?.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer!)
    }
    
    private func setupUI() {
        // Add UI elements to the content view
        contentView.addSubview(usernameLable)
        contentView.addSubview(captionLable)
        contentView.addSubview(audioLable)
            
        contentView.addSubview(profileButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(moreButton)
        
        // Layout the UI elements
        let size = contentView.frame.size.width / 7
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height - 100
        
        moreButton.frame = CGRect(x: width-size, y: height-size+20, width: 40, height: 10)
        shareButton.frame = CGRect(x: width-size, y: height-(size*2), width: 40, height: 40)
        commentButton.frame = CGRect(x: width-size, y: height-(size*3)-10, width: 40, height: 40)
        likeButton.frame = CGRect(x: width-size, y: height-(size*4)-30, width: 40, height: 40)
        
        
        profileButton.frame = CGRect(x: 7, y: height-100, width: 40, height: 40)
        
        
        audioLable.frame = CGRect(x: 10, y: height, width: width-size-10, height: 50)
        captionLable.frame = CGRect(x: 10, y: height-60, width: width-size-10, height: 50)
        usernameLable.frame = CGRect(x: 55, y: height-105, width: width-size-10, height: 50)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
    
    func configure(with reel: Reel) {
        if let url = Bundle.main.url(forResource: reel.filename, withExtension: "mp4") {
            player = AVPlayer(url: url)
            playerLayer?.player = player
            player?.play()
        }
        
        usernameLable.text = reel.username
        captionLable.text = reel.description
        audioLable.text = reel.audioTrackname
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        player?.pause()
        player = nil
    }
}
