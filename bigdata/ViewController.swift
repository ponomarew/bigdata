//
//  ViewController.swift
//  bigdata
//
//  Created by Александр Пономарёв on 12.11.2021.
//

import Cocoa

class ViewController: NSViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		let service = ApiService()
		service.createProfiles()
	}
}

