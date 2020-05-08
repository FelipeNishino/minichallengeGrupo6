//
//  AppDelegate.swift
//  appDicasCulinaria
//
//  Created by Felipe Nishino on 07/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let userDefaults = UserDefaults.standard
        
        print("enter delegate ud init")
        
        if userDefaults.object(forKey: "Tips") == nil {
            var dict = [String : Tip]()
            
            print("tips dict init")
            
            dict = [
                "0" : Tip(title: "Evitando restos de farinha", text: "Quando for abrir uma massa e for necessitar de farinha para abrir a massa, coloque uma lâmina de filme plástico ou de celofane para churrasco sobre a superfície e coloque a farinha sobre o filme ou o celofane. Na hora de limpar, basta recolher o filme ou o celofane, evitando que a farinha fique depositada na pedra ou mesa. Dica da dica - se for utilizar o celofane, para evitar que ele escorregue sobre a superfície da pedra ou da mesa, adicione algumas gotas de água na superfície antes de colocar o celofane. Isto fará com que o celofane não escorregue.", tag: [2, 4, 9], fav: false, hasImg: true, imgURL: "img14"),
                "1" : Tip(title: "Guardando facas e objetos cortantes", text: "Guarde as facas e objetos cortantes com a lâmina virada para baixo em gavetas, e tente colocar uma faca ao lado da outra, de forma a facilitar o acesso ao cabo, evitando cortes. Dica da dica - facas e objetos pontiagudos podem ser colocados com as pontas e lâminas para baixo nos escorredores de talheres após a lavagem, evitando machucados.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img1"),
                "2" : Tip(title: "Posição das panelas no fogão", text: "Ao utilizar panelas no fogão, procure deixar os cabos apontados para fora, evitando que aqueçam muito, enquanto as panelas estão no fogo.", tag: [2, 3, 4], fav: false, hasImg: true, imgURL: "img21"),
                "3" : Tip(title: "Ponto do cozimento de bolos", text: "Para saber se uma massa de bolo está devidamente assada, abra o forno com cuidado, com o uso de luva térmica protetora, espete e retire um palito no meio do bolo. Se o palito sair seco, a massa está cozida. Se a massa ficar grudada no palito, a massa ainda deve cozinhar por mais tempo. Dica da dica - evite abrir o forno muitas vezes durante o cozimento de alimentos, em especial de bolos e doces. A abertura do forno leva a perda momentânea de calor, que faz com que a massa murche e não fique tão alta.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img26"),
                "4" : Tip(title: "Manuseio de alimentos crus", text: "No preparo de alimentos que envolvam produtos crus, deve-se utilizar talheres, pratos, tábuas de corte e equipamentos diferentes para produtos crus e aqueles já cozidos, evitando eventual contaminação do alimento preparado por aqueles ainda crus. Dica da dica - evite provar alimentos crus, como massas de bolo e doces ainda não cozidas. Muitas receitas levam ovo, que, por ainda estarem crus, podem transmitir doenças como salmonela.", tag: [2, 3, 4], fav: false, hasImg: true, imgURL: "img25"),
                "5" : Tip(title: "Alimentação de fogões a gás", text: "Ao adquirir um fogão a gás de lojas do varejo, verifique se há necessidade de realizar a adaptação do seu fogão, caso o seu gás seja encanado. Isto porque os fogões normalmente comercializados são projetados para o gás de botijão (GLP), que possuem pressão maior que o gás de encanamento (GN). Assim, as empresas de eletrodomésticos normalmente realizam a troca de bicos que permitem a saída do gás da chama quando o usuário possui gás encanado, permitindo que o fogão esteja adaptado a trabalhar como uma pressão menor.", tag: [2, 3, 4], fav: false, hasImg: true, imgURL: "img10"),
                "6" : Tip(title: "Disposição de produtos na geladeira", text: "Evite deixar ovos, leite e outros produtos sensíveis (como iogurte) na porta de geladeiras. A abertura e fechamento da porta do eletrodoméstico faz aumentar a temperatura dos alimentos mantidos na porta, diminuindo a conservação desses alimentos. Os ovos, além de perderem a temperatura fria, estão sujeitos a pequenas batidas a cada fechamento da porta, o que pode levar a fissuras nas cascas dos ovos, prejudicando sua conservação.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img2"),
                "7" : Tip(title: "Reaquecimento de pães", text: "Para manter a crocância de pães amanhecidos (pães do dia anterior), umedeça a superfície do pão com água e, em seguida, aqueça o pão no forno baixo (180 graus), por cerca de cinco a dez minutos, a depender da quantidade de pães.", tag: [2, 3, 4, 9], fav: false, hasImg: true, imgURL: "img22"),
                "8" : Tip(title: "Quantidade da massa de bolo na forma", text: "Ao fazer um bolo, não preencha mais da metade da forma com a massa do bolo para evitar que a massa transborde dentro do forno por causa do seu crescimento quando do cozimento.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img29"),
                "9" : Tip(title: "Untar formas de bolo", text: "Ao fazer um bolo, não esqueça de untar a forma que irá receber a massa do bolo. Para untar a forma deve-se aplicar óleo ou manteiga sobre o lado de dentro da forma ainda vazia e espalhar o óleo ou manteiga para que cubra toda a superfície de dentro da forma (pode-se usar um pincel culinário ou mesmo uma folha de guardanapo para espalhar o óleo/manteiga). Dica da dica: além da manteiga, pode-se polvilhar (espalhar com o auxílio de uma peneira) um pouco de farinha de trigo sobre a manteiga, antes de se colocar a massa do bolo.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img29"),
                "10" : Tip(title: "Limpeza de panelas e formas", text: "Para desgrudar queimados e gorduras nas panelas e formas antes de lavar, pode-se esfregar meio limão sobre o alimento grudado. A acidez do limão ajuda a soltar a comida, em especial a gordura, facilitando a lavagem dos equipamentos. Outra opção é colocar água com detergente nas panelas e levar ao fogo até a água ferver. Em seguida, com cuidado para não se queimar com a água quente presente na panela, efetuar a sua lavagem. Dica da dica: a fervura da panela com detergente leva ao aumento do volume de espuma, que pode escorrer para fora da panela se o fogo alto for mantido após a água começar a ferver.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img3"),
                "11" : Tip(title: "Higiene das mãos", text: "Uma boa higiene deve acompanhar o preparo de qualquer alimento. Lembra-se da forma recomendada de lavar as mãos por causa do Novo Coronavírus? Então, trata-se da melhor forma de higienização das mãos que deve ser realizada antes de se manusear alimentos. Dica da dica: a lavagem das mãos deve ser feita sempre que se entrar em contato com carnes cruas durante o preparo de alimentos cozidos, para evitar uma contaminação dos equipamentos e, eventualmente, do alimento pronto para consumo.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img16"),
                "12" : Tip(title: "Higiene dos equipamentos e bancada", text: "Além da higiene das mãos, deve-se garantir a higienização dos equipamentos que serão utilizados para elaboração de uma receita e também a bancada que será o local de trabalho, seja uma placa de mármore, seja uma pia, seja uma mesa.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img7"),
                "13" : Tip(title: "Higiene de frutas e verduras", text: "Para realizar a higienização de frutas e legumes, deve-se, antes de mais nada, realizar a higienização das mãos, equipamentos e bancada de trabalho. Em seguida, efetue a remoção de folhas e talos sujos ou que não estejam em bom estado de conservação e não sirvam para consumo. Após, faça a lavagem dos alimentos em água corrente, esfregando bem todas as partes dos alimentos. Deixe os alimentos de molho em produtos próprios para higienização de alimentos ou em água sanitária diluída em água potável, conforme as orientações de cada fabricante constantes nas respectivas embalagens. Ao final, remova o produto ou água sanitária dos alimentos em água corrente novamente e espere secar para poder consumir.", tag: [1, 2, 4], fav: false, hasImg: true, imgURL: "img6"),
                "14" : Tip(title: "Usando ovo cru como ingrediente", text: "Ao preparar receitas que recebam ovos crus no seu preparo, evite quebrar e colocar os ovos crus diretamente sobre os demais ingredientes. Se possível, quebre um ovo de cada vez sobre um pote ou recipiente separado e, em seguida, adicione o ovo aos demais ingredientes, utilizando o pote ou recipiente para quebrar o próximo ovo, assim por diante. Quebrar ovos sobre um recipiente separado permite verificar se o ovo está com boa aparência e em condições de consumo e também evita que pedaços de casca caiam diretamente sobre os demais ingredientes, evitando o retrabalho ou desperdícios dos demais ingredientes.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img4"),
                "15" : Tip(title: "Como abrir um ovo cru", text: "Para abrir um ovo ainda cru, bata a casca do ovo gentilmente na borda de um pote ou outro equipamento, ou mesmo bata de leve com as costas de uma faca (parte sem a lâmina) ou colher. Em seguida, gire o ovo e bata de leve do outro lado, sem abrir o ovo. Inicie sempre com pouca força e vá aumentando a intensidade aos poucos, até perceber que criou uma rachadura na casca. Uma vez que tenha rachaduras em lados opostos, segure o ovo com as duas mãos e pressione os dedões contra a mesma rachadura, puxando cada metade da casca para sua mão. Faça o movimento com calma e sem pressa sobre um pote, garantindo que o ovo caia diretamente sobre o recipiente.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img4"),
                "16" : Tip(title: "Como abrir um ovo cozido", text: "Após ter cozido o ovo, espere o mesmo esfriar para evitar queimar as mãos. Com o auxílio de uma colher ou outro talher, bata na casca do ovo para gerar algumas rachaduras e fissuras. Em seguida, puxe a casca e localize uma membrana transparente que fica entre a casca e a clara cozida. Retire também esta membrana e repita o processo ao longo de todo o ovo. Em seguida, caso necessário, escorra o ovo em água corrente para garantir que não haverá pedaços de casca grudados na clara.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img20"),
                "17" : Tip(title: "Dicas de congelamento 1", text: "Para a melhor conservação de alimentos no freezer, deve-se evitar a presença de ar nas embalagens dos alimentos que serão congelados. Procure separar os alimentos por tipos, agrupando-os dentro do congelador (vegetais, frutas, massas e carnes devem ser alocados em conjunto com os alimentos semelhantes). No caso das carnes, deve-se procurar separar, inclusive, pela origem da proteína (por exemplo: proteínas de aves, frutos do mar, carnes de porco, carnes de vaca).", tag: [2, 4], fav: false, hasImg: true, imgURL: "img5"),
                "18" : Tip(title: "Dicas de congelamento 2", text: "Ao preparar alguns alimentos para serem congelados e armazenados para consumo futuro, não há necessidade de cozimento completo dos alimentos. Isto porque o descongelamento fará o reaquecimento dos alimentos, completando o cozimento e evitando que percam as características originais dos alimentos (como a suculência). Após o cozimento dos alimentos, armazene-os no recipiente apropriado para congelamento e leve ao refrigerador (geladeira) imediatamente, para, em seguida, levar ao congelador. O tempo de resfriamento no resfriador (geladeira), pode ser o dobro do tempo de cozimento. Ao final desse tempo, o produto deve ir diretamente ao freezer. Dica da dica: não espere o alimento cozido esfriar em temperatura ambiente. Isto aumentará a proliferação de bactérias, diminuindo a duração do alimento congelado.", tag: [0, 2, 3], fav: false, hasImg: true, imgURL: "img5"),
                "19" : Tip(title: "Pré-aquecimento de forno", text: "Algumas receitas indicam o preparo de alimentos em forno pré-aquecido a determinada temperatura. O pré-aquecimento consiste em ligar o forno ainda vazio, de cinco a quinze minutos (o tempo varia conforme a capacidade de cada forno de reter e manter o calor gerado), na mesma temperatura recomendada para o preparo da receita. Após este tempo, o alimento poderá ser colocado no forno já aquecido.", tag: [2, 3, 4, 8], fav: false, hasImg: true, imgURL: "img10"),
                "20" : Tip(title: "Uso de equipamentos de madeira", text: "O uso de equipamentos de madeira na cozinha deve ser evitado. Isto porque a madeira passa a apresentar fissuras e cortes, seja em tábuas, colheres ou outros equipamentos, decorrentes da interação com objetos cortantes, pelo ressecamento natural da madeira, ou a exposição a altas temperaturas. As fissúras sáo de difícil limpeza e exterilização, permitindo o crescimento de culturas contaminantes aos alimentos.", tag: [2, 4], fav: false, hasImg: true, imgURL: "img8"),
                "21" : Tip(title: "Como reaquecer carne mal passada", text: "Para reaquecer sobras de carne mal passada, sem que a carne passe do ponto, uma alternativa é vedar o pedaço de carne dentro de um saco com zíper plástico, removendo o ar por completo e mergulhando o saco vedado em uma tigela de água quente. A temperatura da água será transferida para a carne, mas sem aquecê-la a ponta de cozinhar a carne novamente, evitando que o ponto da carne mude de mal passada. *Fonte: WOLKE, Robert L., O que Einstein disse a seu cozinheiro - 1. A ciência na cozinha. Tradução de Helena Londres. Editora Zahar. 2003.", tag: [0, 3, 4], fav: false, hasImg: true, imgURL: "img11"),
                "22" : Tip(title: "Como identificar carne nova e velha no mercado", text: " A cor vermelha da carne resulta da presença de mioglobina, proteína vermelha responsável pelo armazenamento de oxigênio no músculo. A coloração avermelhada da carne, portanto, não decorre exclusivamente da hemoglobina. A presença da mioglobina faz com que a superfície de uma carne seja arroxeada. O contato da mioglobina com o oxigênio, após o corte e embale da carne, faz com que ela fique de coloração vermelho viva e, após algum tempo, fica amarronzada. Assim, carne extremamente fresca é arroxeada. Carne ainda fresca tem a superfície vermelho viva. Já a carne mais antiga, possui aspecto amarronzado em sua superfície, mostrando que está cortada e exposta à venda há mais tempo. *Fonte: WOLKE, Robert L., O que Einstein disse a seu cozinheiro - 1. A ciência na cozinha. Tradução de Helena Londres. Editora Zahar. 2003.", tag: [0, 2, 4], fav: false, hasImg: true, imgURL: "img27"),
                "23" : Tip(title: "Devemos comer batatas verdes?", text: "Batatas verdes não indicam que o alimento ainda não está maduro. O verde presente em batatas é decorrência da presença de clorofila. Ocorre que, juntamente com a clorofila, ocorre um aumento de outra substância, a chamada solaninda. A solanina é encontrada em maiores quantidades nas folhas e talos da batata, partes usualmente descartadas. A quantidade de solanina no corpo da batata aumenta juntamente com a clorofila quando ela passa a fazer a fotossíntese antes de ser colhida, por exemplo, quando é exposta ao sol durante sua fase de crescimento. Mas, afinal, qual o problema? A solanina é venenosa e faz mal se ingerida em grandes quantidades. Assim, no caso das batatas, onde há clorofila há também solanina. Nada que impeça o consumo do tubérculo. Basta remover as partes verdes. Dica da dica: As batatas devem ser guardadas, preferencialmente, em local seco, fresco e escuro. Não se deve armazená-las na geladeira, pois as baixas temperaturas aumentam a produção da solanina. *Fonte: WOLKE, Robert L., O que Einstein disse a seu cozinheiro - 1. A ciência na cozinha. Tradução de Helena Londres. Editora Zahar. 2003.", tag: [1, 2, 4], fav: false, hasImg: true, imgURL: "img24"),
                "24" : Tip(title: "Limpando um filé mignon", text: "Ao adquirir uma peça inteira de filé mignon, observe se a carne ainda possui uma película branca fina, semelhante a gordura, mas muito mais resistente. Em caso positivo, deve-se procurar retirar esta camada, chamada de fáscia. O cozimento do filé ainda com a fáscia causa o seu endurecimento. Com uma faca afiada, corte uma ponta da película. Levante-a em seguida e passe a faca pelo lado de dentro da fáscia (o lado que está em contato com a carne). Tente manter a lâmina da faca apontada para cima para procurar obter o maior rendimento de carne e, se conseguir, retire toda a extensão da película. *Fonte: LOBO, Rita, Cozinha Prática. Editora Senac, São Paulo, 2016.", tag: [0, 6], fav: false, hasImg: true, imgURL: "img28"),
                "25" : Tip(title: "Como abrir massas usando rolo", text: "Para abrir massas usando rolo de massa, passe farinha na superfície que irá receber a massa e também na superfície do rolo que irá tocar a massa, para evitar que grudem uma à outra. Posicione o rolo sempre no meio da massa e role ele pressionando a massa em direção à borda da massa, sempre completando o movimento até o rolo ter ultrapassado a massa por completo, sempre completando o movimento, um sentido de cada vez (para cima, para baixo ou para os lados). *Fonte: LOBO, Rita, Cozinha Prática. Editora Senac, São Paulo, 2016.", tag: [2, 9], fav: false, hasImg: true, imgURL: "img23")
            ]
            print(dict.count, dict.debugDescription)
            UserDefaults.Tips = dict
            
            print("set ud dict")
        }
        
        if userDefaults.object(forKey: "Favorites") == nil {
            let fav : Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
            print("init fav set")
            print(fav.count, fav.debugDescription)
            UserDefaults.Favorites = fav
            print("set ud fav")
        }
        
        if userDefaults.object(forKey: "Interests") == nil {
            let interests : Set<Int> = [3, 6, 1]
            print("init interests set")
            
            UserDefaults.Interests = interests
            print("set ud interests")
        }

        print("exit delegate ud init")
        
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

