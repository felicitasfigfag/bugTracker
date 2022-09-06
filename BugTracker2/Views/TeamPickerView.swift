//
//  TeamPickerView.swift
//  BugTracker2
//
//  Created by Felicitas Figueroa Fagalde on 31.08.22.
//

import UIKit

class TeamPickerView: UIView {
    
    var delegate : TeamPickerDelegate?
    
    var picker = UIPickerView()
    
    var btnDismiss : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints=true
        btn.autoresizingMask = .flexibleLeftMargin
        btn.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return btn
    }()

    var btnAdd : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints=true
        btn.autoresizingMask = .flexibleLeftMargin
        btn.addTarget(self, action: #selector(add), for: .touchUpInside)
        return btn
    }()
    
    override func draw(_ rect: CGRect) {
        picker.frame = CGRect(x: 0, y: 20, width: rect.width, height: rect.height-30)
        picker.backgroundColor = .white
        picker.delegate = self
        picker.dataSource = self
        self.addSubview(picker)
        
        btnDismiss.frame=CGRect(x: 100, y: 45, width: 50, height: 80)
        self.addSubview(btnDismiss)
        
        btnAdd.frame = CGRect(x: 260, y: 45, width: 50, height: 80)
        self.addSubview(btnAdd)


    }
    
    @objc func dismiss() {
        self.removeFromSuperview()
    }
    
    @objc func add() {
        if delegate != nil {
        let index = picker.selectedRow(inComponent: 0)
        let tm = team[index]
        print(tm.title)
        delegate?.addTeamMember(tm: tm)

    }
}
}

extension TeamPickerView : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //estamos llenando el picker view, sacamos de la bd quienes estan disponibles para formar el team
        team.count
    }
}
extension TeamPickerView : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tm = team[row]
        return tm.title
    }
}
protocol TeamPickerDelegate {

    func addTeamMember(tm: dataItem)

}

