//
//  WriteViewController.swift
//  zaeMemo
//
//  Created by 재영신 on 2021/10/06.
//

import UIKit
import SnapKit
import CoreData
import PencilKit

class WriteViewController: UIViewController {
    var beforeFdName : String!
    var canvasView : PKCanvasView?
    @IBOutlet weak var curDateLabel: UILabel!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    @IBOutlet weak var textField: UITextField!
    var container : NSPersistentContainer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeConstraints()
        self.setViews()
        self.setCanvasView()
        self.setPencilTool()
       
    }
    
    

}

extension WriteViewController {
    func setCanvasView(){
        canvasView = PKCanvasView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        textField.addSubview(canvasView!)
        canvasView!.drawingPolicy = .anyInput
    }
    func setPencilTool(){
        
        if let window = UIApplication.shared.windows.first , let toolPicker = PKToolPicker.shared(for:  window){
            toolPicker.addObserver(canvasView!)
            toolPicker.setVisible(true, forFirstResponder: canvasView!)
            canvasView?.becomeFirstResponder()
        }
    }
}
extension WriteViewController{
    func setViews(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName:"ellipsis.circle")
        //textView.autocorrectionType = .no
        print(Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        curDateLabel.text = dateFormatter.string(from: Date())
        curDateLabel.textAlignment = .center
    }
    func makeConstraints(){
        bottomToolBar.snp.makeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        textField.snp.makeConstraints{ make in
            make.bottom.equalTo(bottomToolBar.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        
            
        }
        curDateLabel.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view.snp.centerX)
            make.left.equalTo(textField.snp.left)
            make.right.equalTo(textField.snp.right)
        }
    }
}

extension WriteViewController : UITextFieldDelegate{
    private func textFieldDidBeginEditing(_ textView: UITextView) {
        print("edit start")
        self.navigationItem.rightBarButtonItems?.insert((UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(save))), at: 0)
    }
    func textFieldDidEndEditing(_ textView: UITextView) {
        print("edit end")
        self.navigationItem.rightBarButtonItems?.remove(at: 0)
    }
}

extension WriteViewController {
    @objc func save(){
        var str = textField.text
        let index = str?.index(str!.startIndex, offsetBy: 10)
        str = String(str![str!.startIndex ..< index!])
        CoreDataManager.shared.saveMemo(title: str!, time: Date(), subTitle: "asb", content: textField.text!, type: "N", id: 1234)
        
        let loadedMemo = CoreDataManager.shared.loadMemo(request: Memo.fetchRequest())
        print(loadedMemo.count)
        print(loadedMemo)
        
    }
}
