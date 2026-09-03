/////

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

pub fn cabe(fig1: Figuras, fig2: Figuras){
  case fig1, fig2{
    Retangulo(_, _), Retangulo(_, _) -> fig1. altura <= fig2.altura && fig1.largura <= fig1.altura
    Circulo(_), Retangulo(_, _) -> case 
  }
}
