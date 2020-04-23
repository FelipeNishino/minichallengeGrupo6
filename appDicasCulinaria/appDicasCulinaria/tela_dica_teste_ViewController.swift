//
//  tela_dica_teste_ViewController.swift
//  appDicasCulinaria
//
//  Created by marcelo frost marchesan on 22/04/20.
//  Copyright © 2020 Felipe Nishino. All rights reserved.
//

import UIKit


var dicas = [
    1: """
        Evitando sujeira de farinha no preparo de receitas
        Quando for abrir uma massa e for necessitar de farinha para abrir a massa, coloque uma lâmina de filme
        plástico ou de celofane para churrasco sobre a superfície e coloque a farinha sobre o filme ou o celofane.
        Na hora de limpar, basta recolher o filme ou o celofane, evitando que a farinha fique depositada na pedra ou
        mesa.
        Dica da dica - se for utilizar o celofane, para evitar que ele escorregue sobre a superfície da pedra ou da
        mesa, adicione algumas gotas de água na superfície antes de colocar o celofane. Isto fará com que o celofane
        não escorregue.
        """,
    2: """
        Cuidados com facas e objetos cortantes
        Guarde as facas e objetos cortantes com a lâmina virada para baixo em gavetas, e tente colocar uma faca
        ao lado da outra, de forma a facilitar o acesso ao cabo, evitando cortes.
        Dica da dica - facas e objetos pontiagudos podem ser colocados com as pontas e lâminas para baixo nos
        escorredores de talheres após a lavagem, evitando machucados.
        """,
    3: """
        Posição das panelas no fogão
        Ao utilizar panelas no fogão, procure deixar os cabos apontados para fora, evitando que aqueçam muito,
        enquanto as panelas estão no fogo.
        """,
    4: """
        Conferindo o cozimento de bolos
        Para saber se uma massa de bolo está devidamente assada, abra o forno com cuidado, com o uso de luva térmica
        protetora, espete e retire um palito no meio do bolo. Se o palito sair seco, a massa está cozida. Se a massa
        ficar grudada no palito, a massa ainda deve cozinhar por mais tempo.
        Dica da dica - evite abrir o forno muitas vezes durante o cozimento de alimentos, em especial de bolos e
        doces. A abertura do forno leva a perda momentânea de calor, que faz com que a massa murche e não fique tão
        alta.
        """,
    5: """
        Cuidados no manuseio de alimentos crus
        No preparo de alimentos que envolvam produtos crus, deve-se utilizar talheres, pratos, tábuas de corte e
        equipamentos diferentes para produtos crus e aqueles já cozidos, evitando eventual contaminação do alimento
        preparado por aqueles ainda crus.
        Dica da dica - evite provar alimentos crus, como massas de bolo e doces ainda não cozidas. Muitas receitas
        levam ovo, que, por ainda estarem crus, podem transmitir doenças como salmonela.
        """,
    6: """
        Fogões e sua alimentação a gás
        Ao adquirir um fogão a gás de lojas do varejo, verifique se há necessidade de realizar a adaptação do seu
        fogão, caso o seu gás seja encanado.
        Isto porque os fogões normalmente comercializados são projetados para o gás de botijão
        (GLP), que possuem pressão maior que o gás de encanamento (GN). Assim, as empresas de eletrodomésticos
        normalmente realizam a troca de bicos que permitem a saída do gás da chama quando o usuário possui gás
        encanado, permitindo que o fogão esteja adaptado a trabalhar como uma pressão menor.
        """,
    7: """
        Disposição de produtos na geladeira
        Evite deixar ovos, leite e outros produtos sensíveis (como iogurte) na porta de geladeiras. A abertura e
        fechamento da porta do eletrodoméstico faz aumentar a temperatura dos alimentos mantidos na porta, diminuindo
        a conservação desses alimentos.
        Os ovos, além de perderem a temperatura fria, estão sujeitos a pequenas batidas a cada fechamento da porta, o
        que pode levar a fissuras nas cascas dos ovos, prejudicando sua conservação.
        """,
    8: """
        Reaquecimento de pães
        Para manter a crocância de pães amanhecidos (pães do dia anterior), umedeça a superfície do pão com água e, em
        seguida, aqueça o pão no forno baixo (180 graus), por cerca de cinco a dez minutos, a depender da quantidade
        de pães.
        """,
    9: """
            Quantidade da massa de bolo em forma
            Ao fazer um bolo, não preencha mais da metade da forma com a massa do bolo para evitar que a massa transborde
            dentro do forno por causa do crescimento quando do cozimento.
            """,
    10: """
            Untar formas de bolo
            Ao fazer um bolo, não esqueça de untar a forma que irá receber a massa do bolo.
            Para untar a forma deve-se aplicar óleo ou manteiga sobre o lado de dentro da forma ainda vazia e espalhar o
            óleo ou manteiga para que cubra toda a superfície de dentro da forma (pode-se usar um pincel culinário ou
            mesmo uma folha de guardanapo para espalhar o óleo/manteiga).
            Dica da dica: além da manteiga, pode-se polvilhar (espalhar com o auxílio de uma peneira) um pouco de farinha
            de trigo sobre a manteiga, antes de se colocar a massa do bolo.
            """,
    11: """
        lavagem de panelas e formas
        Para desgrudar queimados e gorduras nas panelas e formas antes de lavar, pode-se esfregar meio limão sobre o
        alimento grudado.
        A acidez do limão ajuda a soltar a comida, em especial a gordura, facilitando a lavagem dos equipamentos.
        Outra opção é colocar água com detergente nas panelas e levar ao fogo até a água ferver. Em seguida, co
        cuidado para não se queimar com a água quente presente na panela, efetuar a sua lavagem.
        Dica da dica: a fervura da panela com detergente leva ao aumento do volume de espuma, que pode escorrer para
        fora da panela se o fogo alto for mantido após a água começar a ferver.
        """,
    12: """
        Higiene das mãos
        Uma boa higiene deve acompanhar o preparo de qualquer alimento. Lembra-se da forma recomendada de lavar as
        mãos por causa do Novo Coronavírus? Então, trata-se da melhor forma de higienização das mãos que deve ser
        realizada antes de se manusear alimentos.
        Dica da dica: a lavagem das mãos deve ser feita sempre que se entrar em contato com carnes cruas durante o
        preparo de alimentos cozidos, para evitar uma contaminação dos equipamentos e, eventualmente, do alimento
        pronto para consumo.
        """,
    13: """
        Higiene dos equipamentos e bancada
        Além da higiene das mãos, deve-se garantir a higienização dos equipamentos que serão utilizados para
        elaboração de uma receita e também a bancada que será o local de trabalho, seja uma placa de mármore, seja uma
        pia, seja uma mesa.
        """,
    14: """
        Higiene de frutas e verduras
        Para realizar a higienização de frutas e legumes, deve-se, antes de mais nada, realizar a higienização das
        mãos, equipamentos e bancada de trabalho.
        Em seguida, efetue a remoção de folhas e talos sujos ou que não estejam em bom estado de conservação e não
        sirvam para consumo.
        Após, faça a lavagem dos alimentos em água corrente, esfregando bem todas as partes dos alimentos.
        Deixe os alimentos de molho em produtos próprios para higienização de alimentos ou em água sanitária diluída
        em água potável, conforme as orientações de cada fabricante constantes nas respectivas embalagens.
        Ao final, remova o produto ou água sanitária dos alimentos em água corrente novamente e espere secar para
        poder consumir.
        """,
    15: """
        Usando ovo cru como ingrediente
        Ao preparar receitas que recebam ovos crus no seu preparo, evite quebrar e colocar os ovos crus diretamente
        sobre os demais ingredientes.
        Se possível, quebre um ovo de cada vez sobre um pote ou recipiente separado e, em seguida, adicione o ovo aos
        demais ingredientes, utilizando o pote ou recipiente para quebrar o próximo ovo, assim por diante.
        Quebrar ovos sobre um recipiente separado permite verificar se o ovo está com boa aparência e em condições de
        consumo e também evita que pedaços de casca caiam diretamente sobre os demais ingredientes, evitando o
        retrabalho ou desperdícios dos demais ingredientes.
        """,
    16: """
        Como abrir um ovo cru
        Para abrir um ovo ainda cru, bata a casca do ovo gentilmente na borda de um pote ou outro equipamento, ou
        mesmo bata de leve com as costas de uma faca (parte sem a lâmina) ou colher. Em seguida, gire o ovo e bata de
        leve do outro lado, sem abrir o ovo.
        Inicie sempre com pouca força e vá aumentando a intensidade aos poucos, até perceber que criou uma rachadura
        na casca.
        Uma vez que tenha rachaduras em lados opostos, segure o ovo com as duas mãos e pressione os dedões contra a
        mesma rachadura, puxando cada metade da casca para sua mão. Faça o movimento com calma e sem pressa sobre um
        pote, garantindo que o ovo caia diretamente sobre o recipiente.
        """,
    17: """
        Como abrir um ovo cozido
        Após ter cozido o ovo, espere o mesmo esfriar para evitar queimar as mãos.
        Com o auxílio de uma colher ou outro talher, bata na casca do ovo para gerar algumas rachaduras e fissuras. Em
        seguida, puxe a casca e localize uma membrana transparente que fica entre a casca e a clara cozida. Retire
        também esta membrana e repita o processo ao longo de todo o ovo.
        Em seguida, caso necessário, escorra o ovo em água corrente para garantir que não haverá pedaços de casca
        grudados na clara.
        """,
    18: """
        Dicas de congelamento 1
        Para a melhor conservação de alimentos no freezer, deve-se evitar a presença de ar nas embalagens dos
        alimentos que serão congelados, garantindo uma conservação maior dos alimentos.
        Procure separar os alimentos por tipos, agrupando-os dentro do congelador (vegetais, frutas, massas e carnes
        devem ser alocados em conjunto com os alimentos semelhantes).
        No caso das carnes, deve-se procurar separar, inclusive, pela origem da proteína (por exemplo: proteínas de
        aves, frutos do mar, carnes de porco, carnes de vaca).
        """,
    19: """
        Dicas de congelamento 2
        Ao preparar alguns alimentos para serem congelados e armazenados para consumo futuro, não há necessidade de
        cozimento completo dos alimentos.
        Isto porque o descongelamento fará o reaquecimento dos alimentos, completando o cozimento e evitando que
        percam as características originais dos alimentos (como a suculência).
        Após o cozimento dos alimentos, armazene-os no recipiente apropriado para congelamento e leve ao refrigerador
        (geladeira) imediatamente, para, em seguida, levar ao congelador.
        O tempo de resfriamento no resfriador (geladeira), pode ser o dobro do tempo de cozimento. Ao final desse
        tempo, o produto deve ir diretamente ao freezer.
        Dica da dica: não espere o alimento cozido esfriar em temperatura ambiente. Isto aumentará a proliferação de
        bactérias, diminuindo a duração do alimento congelado.
        """,
]


class tela_dica_teste_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet var tela_dica_view: UIView!
    
    @IBOutlet weak var scrollview_tela_dica: UIScrollView!
    
    @IBOutlet weak var textview_tela_dica: UITextView!
    
    
    @IBOutlet weak var tela_dica_scrollview: UIView!
    
    @IBOutlet weak var navigation_bar_tela_dica: UINavigationBar!
    
    @IBOutlet weak var tab_bar_tela_dica: UITabBar!
    
}
