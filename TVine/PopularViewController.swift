//
//  PopularViewController.swift
//  TVine
//
//  Created by Manuel Marcos Regalado on 13/02/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var popularPosts: [Post] = []
    @IBOutlet var popularPostsCollection: UICollectionView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadPopularPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularPosts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PopularPostsViewCell", forIndexPath: indexPath) as! PopularPostsViewCell
        cell.postUserNameLabel.text = popularPosts[indexPath.row].userName
        return cell
    }
    
    func loadPopularPosts() {
        DataManager.sharedInstance.collectionOfPopularPosts { dataResult in
            switch dataResult {
            case .Success(let posts):
                self.popularPosts = posts
                self.popularPostsCollection.reloadData()
            case .Failure:
                self.loadPopularPostsFailure()
            }
        }
    }
    
    func loadPopularPostsFailure() {
        let alert = UIAlertController(title: title, message: "There was an error trying to load posts", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.Default, handler:nil))
        presentViewController(alert, animated: true, completion: nil)
    }

}

