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
