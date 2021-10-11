//
//  ViewController.swift
//  zaeMemo
//
//  Created by 재영신 on 2021/10/06.
//

import UIKit
import SnapKit

class FolderViewController: UIViewController {

 
    @IBOutlet weak var bottomToolBar: UIToolbar!
    @IBOutlet weak var tableView: UITableView!

    var testData = ["오늘 할일","내일 할일","오늘 저녁","식단 표","123123","@321312321","@!#213","#21412312"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeConstraints()
        self.setViews()
        tableView.dataSource = self
        tableView.delegate = self

    }
}

extension FolderViewController
{
    func setViews(){
        
        self.navigationItem.title = "폴더"
        self.navigationItem.largeTitleDisplayMode = .automatic //스크롤 했을 때 title 이 Large title -> title
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        self.navigationItem.searchController = searchController
        //self.navigationItem.hidesSearchBarWhenScrolling = false 
        
        let rightBarBtn = UIBarButtonItem(title:"편집", style: .plain, target: self, action: #selector(changeToEditState))
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        tableView.tableHeaderView = searchController.searchBar
        view.backgroundColor = .systemGray6
        tableView.backgroundColor = .systemGray6
        
        let addGroupbtn = UIBarButtonItem(image: UIImage(systemName:"folder.badge.plus"), style: .plain, target: self, action: #selector(createFolder))
        let writebtn = UIBarButtonItem(image: UIImage(systemName:"square.and.pencil"), style: .plain, target: self, action:  #selector(goWrite))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        bottomToolBar.setBackgroundImage(UIImage(), forToolbarPosition: .bottom, barMetrics: .default)
        bottomToolBar.setShadowImage(UIImage(), forToolbarPosition: .bottom)
        bottomToolBar.isTranslucent = true
        bottomToolBar.setItems([addGroupbtn,flexibleSpace,writebtn], animated: true)
    }
    func makeConstraints(){
       
        bottomToolBar.snp.makeConstraints{ make in
            make.top.equalTo(tableView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(10)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
                .inset(10)
            make.bottom.equalTo(bottomToolBar.snp.top)
            
        }
    }

}

//objc 함수들
extension FolderViewController{
    @objc func goWrite(){ // 오른 쪽 하단 글 작성 버튼 액션 -> 글 쓰기 화면으로 이동
        let writeStoryBoard = UIStoryboard.init(name: "Write", bundle: nil)
        guard let writeVc = writeStoryBoard.instantiateViewController(withIdentifier: "writeVc") as? WriteViewController else{
            return
        }
        self.navigationController?.pushViewController(writeVc, animated: true)
    }
    @objc func changeToEditState(){ //편집 버튼 액션 함수 -> table view edit state change
        if tableView.isEditing{
            self.navigationItem.rightBarButtonItem?.title = "편집"
            tableView.setEditing(false, animated: true)
        
        }else{
            self.navigationItem.rightBarButtonItem?.title = "완료"
            tableView.setEditing(true, animated: true)
        }
    }
    @objc func createFolder(){

        let alert = UIAlertController(title: "새로운 폴더", message: "이 폴더의 이름을 입력하십시오.", preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .cancel,handler: {(cancle) in print(cancle)

        })
        let save = UIAlertAction(title: "저장", style: .default, handler: {(save) in print(save)
            guard let textfield = alert.textFields else{
                return
            }
            print(textfield[0].text)
        })
        
        alert.addAction(cancle)
        alert.addAction(save)
        alert.addTextField(configurationHandler:nil)
        self.present(alert, animated: true, completion: nil)
    }
}

extension FolderViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print(testData.count)
        return testData.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "folderCell") ?? UITableViewCell()
        cell.textLabel?.text = testData[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "folder")
       return cell
    }

}
extension FolderViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let share = UIContextualAction(style: .normal, title: "", handler: {action,view,completionHandler in
            completionHandler(true)
        } )
        share.backgroundColor = UIColor(netHex:0x66b2ff)
        share.image = UIImage(systemName: "person.fill.badge.plus")
        
        let move =  UIContextualAction(style: .normal, title: "", handler: {action,view,completionHandler in
            completionHandler(true)
        } )
        move.backgroundColor = UIColor(netHex:0xcc99ff)
        move.image = UIImage(systemName: "folder.fill")
        
        let delete =  UIContextualAction(style: .normal, title: "", handler: {action,view,completionHandler in
            completionHandler(true)
        } )
        delete.backgroundColor = UIColor(netHex:0xff6666)
        delete.image = UIImage(systemName: "trash.fill")
        
        return UISwipeActionsConfiguration(actions: [delete,move,share])
    }
    // Override to support rearranging the table view.
       // 테이블 목록 이동 가능(목록 순서 바꾸기 )
       func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
           let itemToMove = testData[(fromIndexPath as NSIndexPath).row] // 이동할 아이템의 위치
           testData.remove(at: (fromIndexPath as NSIndexPath).row) // 이동할 아이템 삭제 -> 뒤의 아이템 인덱스 재정렬
           testData.insert(itemToMove, at: (to as NSIndexPath).row) // 삭제된 아이템을 이동할 위치로 삽입
       }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}

