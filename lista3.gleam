import gleam/int
import gleam/string
import sgleam/check

/// Produz True se uma pessoa com *idade* é isento da
/// tarifa de transporte público, isto é, tem menos
/// que 18 anos ou 65 ou mais. Produz False caso contrário.
pub fn isento_tarifa(idade: Int) -> Bool {
  case idade < 18 || idade > 60 {
    True -> True
    False -> False
  }
}

pub fn isento_tarifa_examples() {
  check.eq(isento_tarifa(17), True)
  check.eq(isento_tarifa(18), False)
  check.eq(isento_tarifa(50), False)
  check.eq(isento_tarifa(65), True)
  check.eq(isento_tarifa(70), True)
}

/// Conta a quantidade de dígitos de *n*.
/// Se *n* é 0, então devolve zero.
/// Se *n* é menor que zero, então devolve a quantidade
/// de dígitos do valor absoluto de *n*.
pub fn quantidade_digitos(n: Int) -> Int {
  let stri = int.to_string(n)
  let tam = string.length(stri)
  case n == 0 {
    True -> 0
    False ->
      case n < 0 {
        True -> tam - 1
        False -> tam
      }
  }
}

pub fn quantidade_digitos_examples() {
  check.eq(quantidade_digitos(123), 3)
  check.eq(quantidade_digitos(0), 0)
  check.eq(quantidade_digitos(-1519), 4)
}

/// Produz True se uma pessoa com *idade* é supercentenária,
/// isto é, tem 110 anos ou mais, False caso contrário.
pub fn supercentenario(idade: Int) -> Bool {
  case idade > 110 {
    True -> True
    False -> False
  }
}

pub fn supercentenario_examples() {
  check.eq(supercentenario(101), False)
  check.eq(supercentenario(110), False)
  check.eq(supercentenario(112), True)
}

/// Transforma a string *data* que está no formato "dia/mes/ano"
/// para o formato "ano/mes/dia".
///
/// Requer que o dia e o mês tenham dois dígitos e que
/// o ano tenha quatro dígitos.
pub fn dma_para_amd(data: String) -> String {
  let dia = string.slice(data, 0, 2)
  let mes = string.slice(data, 2, 4)
  let ano = string.slice(data, 6, 4)
  ano <> mes <> dia
}

pub fn dma_para_amd_examples() {
  check.eq(dma_para_amd("19/07/2023"), "2023/07/19")
  check.eq(dma_para_amd("01/01/1980"), "1980/01/01")
  check.eq(dma_para_amd("02/02/2002"), "2002/02/02")
}

///Aumenta o valor de *valor* com base na *porcentagem*/100  recebida. 
///
pub fn aumenta(valor: Float, porcentagem: Float) -> Float {
  valor *. { 1.0 +. porcentagem /. 100.0 }
}

///Verifica se o tamanho do *nome* é curto, médio ou longo, onde com 4 ou menos letras é curto
///entre 4 e 10, ou 10, é medio, maior que 10 longo.
pub fn tamanho_nome(nome: String) -> String {
  case string.length(nome) <= 4 {
    True -> "curto"
    False ->
      case string.length(nome) <= 10 {
        True -> "médio"
        False -> "longo"
      }
  }
}

/// tem q fazer especific
pub fn verifica(palavra: String) {
  let tam = string.length(palavra)
  let ultimo = string.slice(palavra, tam - 1, tam)
  case ultimo != "." {
    True -> palavra <> "."
    False -> palavra
  }
}

Projete uma função que determine se uma palavra tem um traço ("-") no meio, como por exemplo,
"lero-lero". Não use nenhum condicional na implementação.]
