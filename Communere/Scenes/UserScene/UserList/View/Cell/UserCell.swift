//
//  UserCell.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/19/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol UserDelegate {
    func deleteBtnPressed(at index: IndexPath)
}

class UserCell: UITableViewCell {
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var deleteBtn: UIButton!
    
    var delegate: UserDelegate!
    var indexPath: IndexPath!
    
    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        deleteBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.delegate.deleteBtnPressed(at: self.indexPath)
            }).disposed(by: disposeBag)
    }

    func configureCell(data: User) {
        nameLbl.text = data.name ?? ""
    }
}
