//
//  ImageCell.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 26.01.2024.
//

import UIKit


final class ImageCell: UITableViewCell {
    var image: UIImage? { didSet {
        screensaverImageView.image = nil
        if let image {
            screensaverImageView.image = image
        }
    }}

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(screensaverImageView)
        screensaverImageView.anchor(top: contentView.topAnchor,
                                    left: contentView.layoutMarginsGuide.leftAnchor,
                                    bottom: contentView.bottomAnchor,
                                    right: contentView.layoutMarginsGuide.rightAnchor)
        let ratioConstraint = screensaverImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: CGFloat(9)/16)
        ratioConstraint.priority = .defaultHigh
        ratioConstraint.isActive = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private lazy var screensaverImageView = UIImageView()
} // class ImageCell
