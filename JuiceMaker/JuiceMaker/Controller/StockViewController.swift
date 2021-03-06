//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/17.
//

import Foundation
import UIKit

extension StockViewController {

    @IBAction func touchUpStepper(_ sender: StockStepper) {
        sender.stockLabel!.text = String(Int(sender.value) + sender.stockLabel!.fruit.stock)
    }
    
    @IBAction func touchUpSaveButton(_ sender: UIButton) {
        self.showAlert(self.endStockModificationAlert())
    }
    
    @IBAction func touchUpCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeStockLabel()
        initializeStockStepper()
    }
    
    private func initializeStockLabel() {
        strawberryStock.fruit = FruitType.strawberry
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.fruit = FruitType.banana
        bananaStock.text = String(FruitType.banana.stock)
        pineappleStock.fruit = FruitType.pineapple
        pineappleStock.text = String(FruitType.pineapple.stock)
        kiwiStock.fruit = FruitType.kiwi
        kiwiStock.text = String(FruitType.kiwi.stock)
        mangoStock.fruit = FruitType.mango
        mangoStock.text = String(FruitType.mango.stock)
    }
    
    private func initializeStockStepper() {
        strawBerryStockStepper.stockLabel = strawberryStock
        bananaStockStepper.stockLabel = bananaStock
        pineappleStockStepper.stockLabel = pineappleStock
        kiwiStockStepper.stockLabel = kiwiStock
        mangoStockStepper.stockLabel = mangoStock
    }
    
    func saveChanges() {
        strawberryStock.fruit.addStock(amount: Int(strawBerryStockStepper.value))
        bananaStock.fruit.addStock(amount: Int(bananaStockStepper.value))
        pineappleStock.fruit.addStock(amount: Int(pineappleStockStepper.value))
        kiwiStock.fruit.addStock(amount: Int(kiwiStockStepper.value))
        mangoStock.fruit.addStock(amount: Int(mangoStockStepper.value))
    }
}
