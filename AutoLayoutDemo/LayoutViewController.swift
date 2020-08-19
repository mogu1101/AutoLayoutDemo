//
//  LayoutViewController.swift
//  AutoLayoutDemo
//
//  Created by Liujinjun on 1010/8/18.
//  Copyright © 1010 Liujinjun. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [ConstraintView(), AnchorView(), VFLView(), SnapkitView()])
        stackView.axis = .vertical      // 主轴方向
        stackView.spacing = 10          // 间距
        stackView.distribution = .fill  // 主轴上的分布
        stackView.alignment = .fill     // 正交轴上的对齐方式

        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(80)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }

//        let view1 = View1()
//        view.addSubview(view1)
//        view1.translatesAutoresizingMaskIntoConstraints = false
//
//        let view2 = View2()
//        view.addSubview(view2)
//        view2.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addConstraints([
//            NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50),
//            NSLayoutConstraint(item: view1, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16),
//            NSLayoutConstraint(item: view1, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
//        ])
//
//        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10).isActive = true
//        view2.leftAnchor.constraint(equalTo: view1.leftAnchor).isActive = true
//        view2.rightAnchor.constraint(equalTo: view1.rightAnchor).isActive = true
    }

}

class AvatarView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 50)
    }

    override func setNeedsLayout() {
        debugPrint("-----------------setNeedsLayout")
        super.setNeedsLayout()
    }
}

class ConstraintView: UIView {
    let avatarView = AvatarView()
    var width: NSLayoutConstraint?

    @objc func big() {
        width?.constant += 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green.withAlphaComponent(0.1)
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(big)))
        let nameLabel = UILabel()
        nameLabel.text = "NSLayoutConstraint"
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        addConstraints([
            NSLayoutConstraint(item: avatarView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: avatarView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: detailLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: avatarView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: detailLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: avatarView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: avatarView, attribute: .right, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: detailLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: detailLabel, attribute: .left, relatedBy: .equal, toItem: nameLabel, attribute: .left, multiplier: 1, constant: 0)
        ])
        width = NSLayoutConstraint(item: avatarView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        guard let width = width else { return }
        avatarView.addConstraints([
            width,
            NSLayoutConstraint(item: avatarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        ])
        avatarView.setContentCompressionResistancePriority(.required, for: .horizontal)
        avatarView.setContentHuggingPriority(.required, for: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AnchorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green.withAlphaComponent(0.1)
        let avatarView = AvatarView()
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        let nameLabel = UILabel()
        nameLabel.text = "NSLayoutAnchor"
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        avatarView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -10).isActive = true

        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        detailLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
        detailLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VFLView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green.withAlphaComponent(0.1)
        let avatarView = AvatarView()
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        let nameLabel = UILabel()
        nameLabel.text = "VFL"
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        let view = UIView()

        let views = ["avatarView": avatarView, "nameLabel": nameLabel, "detailLabel": detailLabel]
        let metrics = ["margin": 10, "width": 80]
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-margin-[avatarView(width)]-margin-[nameLabel]->=margin-|",
                options: .directionLeftToRight,
                metrics: metrics,
                views: views
            )
        )
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-margin-[avatarView(width)]-margin-[detailLabel]->=margin-|",
                options: .directionLeftToRight,
                metrics: metrics,
                views: views
            )
        )
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-margin-[avatarView(width)]->=margin-|",
                options: .alignAllLeft,
                metrics: metrics,
                views: views
            )
        )
        addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-margin-[nameLabel]-margin-[detailLabel]->=margin-|",
                options: .alignAllLeft,
                metrics: metrics,
                views: views
            )
        )

//        avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        avatarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
//        avatarView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
//        avatarView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        avatarView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//
//        nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor).isActive = true
//        nameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 10).isActive = true
//        nameLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -10).isActive = true
//
//        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
//        detailLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
//        detailLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
//        detailLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnapkitView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green.withAlphaComponent(0.1)
        let avatarView = AvatarView()
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        let nameLabel = UILabel()
        nameLabel.text = "SnapKit"
        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)

        avatarView.snp.makeConstraints { (make) in
            make.top.left.equalTo(10)
            make.bottom.lessThanOrEqualTo(-10)
            make.width.height.equalTo(80)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarView)
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.right.lessThanOrEqualTo(-10)
        }

        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(nameLabel)
            make.bottom.right.lessThanOrEqualTo(-10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
