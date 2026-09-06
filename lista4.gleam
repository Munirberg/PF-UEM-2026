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
pub fn contrario(d: Direcao) {
  case d {
    Norte -> "Sul"
    Sul -> "Norte"
    Leste -> "Oeste"
    Oeste -> "Leste"
  }
}

// B)
pub fn noventa(d: Direcao) {
  case d {
    Norte -> "Leste"
    Sul -> "Oeste"
    Leste -> "Sul"
    Oeste -> "Norte"
  }
}

/// C) 
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

// 12 A)
pub type Megapixel {
  Megapixel(altura: Int, largura: Int)
}

//13 A)
pub type Figuras {
  Retangulo(altura: Float, largura: Float)
  Circulo(raio: Float)
}

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

pub fn carteira(sala: Cinema) -> Option(Int) {
  case sala {
    Jovem(carteirinha) -> carteirinha
    _ -> None
  }
}

// 14 B)
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

pub fn calcula_media(notas: Boletim) -> Bool {
  let resultado =
    { notas.nota1 +. notas.nota2 +. notas.nota3 +. notas.nota4 } /. 4.0
  case resultado >=. 7.0 {
    True -> True
    False ->
      case resultado <. 7.0 && resultado <=. 4.0 {
        True -> True
        False -> False
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

pub fn transformador(segundos: Int) -> Tempo {
  let horas = segundos / 3600
  let resto = segundos % 3600
  let minutos = resto / 60
  let segundos = resto % 60
  let tempo = Tempo(horas, minutos, segundos)
  tempo
}

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

pub fn clique_na_janela(janela: Janela, clique: Mouse) -> Bool {
  let coluna_jan =
    clique.coluna >= janela.esquerda
    && clique.coluna < janela.esquerda + janela.largura

  let linha_janela =
    clique.linha >= janela.topo && clique.linha < janela.topo + janela.altura

  coluna_jan && linha_janela
}

// 23)
