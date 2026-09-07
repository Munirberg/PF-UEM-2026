import gleam/int
import gleam/option.{type Option, None, Some}
import gleam/string

pub type Direcao {
  Norte
  Sul
  Leste
  Oeste
}

// 10 A)
//Recebe uma direção da rosa dos ventos e retorna o contrário dela
pub fn contrario(d: Direcao) {
  case d {
    Norte -> "Sul"
    Sul -> "Norte"
    Leste -> "Oeste"
    Oeste -> "Leste"
  }
}

// B)
// Recebe uma direção da rosa dos ventos e retorna a direção 90 graus a direita em relacao a ela
pub fn noventa(d: Direcao) {
  case d {
    Norte -> "Leste"
    Sul -> "Oeste"
    Leste -> "Sul"
    Oeste -> "Norte"
  }
}

/// C) 
// Recebe uma direção da rosa dos ventos e retorna a direção 90 graus a esquerda em relacao a ela

pub fn noventa_anti(d: Direcao) {
  case d {
    Norte -> "Oeste"
    Sul -> "Leste"
    Leste -> "Norte"
    Oeste -> "Sul"
  }
}

// d)

// 11 A)
pub type Elevador {
  Parado
  Subindo
  Descendo
}

// Recebe o andar atual e o próximo de um elevador, falando se sua próxima condição é subindo, descendo ou parado
pub fn situacao(att: Int, novo: Int) -> Elevador {
  case att == novo {
    True -> Parado
    False ->
      case att > novo {
        True -> Descendo
        False -> Subindo
      }
  }
}

// B)
// Verifica se um elevador pode subir ou descer pra outro andar, elevadores que estiverem subindo não podem
// ir para um andar abaixo e vice-versa
pub fn pode(e: Elevador, p: Elevador) -> Bool {
  case e {
    Parado ->
      case p {
        Parado -> True
        Subindo -> True
        Descendo -> True
      }
    Subindo ->
      case p {
        Parado -> True
        Subindo -> True
        Descendo -> False
      }
    Descendo ->
      case p {
        Subindo -> False
        Parado -> True
        Descendo -> True
      }
  }
}

//13 A)
pub type Figuras {
  Retangulo(altura: Float, largura: Float)
  Circulo(raio: Float)
}

// calcula a area de um retangulo ou um circulo
pub fn descobre_figura(fig: Figuras) {
  case fig {
    Retangulo(_, _) -> fig.altura *. fig.largura
    Circulo(_) -> 3.14 *. fig.raio
  }
}

// 13 b) nao fiz

// 14 A) 
pub type Cinema {
  Crianca
  Jovem(carteirinha: Option(Int))
  Adulto
  Idoso
}

// Verifica se a pessoa é jovem e tem uma carteirinha
pub fn carteira(sala: Cinema) -> Option(Int) {
  case sala {
    Jovem(carteirinha) -> carteirinha
    _ -> None
  }
}

// 14 B)
//  Verifica se um cinéfolo pode receber um desconto no cinema ou não, Criancas, idosos e jovem COM carteirinha 
// podem, do contrario nao
pub fn desconto(sala: Cinema) -> Bool {
  case sala {
    Crianca -> True
    Idoso -> True
    Adulto -> False
    Jovem(Some(_)) -> True
    Jovem(None) -> False
  }
}

//15 A)
pub type Data {
  Data(dia: Int, mes: Int, ano: Int)
}

// inverte a data de string para int, colocando na estrutura
pub fn inverte(data: String) -> Option(Data) {
  case string.split(data, "/") {
    [string_dia, string_mes, string_ano] -> {
      case int.parse(string_dia), int.parse(string_mes), int.parse(string_ano) {
        Ok(dia), Ok(mes), Ok(ano) -> Some(Data(dia, mes, ano))
        _, _, _ -> None
      }
    }
    _ -> None
  }
}

// 15 B)
//Verifica se é o ultimo dia do ano, caso for retorna true, se não for, false
pub fn verifica_data(data: String) -> Bool {
  case string.split(data, "/") {
    [string_dia, string_mes, string_ano] -> {
      case int.parse(string_dia), int.parse(string_mes), int.parse(string_ano) {
        Ok(dia), Ok(mes), Ok(_ano) ->
          case dia == 31 && mes == 12 {
            True -> True
            False -> False
          }
        _, _, _ -> False
      }
    }
    _ -> False
  }
}

// 15 C)
// Verifica se a data 1 vem antes da data 2, se sim, retorna true, caso não, false
pub fn verifica_duas_datas(data1: Data, data2: Data) -> Bool {
  case data1.ano <= data2.ano {
    True ->
      case data1.mes <= data2.mes {
        True ->
          case data1.dia < data2.dia {
            True -> True
            False -> False
          }
        False -> False
      }
    False -> False
  }
}

// 15 D não fiz, não entendi

// 16)
pub type Boletim {
  Boletim(nota1: Float, nota2: Float, nota3: Float, nota4: Float)
}

