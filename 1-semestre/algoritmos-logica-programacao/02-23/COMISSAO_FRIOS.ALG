Algoritmo "COMISSAO_FRIOS"

Var
    quantidadeMussarela,quantidadePresunto,quantidadeMortadela,quantidadePeitoPeru:real
    vendaMussarela,vendaPresunto,vendaMortadela,vendaPeitoPeru,vendaTotal:real
    comissaoMussarela,comissaoPresunto,comissaoMortadela,comissaoPeitoPeru,comissaoTotal:real
    
Inicio
    Escreval ("Quantos quilos de Mussarela foram vendidos?")
    Leia (quantidadeMussarela)
    vendaMussarela <- quantidadeMussarela*55
    comissaoMussarela <- vendaMussarela*0.07
    
    Escreval ("Quantos quilos de Presunto foram vendidos?")
    Leia (quantidadePresunto)
    vendaPresunto <- quantidadePresunto*33
    comissaoPresunto <- vendaPresunto*0.04
    
    Escreval ("Quantos quilos de Mortadela foram vendidos?")
    Leia (quantidadeMortadela)
    vendaMortadela <- quantidadeMortadela*23
    comissaoMortadela <- vendaMortadela*0.08
    
    Escreval ("Quantos quilos de Peito de Peru foram vendidos?")
    Leia (quantidadePeitoPeru)
    vendaPeitoPeru <- quantidadePeitoPeru*85
    comissaoPeitoPeru <- vendaPeitoPeru*0.02
    
    comissaoTotal <- comissaoMussarela + comissaoPresunto + comissaoMortadela + comissaoPeitoPeru + comissaoTotal
    vendaTotal <-  vendaMussarela + vendaPresunto + vendaMortadela + vendaPeitoPeru

    
    Escreval ("-----------------")
    Escreval ("Produto: Mussarela")
    Escreval ("Valor: R$ 55,00 KG")
    Escreval ("Quantidade vendida:",quantidadeMussarela,"kg")
    Escreval ("Valor total da venda: R$ ",vendaMussarela)
    Escreval ("Comissão recebida: R$ ",comissaoMussarela)
    Escreval ("-----------------")
    Escreval ("Produto: Presunto")
    Escreval ("Valor: R$ 33,00 KG")
    Escreval ("Quantidade vendida:",quantidadePresunto,"kg")
    Escreval ("Valor total da venda: R$ ",vendaPresunto)
    Escreval ("Comissão recebida: R$",comissaoPresunto)
    Escreval ("-----------------")
    Escreval ("Produto: Mortadela")
    Escreval ("Valor: R$ 23,00 KG")
    Escreval ("Quantidade vendida:",quantidadeMortadela,"kg")
    Escreval ("Valor total da venda: R$ ",vendaMortadela)
    Escreval ("Comissão recebida: R$",comissaoMortadela)
    Escreval ("-----------------")
    Escreval ("Produto: Peito de Peru")
    Escreval ("Valor: R$ 85,00 KG")
    Escreval ("Quantidade vendida:",quantidadePeitoPeru,"kg")
    Escreval ("Valor total da venda: R$ ",vendaPeitoPeru)
    Escreval ("Comissão recebida: R$",comissaoPeitoPeru)
    Escreval ("-----------------")
    Escreval ("O valor total da venda foi R$",vendaTotal)
    Escreval ("O valor total da comissão foi R$:",comissaoTotal)

Fimalgoritmo