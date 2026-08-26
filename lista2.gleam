import gleam/float
import gleam/int
import gleam/string
import sgleam/check
//ALUNO MUNIR BERG SHEHADEH RA145103


// exec 13
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

// exec  14
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

// exec  15
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

// exec 16
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

// exec 17
///Aumenta o valor de *valor* com base na *porcentagem*/100  recebida. 
///
pub fn aumenta(valor: Float, porcentagem: Float) -> Float {
  valor *. { 1.0 +. porcentagem /. 100.0 }
}

// exec 18
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

// exec  19
/// Verifica se a String tem ou não ponto final, caso tenha, retorna a String normalmente
// Caso contrário, adiciona e retorna a String com ponto

pub fn verifica(palavra: String) {
  let tam = string.length(palavra)
  let ultimo = string.slice(palavra, tam - 1, tam)
  case ultimo != "." {
    True -> palavra <> "."
    False -> palavra
  }
}

// exec  20
// professor nao entendi se aqui eu poderia usar case ou nao... Em teoria nao é estrutura condic. certo?
//Verifica se a String tem no meio um traço, caso exista esse traço retorna True, caso contrareio, False
pub fn verifica_traco(palavra: String) -> Bool {
  string.contains(palavra, "-")
}

// exec  21
// Recebe tres numeros e verifica qual o maior dos tres, onde no final retorna ele
pub fn verifica_numberr(n: Int, p: Int, m: Int) {
  case n >= p && n >= m {
    True -> n
    False ->
      case p > n && p > m {
        True -> p
        False -> m
      }
  }
}

// exec  22
//Recebe um numero natural e String como parametro, onde com base no valor de n, troca os primeiros
// primeiros n caracteres da string por n letras "x".
pub fn troca_troca(n: Int, palavra: String) {
  let primeiros = string.slice(palavra, n, string.length(palavra) - n)
  string.repeat("x", n) <> primeiros
}

// exec 23
// Verifica se um texto começa ou termina com espaço, onde caso não exista tais espaços extras
// retorna True, caso contrário,False
pub fn sem_espacos_extras(texto: String) {
  let tam = string.length(texto)
  let primeiro = string.slice(texto, 0, 1)
  let ultimo = string.slice(texto, tam - 1, tam)
  case primeiro != " " && ultimo != " " {
    True -> True
    False -> False
  }
}

// exec 24
//pub fn denhero()

// exec 25
//verifica se uma palavra é feita por duas partes iguais, ou seja, uma metade é igual a outra, caso seja, retorna 
//True, caso não sejam iguais, False
pub fn verifica_dup(palavra: String) {
  let new_pal = string.replace(palavra, "-", "")
  let tam = string.length(new_pal)
  let metade = tam / 2
  let metade_palav1 = string.slice(new_pal, 0, metade)
  let metade_palav2 = string.slice(new_pal, metade, tam)
  case metade_palav1 == metade_palav2 {
    True -> True
    False -> False
  }
}

// exec 26
// Recebe o tamanho de uma parede sendo sua altura e largura, onde consierando que cada azulejo tem 20cm de lado, 
// Calcula a quantidade necessária de azulejos para cobrir a parede, podendo recortar o azulejo para ter cobrir tudo
pub fn construtor(largura: Float, altura: Float) {
  let area = largura *. altura
  let area_azul = 0.2 *. 0.2
  let resultado = area /. area_azul
  float.ceiling(resultado)
}

// exec 27
// Rotaciona uma *palavra* em *n* casas a direita.
pub fn rotaciona(n: Int, palavra: String) {
  let tamanho = string.length(palavra)
  let fim = string.slice(palavra, -n, n)
  let comeco = string.slice(palavra, 0, tamanho - n)
  fim <> comeco
}

//exec 28
// Recebe um numero de telefone com DDD e verifica se, sem contar o ddd há 9 digitos, caso não tenha, adiciona o
// nono digito e retorna o novo numero, caso tenha, retorna o proprio numero
pub fn nove_digit(numero: String) {
  let tam = string.length(numero)
  let ddd = string.slice(numero, 0, 5)
  let sem_9 = string.slice(numero, 5, 9)
  case tam == 15 {
    True -> numero
    False -> ddd <> "9" <> sem_9
  }
}

// exec 29 nao consegui fazer 

// exec 30
//Verifica se é palindromo de 4 digitios, onde pra ser palindromo, o numero de tras pra frente tem que ser
// o mesmo de frentre pra tras
pub fn palindromo_questionmark(number: Int){
  let texto = int.to_string(number)
  texto == string.reverse(texto)
}
// Sim, da foma acima aceita todos os tipos de entrada.. :)
