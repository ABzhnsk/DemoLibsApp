//
//  NYTPhotoViewController.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 26.01.2024.
//


import UIKit
import SDWebImage
import NYTPhotoViewer


final class NYTPhotoViewerViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none

        let imageURL = URL(string: "https://cataas.com/cat")!

        SDWebImageManager.shared.loadImage(with: imageURL, progress: nil) { 
            image, _, _, _, _, url in
            guard let image, let url, url == imageURL else { return }
            self.image = image
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageCell()
        cell.image = image
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nytPhotosViewController = NYTPhotosViewController(dataSource: self)
        self.present(nytPhotosViewController, animated: true)
    }

    private var image: UIImage?
} // class NYTPhotoViewerViewController


extension NYTPhotoViewerViewController: NYTPhotoViewerDataSource {
    var numberOfPhotos: NSNumber? {
        1
    }
    
    func index(of photo: NYTPhoto) -> Int {
        1
    }
    
    func photo(at photoIndex: Int) -> NYTPhoto? {
        let photoBox = PhotoBox()
        photoBox.image = image
        photoBox.placeholderImage = UIImage(systemName: "camera")
        return photoBox
    }
} // extension NYTPhotoViewerViewController


private extension NYTPhotoViewerViewController {
    /// NYTPhoto
    final class PhotoBox: NSObject, NYTPhoto {
        var image: UIImage?
        var imageData: Data?
        var placeholderImage: UIImage?
        var attributedCaptionTitle: NSAttributedString?
        var attributedCaptionSummary: NSAttributedString?
        var attributedCaptionCredit: NSAttributedString?
    } // class PhotoBox
} // extension NYTPhotoViewerViewController