// calcula a media aritmetica simples de 4 notas de um aluno, alunos que tiraram 7 pra cima passam de ano, alunos 
// abaixo de 7 e acima de 4 estão de exame, alunos que tiraram abaixo de 4 reprovaram
pub fn calcula_media(notas: Boletim) -> String {
  let resultado =
    { notas.nota1 +. notas.nota2 +. notas.nota3 +. notas.nota4 } /. 4.0
  case resultado >=. 7.0 {
    True -> "Aprovado"
    False ->
      case resultado <. 7.0 && resultado <=. 4.0 {
        True -> "Exame"
        False -> "Reprovado"
      }
  }
}

// 17)
pub type Bandeira {
  Verde
  Amarela
  Vermelhapat1
  Vermelhapat2
}

// Recebe o consumo kilowatt-hora e a bandeira tarifaria de uma pessoa, retornando o valor a ser pago da conta
//bandeira verde não sofre acrecimos, bandeira amarela sofre 0.01874, vermelha patamar 1 sofre 0.03971 e
// bandeira vermelha patamar 2 sofrem 0.09492 de acrecimos
pub fn sistema_bandeira(kwh: Float, bandeira: Bandeira, tarifa: Float) -> Float {
  case bandeira {
    Verde -> kwh *. tarifa
    Amarela -> kwh *. { tarifa +. 0.01874 }
    Vermelhapat1 -> kwh *. { tarifa +. 0.03971 }
    Vermelhapat2 -> kwh *. { tarifa +. 0.09492 }
  }
}

// 18)
pub type Jokenpo {
  Tesoura(nome: String)
  Papel(nome: String)
  Pedra(nome: String)
}
// Determina quem ganhou numa disputa de jokenpo com base na jogada e no nome da pessoa, pedra ganha de tesoura
// e perde pra papel, papel ganha e pedra e perde tesoura, tesoura ganha de papel perde pedra
pub fn partida(jogador1: Jokenpo, jogador2: Jokenpo) -> String {
  case jogador1, jogador2 {
    Tesoura(_), Tesoura(_) -> "Empate!"
    Tesoura(nome), Papel(_) -> nome <> " ganhou!"
    Tesoura(_), Pedra(nome) -> nome <> " ganhou!"
    Pedra(_), Pedra(_) -> "Empate!"
    Pedra(nome), Tesoura(_) -> nome <> " ganhou!"
    Pedra(_), Papel(nome) -> nome <> " ganhou!"
    Papel(_), Papel(_) -> "Empate!"
    Papel(nome), Pedra(_) -> nome <> " ganhou!"
    Papel(_), Tesoura(nome) -> nome <> " ganhou!"
  }
}

// 19)
pub type Time {
  Time(pontos: Int, vitorias: Int, saldo_gols: Int)
}
// Muda os pontos, vitoria e saldo de gols de um time de futebol com base na partida, recebe gols feitos e gols
//sofridos na partida, vitórias contabilizam 3 pontos na pontuacao e soma 1 na vitoria, empates somam 1 ponto na
// pobtuacao
pub fn partidafut(time: Time, gols_feitos: Int, gols_sofridos: Int) -> Time {
  case gols_feitos > gols_sofridos {
    True ->
      Time(
        time.pontos + 3,
        time.vitorias + 1,
        time.saldo_gols + gols_feitos - gols_sofridos,
      )
    False ->
      case gols_feitos == gols_sofridos {
        True ->
          Time(
            time.pontos + 1,
            time.vitorias,
            time.saldo_gols + gols_feitos - gols_sofridos,
          )
        False ->
          Time(
            time.pontos,
            time.vitorias,
            time.saldo_gols + gols_feitos - gols_sofridos,
          )
      }
  }
}

// 20) A e B:
pub type Tempo {
  Tempo(horas: Int, minutos: Int, segundos: Int)
}
// Recebe a quantidade de segundoas que um APP ficou aberto, retornando quantos esses segundos são em horas
// minutos e segundos
pub fn transformador(segundos: Int) -> Tempo {
  let horas = segundos / 3600
  let resto = segundos % 3600
  let minutos = resto / 60
  let segundos = resto % 60
  let tempo = Tempo(horas, minutos, segundos)
  tempo
}
// transforma o tempo que está em int em uma string, onde horas, minutos ou segundos zerados não são colocados
// na string
pub fn conversor(tempo: Tempo) {
  let str_horas = case tempo.horas != 0 {
    True -> int.to_string(tempo.horas) <> " horas,"
    False -> ""
  }
  let str_minutos = case tempo.minutos != 0 {
    True -> int.to_string(tempo.minutos) <> " minutos"
    False -> ""
  }
  let str_segundos = case tempo.segundos != 0 {
    True -> int.to_string(tempo.segundos) <> " segundos"
    False -> ""
  }

  "O programa ficou aberto por: " <> str_horas <> str_minutos <> str_segundos
}

// 21
// aproveitei pra reutilizar o direcao do exercicio do comeco da lista

pub type Personagem {
  Personagem(linha: Int, coluna: Int, direcao: Direcao)
}
// verifica o máximo de casas que um personagem pode seguir com base na sua posicao no tabuleiro 10x10
// e sua direcao, o personagem NAO PODE estourar o tamanho do tabuleiro
pub fn max_casas(perso: Personagem) -> Int {
  case perso.direcao {
    Norte -> 10 - perso.linha
    Sul -> perso.linha - 1
    Leste -> 10 - perso.coluna
    Oeste -> perso.coluna - 1
  }
}

