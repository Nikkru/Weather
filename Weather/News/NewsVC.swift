//
//  NewsVC.swift
//  Weather
//
//  Created by Nikolai Krusser on 30.11.2021.
//

import UIKit

class NewsVC: UIViewController {
    
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var likeItButton: UIButton!
    @IBOutlet weak var countLikeItLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var countShareLabel: UILabel!
    
    let news = News()
    var positionImage = 0
    var imageArray = ["Mickey M",
                      "mickey_1",
                      "mickey_2",
                      "mickey_3"]
    
    var countShare = 0
    var countLikeIt = 10
    var likeIt = false {
        willSet {
            countLikeItLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newImageView.isUserInteractionEnabled = true
        newImageView.isMultipleTouchEnabled = true
        
        newImageView.addGestureRecognizer(createSwipeGestureRecognizer(for: .left))
        newImageView.addGestureRecognizer(createSwipeGestureRecognizer(for: .right))
    }
    /// Description
    /// метод жеста "пролистывания" изображения
    /// - Parameters:
    ///  - direction:  направление
    ///  - свойство ( direction ) - направление
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizer.direction = direction
        
        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        var frame = newImageView.frame
        
        switch sender.direction {
        case .right:
            frame.origin.x += 40.0
//            if frame.maxX > view.bounds.maxX {
//                 frame.origin.x = view.bounds.width - frame.width
//             }
            if positionImage == 0 {
                positionImage = imageArray.count
            }
            positionImage -= 1
            newImageView.image = UIImage(named: imageArray[positionImage])
        case .left:
            frame.origin.x -= 50.0
//            frame.origin.x = max(0.0, frame.origin.x)
            positionImage += 1
            if positionImage == imageArray.count {
                positionImage = 0
            }
            newImageView.image = UIImage(named: imageArray[positionImage])
        default:
            break
        }
        UIView.animate(withDuration: 0.75) {
             self.newImageView.frame = frame
         }
    }

    @IBAction func likeItTappedBatton(_ sender: UIButton) {
        
        likeIt ? sender.shake() : sender.pulsate(reverse: false)
        likeIt = !likeIt
        guard likeIt != true else {
            countLikeIt += 1
            countLikeItLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            likeItButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            return countLikeItLabel.text = String(countLikeIt)
        }
        countLikeIt -= 1
        countLikeItLabel.text = String(countLikeIt)
        likeItButton.setImage(UIImage(systemName: "heart"), for: .normal)
        countLikeItLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        let rotation = CATransform3DMakeRotation(.pi, 0, 1, 0)
        self.countLikeItLabel.transform = CATransform3DGetAffineTransform(rotation)
        UIView.animate(withDuration: 0.2) {
            self.countLikeItLabel.transform = .identity
        }
    }
    
    @IBAction func shareTappedButton(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.countShareLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        } completion: { [weak self] _ in
            self?.countShareLabel.transform = .identity
        }
        sender.scale()
        countShare += 1
        countShareLabel.text = String(countShare)
    }
    
    @IBAction func commentTappedButton(_ sender: UIButton) {
        sender.shake()
    }
}
