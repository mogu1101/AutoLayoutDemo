//
//  ViewController.swift
//  AutoLayoutDemo
//
//  Created by Liujinjun on 2020/8/16.
//  Copyright © 2020 Liujinjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = View1()
        view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false

        let view2 = View2()
        view.addSubview(view2)
        view2.translatesAutoresizingMaskIntoConstraints = false

        view.addConstraints([
            NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: view1, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: view1, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        ])

        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20).isActive = true
        view2.leftAnchor.constraint(equalTo: view1.leftAnchor).isActive = true
        view2.rightAnchor.constraint(equalTo: view1.rightAnchor).isActive = true
    }
}

class AvatarView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 50)
    }
}

class View1: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        let avatarView = AvatarView()
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        let nameLabel = UILabel()
        nameLabel.text = "NSLayoutConstraint"
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳绥东附件搜集佛对数据佛的ID积分ID积分ID计费点"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        addConstraints([
            NSLayoutConstraint(item: avatarView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: avatarView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: detailLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: avatarView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: detailLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: avatarView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: avatarView, attribute: .right, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: detailLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: detailLabel, attribute: .left, relatedBy: .equal, toItem: nameLabel, attribute: .left, multiplier: 1, constant: 0)
        ])
        avatarView.addConstraints([
            NSLayoutConstraint(item: avatarView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: avatarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        ])
        avatarView.setContentCompressionResistancePriority(.required, for: .horizontal)
        avatarView.setContentHuggingPriority(.required, for: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class View2: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        let avatarView = AvatarView()
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        let nameLabel = UILabel()
        nameLabel.text = "NSLayoutAnchor"
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳绥东附件搜集佛对数据佛的ID积分ID积分ID计费点"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        avatarView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 20).isActive = true
        nameLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -20).isActive = true

        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        detailLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20).isActive = true
        detailLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -20).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
