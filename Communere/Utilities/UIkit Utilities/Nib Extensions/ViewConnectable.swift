//
//  ViewConnectable.swift
//  Communere
//
//  Created by Shayan Mehranpoor on 6/18/20.
//  Copyright © 2020 exonvision. All rights reserved.
//

import UIKit

protocol ViewConnectable {}

extension ViewConnectable where Self: UIView {
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: Self.self), bundle: bundle)
        let views = nib.instantiate(withOwner: self, options: nil)
        guard let view = views.first as? UIView else { return }
        addExpletiveSubView(view: view)
    }
}

extension UIView {
    public func addExpletiveSubView (view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
