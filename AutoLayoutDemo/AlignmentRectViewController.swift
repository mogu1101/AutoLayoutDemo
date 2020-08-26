//
//  AlignmentRectViewController.swift
//  AutoLayoutDemo
//
//  Created by Liujinjun on 2020/8/18.
//  Copyright © 2020 Liujinjun. All rights reserved.
//

import UIKit

class AlignmentRectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let view1 = UIView()
        view1.backgroundColor = .black

        let alignmentRectView = AlignmentRecView()
        view.addSubview(alignmentRectView)
        view.addSubview(view1)

        alignmentRectView.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.left.equalTo(50)
        }

        view1.snp.makeConstraints { (make) in
            make.edges.equalTo(alignmentRectView)
        }
    }

}

class AlignmentRecView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var alignmentRectInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
}