// 22 A)
pub type Mouse {
  Mouse(linha: Int, coluna: Int)
}

pub type Janela {
  Janela(topo: Int, esquerda: Int, largura: Int, altura: Int)
}
// verifica se o clique de um mouse foi em uma janela, onde recebe a largura e altura da janela, verificando se
// se o clique do mouse está dentro dessa janela 
pub fn clique_na_janela(janela: Janela, clique: Mouse) -> Bool {
  let coluna_jan =
    clique.coluna >= janela.esquerda
    && clique.coluna < janela.esquerda + janela.largura

  let linha_janela =
    clique.linha >= janela.topo && clique.linha < janela.topo + janela.altura

  coluna_jan && linha_janela
}

// 23)
// reaprovetei as estruturas e etc do Personagem e da Direcao
pub type Comando {
  VirarEsq
  VirarDir
  Avancar(casas: Int)
}


pub fn executar_comando(p: Personagem, cmd: Comando) -> Personagem {
  case cmd {
    VirarEsq ->
      case p.direcao {
        Norte -> Personagem(..p, direcao: Oeste)
        Oeste -> Personagem(..p, direcao: Sul)
        Sul -> Personagem(..p, direcao: Leste)
        Leste -> Personagem(..p, direcao: Norte)
      }
    VirarDir ->
      case p.direcao {
        Norte -> Personagem(..p, direcao: Leste)
        Leste -> Personagem(..p, direcao: Sul)
        Sul -> Personagem(..p, direcao: Oeste)
        Oeste -> Personagem(..p, direcao: Norte)
      }
    Avancar(casas) ->
      case p.direcao {
        Norte -> {
          let nova = p.linha + casas
          let linha_final = case nova > 10 {
            True -> 10
            False -> nova
          }
          Personagem(..p, linha: linha_final)
        }
        Sul -> {
          let nova = p.linha - casas
          let linha_final = case nova < 1 {
            True -> 1
            False -> nova
          }
          Personagem(..p, linha: linha_final)
        }
        Leste -> {
          let nova = p.coluna + casas
          let coluna_final = case nova > 10 {
            True -> 10
            False -> nova
          }
          Personagem(..p, coluna: coluna_final)
        }
        Oeste -> {
          let nova = p.coluna - casas
          let coluna_final = case nova < 1 {
            True -> 1
            False -> nova
          }
          Personagem(..p, coluna: coluna_final)
        }
      }
  }
}

// 24 
pub type Pagamento {
  Dinheiro
  Pix
  Boleto
  CartaoAte3x
  CartaoMais3x(parcelas: Int)
}
// Verifica a forma de pagament do cliente e a aplicação de um desconto, pagamentos no pix ou dinheiro dao 10%de 
// desconto, no boleto 8%, no cartao mais de 3x, dão um acrescimo dew 12% por parcela
pub fn forma_pagamento(pag: Pagamento, preco: Float) -> Float {
  case pag {
    Dinheiro -> preco *. 0.9
    Pix -> preco *. 0.9
    Boleto -> preco *. 0.92
    CartaoMais3x(_parcelas) -> preco *. 1.12
    CartaoAte3x -> preco
  }
}

// 25

pub type Embalagem {
  Envelope(comprimento: Float, largura: Float)
  Caixa(comprimento: Float, largura: Float, altura: Float)
  Rolo(comprimento: Float, diametro: Float)
}
// verifica se uma embalagem segue a especificação, um envelope é valido se seu comprimento é no min16 cm e max 60,
// largura de min 11 cm e max 60, altura de 27cm e 120 cm, uma caixa é valida se seu comprimento é de no min 15 cm e
// max de 100 cm, largura de min 10 cm e max 100 cm, Altura (A) 1 cm 100 cm, Soma (C + L + A) 26 cm 200 cm,
//rolos Comprimento (C) 18 cm 100 cm, Diâmetro (D) 5 cm 91 cm e Soma (C + 2D) 28 cm 200 cm
pub fn embalagem_valida(embalagem: Embalagem) -> Bool {
  case embalagem {
    Envelope(comp, larg) -> {
      let soma = comp +. larg
      comp >=. 16.0
      && comp <=. 60.0
      && larg >=. 11.0
      && larg <=. 60.0
      && soma >=. 27.0
      && soma <=. 120.0
    }
    Caixa(comp, larg, alt) -> {
      let soma = comp +. larg +. alt
      comp >=. 15.0
      && comp <=. 100.0
      && larg >=. 10.0
      && larg <=. 100.0
      && alt >=. 1.0
      && alt <=. 100.0
      && soma >=. 26.0
      && soma <=. 200.0
    }
    Rolo(comp, diam) -> {
      let soma = comp +. 2.0 *. diam
      comp >=. 18.0
      && comp <=. 100.0
      && diam >=. 5.0
      && diam <=. 91.0
      && soma >=. 28.0
      && soma <=. 200.0
    }
  }
}

