//
//  ImageCell.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 26.01.2024.
//


import UIKit


final class ImageCell: UITableViewCell {
    var image: UIImage? { didSet {
        pictureView.image = nil
        if let image {
            pictureView.image = image
        }
    }}

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        pictureView.contentMode = .scaleAspectFill
        pictureView.clipsToBounds = true
        contentView.addSubview(pictureView)
        pictureView.anchor(top: contentView.topAnchor,
                           left: contentView.layoutMarginsGuide.leftAnchor,
                           bottom: contentView.bottomAnchor,
                           right: contentView.layoutMarginsGuide.rightAnchor)
        pictureView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private lazy var pictureView = UIImageView()
} // class ImageCell
