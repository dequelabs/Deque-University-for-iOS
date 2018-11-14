//
//  DequeDemoView.swift
//  DequeUniversityForIOS
//
//  Created by Jennifer Dailey on 11/1/18.
//  Copyright © 2018 Deque Systems Inc. All rights reserved.
//

import UIKit

class DQDemoView: DQView {
    
    /// Title of the demo
    @IBInspectable public var title: String = ""
    
    /// If this property is not `nil`, this view will automatically add the demo description.  Create a UIView and attach it to the IBOutlet if the demo description is longer than a paragraph.
    @IBInspectable public var demoDescription: String?

    /**
     Mark `YES` if this view should be a collapsable view. By default, a collapsable view will only show the title, demo, and an "expand" button. When pressed, the "expand" button will reveal the demo description.  If this property is marked `NO`, this view will show the title, demo, and demo description at all times.  Default value for this property is `NO`.
     At this time, isCollapsable only works when the superview is a UIStackView.
    **/
    @IBInspectable public var isCollapsable: Bool = false

    @IBOutlet public var demo: UIView!
    @IBOutlet public var demoDescriptionView: UIView?
    
    private let titleLabel = Heading()
    
    private var _demoDescriptionView: UIView {
        if demoDescriptionView == nil {
            demoDescriptionView = DQView()
        }
        return demoDescriptionView!
    }
    
    private init(title demoTitle: String,
                 demo demoView: UIView,
                 description descriptionView: UIView) {
        
        title = demoTitle
        demo = demoView
        demoDescriptionView = descriptionView
        
        super.init(frame: CGRect.zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if self.demoDescriptionView == nil {
            createDemoDescription()
        }
        
        if self.isCollapsable {
            replaceWithExpandableView()
        } else {
            setup()
        }
    }
        
    private func setup() {
        removeAllSubviews()
        setupTitle()
        addNeededSubviews()
        setupConstraints()
    }
    
    private func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    private func addNeededSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.demo)
        self.addSubview(self._demoDescriptionView)
    }
    
    private func setupTitle() {
        titleLabel.text = self.title
    }
    
    private func setupConstraints() {
        
        // Title Constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: demo.topAnchor, constant: -10).isActive = true
        
        // Demo Constraints
        demo.translatesAutoresizingMaskIntoConstraints = false
        demo.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        demo.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        demo.bottomAnchor.constraint(equalTo: _demoDescriptionView.topAnchor, constant: -10).isActive = true
        
        // Description Constraints
        _demoDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        _demoDescriptionView.leftAnchor.constraint(equalTo: demo.leftAnchor).isActive = true
        _demoDescriptionView.rightAnchor.constraint(equalTo: demo.rightAnchor).isActive = true
        _demoDescriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    private func createDemoDescription() {
        let label = A11yLabel()
        
        label.text = demoDescription
        _demoDescriptionView.addSubview(label)
        
        // Constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: _demoDescriptionView.topAnchor, constant: 10).isActive = true
        label.leftAnchor.constraint(equalTo: _demoDescriptionView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: _demoDescriptionView.rightAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: _demoDescriptionView.bottomAnchor, constant: -20).isActive = true
        
        self.addSubview(_demoDescriptionView)
    }
    
    private func replaceWithExpandableView() {
        let expandableView = ExpandableDemoView(title: self.title,
                                                demo: self.demo,
                                                description: self._demoDescriptionView)
        
        expandableView.translatesAutoresizingMaskIntoConstraints = false
        
        replaceSelfWithView(expandableView)
    }
    
    private func replaceSelfWithView(_ view: UIView) {
        
        guard let sv = self.superview else {
            fatalError("ERROR: No Superview found.")
        }
        
        guard let stackView = sv as? UIStackView else {
            fatalError("ERROR: Collapsable Demo View requires a UIStackView to be its superview.")
        }
        
        stackView.addArrangedSubview(view)
        self.removeFromSuperview()
    }
}
