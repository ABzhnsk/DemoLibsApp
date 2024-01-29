//
//  PreviewVideoCell.swift
//  MediaApp
//
//  Created by Anna Buzhinskaya on 29.01.2024.
//


import UIKit


final class PreviewVideoCell: UITableViewCell {
    var image: UIImage? { didSet {
        previewImageView.image = nil
        if let image {
            previewImageView.image = image
        }
    }}

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(previewImageView)
        previewImageView.anchor(top: contentView.topAnchor,
                                    left: contentView.layoutMarginsGuide.leftAnchor,
                                    bottom: contentView.bottomAnchor,
                                    right: contentView.layoutMarginsGuide.rightAnchor)
        let ratioConstraint = previewImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: CGFloat(9)/16)
        ratioConstraint.priority = .defaultHigh
        ratioConstraint.isActive = true
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private lazy var previewImageView = UIImageView()
} // class PreviewVideoCell
