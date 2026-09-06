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

