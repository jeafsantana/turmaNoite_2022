//
//  aulaMVVM_parte2Tests.swift
//  aulaMVVM_parte2Tests
//
//  Created by Jessica Santana on 27/05/22.
//

import XCTest
@testable import aulaMVVM_parte2

class aulaMVVM_parte2Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let viewModel = SomaViewModel()
        
        let resultadoSoma = viewModel.somarComRetorno(primeiroValor: "2", segundoValor: "3")
        
        XCTAssertEqual(resultadoSoma, "5")
    }
    
    func testSomaViewModel_quandoOPrimeiroParametroVierNulo_eOSegundoParametroVierNulo_aFuncaoSomarComRetornoDeveRetornarNulo() {
        let viewModel = SomaViewModel()
        
        let resultadoSoma = viewModel.somarComRetorno(primeiroValor: nil, segundoValor: nil)
        
        XCTAssertEqual(resultadoSoma, nil)
    }
    
    func testSomaViewModel_quandoOPrimeiroParametroVierComOValor3_eOSegundoParametroVierComOValor3_aFuncaoSubtrairComRetornoDeveRetornar0() {
        let viewModel = SomaViewModel()
        
        let resultadoSubtracao = viewModel.subtracaoComRetorno(primeiroValor: 3, segundoValor: 3)
        
        XCTAssertEqual(resultadoSubtracao, 0)
    }
    
}
