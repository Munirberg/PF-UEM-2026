import gleam/int
import gleam/string

pub fn area_retangulo(largura, altura) {
  largura *. altura
}

pub fn produto_anterior_posterior(n) {
  n * { n + 1 } * { n - 1 }
}

pub fn eh_par(n) {
  n % 2 == 0
}

pub fn tem_tres_digitos(n) {
  n >= 100 && n <= 99
}

pub fn maximo(n1, n2) {
  case n1 > n2 {
    True -> n1
    False -> n2
  }
}

pub fn ordem(x, y, z) {
  case x > y && y > z {
    True -> "Decrescente"
    False ->
      case x < y && y < z {
        True -> "Crescente"
        False -> "Sem ordem"
      }
  }
}

pub fn so_primeira_maiuscula(x) {
  let maiuscula = string.uppercase(string.slice(x, 0, 1))
  let minusculas = string.lowercase(string.slice(x, 1, string.length(x) - 1))
  maiuscula <> minusculas
}

pub fn a_plus_abs_b(a, b) {
  case b > 0 {
    True -> int.add
    False -> int.subtract
  }(a, b)
}
// o que ocorre aqui é basicamente a soma de a mais o modulo de b, já que o gleam
// começa analisando se b é maior que zero, se for, ele soma a e b (case resulta em int.add(a, b))
// se b for menor, ou seja negativo, ele realiza a subtração de -b com a, basicamente a soma de a e b tambem


fn p() {
p()
}
fn teste(x, y) {
case x == 0 {
True -> 0
False -> y
}
}
teste(0, p())
// em um interpretador de ordem APLICATIVA, vai ocorrer um loop infinito, já que ele observa normalemnte o valor
// de x (o priomeiro argumento0 normalmente), mas ao passar para o segundo, ele realiza a chamada da função
// assim executando o loop...
// JÁ NO MODO NORMAL, o interpretado retorna 0, já que os argumentos não são analisados antes, então o inter
//realiza normalmente a função, verificando o case e vendo que x é zero, assim retornando 0 
