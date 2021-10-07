//
//  WriteViewController.swift
//  zaeMemo
//
//  Created by 재영신 on 2021/10/06.
//

import UIKit
import SnapKit
import CoreData

class WriteViewController: UIViewController {
    var beforeFdName : String!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    @IBOutlet weak var textView: UITextView!
    var container : NSPersistentContainer!
    var coreDataManager : CoreDataManager!
    override func viewDidLoad() {
        coreDataManager = CoreDataManager()
        super.viewDidLoad()
        self.makeConstraints()
        self.setViews()
        textView.delegate = self
    }
    
    

}

extension WriteViewController{
    func setViews(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName:"ellipsis.circle")
        textView.autocorrectionType = .no
    }
    func makeConstraints(){
        bottomToolBar.snp.makeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        textView.snp.makeConstraints{ make in
            make.bottom.equalTo(bottomToolBar.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            
        }
       
    }
}

extension WriteViewController : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("edit start")
        self.navigationItem.rightBarButtonItems?.insert((UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(save))), at: 0)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print("edit end")
        self.navigationItem.rightBarButtonItems?.remove(at: 0)
    }
}

extension WriteViewController {
    @objc func save(){
        var str = textView.text
        var index = str?.index(str!.startIndex, offsetBy: 10)
        str = String(str![str!.startIndex ..< index!])
        coreDataManager.addMemo(title: str!, time: Date(), subTitle: "asb", content: textView.text, type: "N", id: 1234)
        do{
        let memo = try coreDataManager.context!.fetch(Memo.fetchRequest()) as! [Memo]
            
        print(memo.count)
        memo.forEach {
            print($0)
        }
        }catch{
            print(error.localizedDescription)
        }
    }
}
