//
//  LayoutViewController.swift
//  AutoLayoutDemo
//
//  Created by Liujinjun on 2020/8/18.
//  Copyright © 2020 Liujinjun. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let scrollView = UIScrollView()

        let stackView = UIStackView(arrangedSubviews: [ConstraintView(), AnchorView(), VFLView(), SnapkitView()])
        stackView.axis = .vertical      // 主轴方向
        stackView.spacing = 20          // 间距
        stackView.distribution = .fill  // 主轴上的分布
        stackView.alignment = .fill     // 正交轴上的对齐方式

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(-40)
            make.width.equalTo(UIScreen.main.bounds.width - 32)
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
//        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20).isActive = true
//        view2.leftAnchor.constraint(equalTo: view1.leftAnchor).isActive = true
//        view2.rightAnchor.constraint(equalTo: view1.rightAnchor).isActive = true
    }

}

class BorderView: UIView {
    override func updateConstraints() {
        debugPrint("BorderView-----------------updateConstraints")
        super.updateConstraints()
    }

    override func updateConstraintsIfNeeded() {
        debugPrint("BorderView-----------------updateConstraintsIfNeeded")
        super.updateConstraintsIfNeeded()
    }

    override func setNeedsUpdateConstraints() {
        debugPrint("BorderView-----------------setNeedsUpdateConstraints")
        super.setNeedsUpdateConstraints()
    }

    override func layoutIfNeeded() {
        debugPrint("BorderView-----------------layoutIfNeeded")
        super.layoutIfNeeded()
    }

    override func layoutSubviews() {
        debugPrint("BorderView-----------------layoutSubviews")
        super.layoutSubviews()
    }

    override func setNeedsLayout() {
        debugPrint("BorderView-----------------setNeedsLayout")
        super.setNeedsLayout()
    }

    override func draw(_ rect: CGRect) {
        debugPrint("BorderView-----------------draw")
        super.draw(rect)
    }

    override func setNeedsDisplay() {
        debugPrint("BorderView-----------------setNeedsDisplay")
        super.setNeedsDisplay()
    }
}

class AvatarView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 50)
    }

    override func updateConstraints() {
        if superview is BorderView {
            debugPrint("Avatar-----------------updateConstraints")
        }
        super.updateConstraints()
    }

    override func updateConstraintsIfNeeded() {
        if superview is BorderView {
            debugPrint("Avatar-----------------updateConstraintsIfNeeded")
        }
        super.updateConstraintsIfNeeded()
    }

    override func setNeedsUpdateConstraints() {
        if superview is BorderView {
            debugPrint("Avatar-----------------setNeedsUpdateConstraints")
        }
        super.setNeedsUpdateConstraints()
    }

    override func layoutIfNeeded() {
        if superview is BorderView {
            debugPrint("Avatar-----------------layoutIfNeeded")
        }
        super.layoutIfNeeded()
    }

    override func layoutSubviews() {
        if superview is BorderView {
            debugPrint("Avatar-----------------layoutSubviews")
        }
        super.layoutSubviews()
    }

    override func setNeedsLayout() {
        if superview is BorderView {
            debugPrint("Avatar-----------------setNeedsLayout")
        }
        super.setNeedsLayout()
    }

    override func draw(_ rect: CGRect) {
        if superview is BorderView {
            debugPrint("Avatar-----------------draw")
        }
        super.draw(rect)
    }

    override func setNeedsDisplay() {
        if superview is BorderView {
            debugPrint("Avatar-----------------setNeedsDisplay")
        }
        super.setNeedsDisplay()
    }
}

class ConstraintView: UIView {
    let avatarView = AvatarView()
    var width: NSLayoutConstraint?
    var height: NSLayoutConstraint?

    @objc func changeAvatarSize() {
        width?.constant += 1
        height?.constant += 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green.withAlphaComponent(0.1)
        avatarView.backgroundColor = UIColor.purple.withAlphaComponent(0.5)
        avatarView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeAvatarSize)))
        let nameLabel = UILabel()
        nameLabel.text = "NSLayoutConstraint"

        let borderView = BorderView()
        borderView.backgroundColor = .white

        let detailLabel = UILabel()
        detailLabel.numberOfLines = 0
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        borderView.addSubview(avatarView)
        addSubview(borderView)
        addSubview(nameLabel)
        addSubview(detailLabel)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false

        addConstraints([
            NSLayoutConstraint(item: borderView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: borderView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: detailLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: borderView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: detailLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottom, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: borderView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: borderView, attribute: .right, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: detailLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: detailLabel, attribute: .left, relatedBy: .equal, toItem: nameLabel, attribute: .left, multiplier: 1, constant: 0)
        ])
        borderView.addConstraints([
            NSLayoutConstraint(item: avatarView, attribute: .left, relatedBy: .equal, toItem: borderView, attribute: .left, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: avatarView, attribute: .top, relatedBy: .equal, toItem: borderView, attribute: .top, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: avatarView, attribute: .right, relatedBy: .equal, toItem: borderView, attribute: .right, multiplier: 1, constant: -8),
            NSLayoutConstraint(item: avatarView, attribute: .bottom, relatedBy: .equal, toItem: borderView, attribute: .bottom, multiplier: 1, constant: -8)
        ])
        width = NSLayoutConstraint(item: avatarView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        height = NSLayoutConstraint(item: avatarView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        guard let width = width, let height = height else { return }
        avatarView.addConstraints([width, height])
//        avatarView.setContentCompressionResistancePriority(.required, for: .horizontal)
//        avatarView.setContentHuggingPriority(.required, for: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        debugPrint("ConstraintView-----------------updateConstraints")
        super.updateConstraints()
    }

    override func updateConstraintsIfNeeded() {
        debugPrint("ConstraintView-----------------updateConstraintsIfNeeded")
        super.updateConstraintsIfNeeded()
    }

    override func setNeedsUpdateConstraints() {
        debugPrint("ConstraintView-----------------setNeedsUpdateConstraints")
        super.setNeedsUpdateConstraints()
    }

    override func layoutIfNeeded() {
        debugPrint("ConstraintView-----------------layoutIfNeeded")
        super.layoutIfNeeded()
    }

    override func layoutSubviews() {
        debugPrint("ConstraintView-----------------layoutSubviews")
        super.layoutSubviews()
    }

    override func setNeedsLayout() {
        debugPrint("ConstraintView-----------------setNeedsLayout")
        super.setNeedsLayout()
    }

    override func draw(_ rect: CGRect) {
        debugPrint("ConstraintView-----------------draw")
        super.draw(rect)
    }

    override func setNeedsDisplay() {
        debugPrint("ConstraintView-----------------setNeedsDisplay")
        super.setNeedsDisplay()
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
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
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

        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        detailLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20).isActive = true
        detailLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -20).isActive = true
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
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
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
        let metrics = ["margin": 20, "width": 80]
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
        detailLabel.text = "酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳酒叟非机动金佛山金佛山解耦防静电搜集佛顶山奇偶发动机of解耦靳"
        detailLabel.textColor = .gray
        detailLabel.font = .systemFont(ofSize: 15)
        addSubview(avatarView)
        addSubview(nameLabel)
        addSubview(detailLabel)

        avatarView.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.bottom.lessThanOrEqualTo(-20)
            make.width.height.equalTo(80)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarView)
            make.left.equalTo(avatarView.snp.right).offset(20)
            make.right.lessThanOrEqualTo(-20)
        }

        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalTo(nameLabel)
            make.bottom.right.lessThanOrEqualTo(-20)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
