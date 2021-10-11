//
//  CreateFolderPopupViewController.swift
//  zaeMemo
//
//  Created by 재영신 on 2021/10/08.
//

import UIKit
import SnapKit


class CreateFolderPopupViewController: UIViewController {

    @IBOutlet weak var horizontal_stackView: UIStackView!
    @IBOutlet weak var vertical_stackView: UIStackView!
    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black.withAlphaComponent(0.2)
        self.makeConstraints()
    }
    

}

// auto layout
extension CreateFolderPopupViewController{
    func makeConstraints(){
        popupView.snp.makeConstraints{ make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(view.safeAreaLayoutGuide.snp.height).multipliedBy(0.2)
        }
        vertical_stackView.snp.makeConstraints{ make in
            make.top.equalTo(popupView.snp.top).inset(20)
            make.left.equalTo(popupView.snp.left).inset(5)
            make.right.equalTo(popupView.snp.right).inset(5)
        }
        horizontal_stackView.snp.makeConstraints{ make in
            make.left.equalTo(popupView.snp.left).inset(5)
            make.right.equalTo(popupView.snp.right).inset(5)
            make.bottom.equalTo(popupView.snp.bottom)
        }
        
    }
}
