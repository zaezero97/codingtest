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
    @IBOutlet weak var rightBarBtn: UIBarButtonItem!

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
        rightBarBtn.title = "편집"
        self.navigationItem.title = "폴더"
        self.navigationItem.largeTitleDisplayMode = .automatic //스크롤 했을 때 title 이 Large title -> title
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        self.navigationItem.searchController = searchController
        //self.navigationItem.hidesSearchBarWhenScrolling = false 
        
        tableView.tableHeaderView = searchController.searchBar
        view.backgroundColor = .systemGray6
        tableView.backgroundColor = .systemGray6
            
        let addGroupbtn = UIBarButtonItem(image: UIImage(systemName:"folder.badge.plus"), style: .plain, target: self, action:nil)
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

extension FolderViewController{
    @objc func goWrite(){
        let writeStoryBoard = UIStoryboard.init(name: "Write", bundle: nil)
        guard let writeVc = writeStoryBoard.instantiateViewController(withIdentifier: "writeVc") as? WriteViewController else{
            return
        }
        self.navigationController?.pushViewController(writeVc, animated: true)
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
    
}
