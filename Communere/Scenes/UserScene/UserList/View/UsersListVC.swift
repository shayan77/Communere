//
//  UsersListVC.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/19/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UsersListVC: UIViewController {
    
    // MARK: - Coordinator
    weak var userCoordinator: UserCoordinator?
    
    @IBOutlet var usersListTableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    let usersListVM = UsersListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupResponseBinding()
    }
    
    // MARK: - Func
    private func setupView() {
    
        // nameLbl
        usersListTableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        usersListTableView.delegate = self
        usersListTableView.dataSource = self
    }
    
    // MARK: - Setup ResponseBinding
    func setupResponseBinding() {
        
        usersListVM.successResponseOnDelete
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                self.usersListTableView.deleteRows(at: [indexPath], with: .automatic)
            }).disposed(by: disposeBag)
    }
}

extension UsersListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.userCoordinator?.navigateToUserProfile(user: User.users()[indexPath.row])
    }
}

extension UsersListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.users().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell {
            let user = User.users()[indexPath.row]
            cell.configureCell(data: user)
            cell.delegate = self
            cell.indexPath = indexPath
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension UsersListVC: UserDelegate {
    func deleteBtnPressed(at index: IndexPath) {
        self.usersListVM.deleteUserWith(User.users()[index.row], index: index)
    }
}
