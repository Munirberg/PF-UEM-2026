// ALUNO: MUNIR BERG SHEHADEH RA 145103

/// Professor, acabei que durante as semanas tive que cuidar de projetos pessoais e projetos extensionistas
/// alem de ser da organização da secomp, entao não fiz tantos exercicios da lista (só até o 10) pra conseguir
/// fazer o trabalho a tempo, perdão.
import gleam/int

pub fn concatenar_lista(lista: List(String)) -> String {
  case lista {
    [] -> ""
    [primeiro, ..resto] -> primeiro <> concatenar_lista(resto)
  }
}

pub fn tam_lista(lista: List(Int)) -> Int {
  case lista {
    [] -> 0
    [_, ..resto] -> 1 + tam_lista(resto)
  }
}

pub fn converte_strings(lista: List(Int)) -> List(String) {
  case lista {
    [] -> []
    [primero, ..resto] -> [int.to_string(primero), ..converte_strings(resto)]
  }
}

pub fn remover_vazia(lista: List(String)) -> List(String) {
  case lista {
    [] -> []
    [primeiro, ..resto] ->
      case primeiro == "" {
        True -> remover_vazia(resto)
        False -> [primeiro, ..remover_vazia(resto)]
      }
  }
}

pub fn verifica_trues(lista: List(Bool)) -> Bool {
  case lista {
    [] -> True
    [primeiro, ..resto] ->
      case primeiro {
        True -> verifica_trues(resto)
        False -> False
      }

