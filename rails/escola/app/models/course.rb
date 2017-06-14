class Course < ApplicationRecord
  # esta associacao define um metodo `classroom` para toda instancia de Course,
  # que faz uma query no banco
  belongs_to :classroom

  # Agora adicionamos as validacoes de nome e descricao
  validates_presence_of :name, :description

  # definindo um metodo que delega a responsabilidade de responder por um
  # atributo a um registro associado
  delegate :capacity, to: :classroom

  # E aqui soh usamos o metodo para dizer se existem vagas disponiveis na salas.
  # Como no momento nao temos inscritos, isso aqui resolve o problema. Mas
  # quando houverem inscritos a cena muda, e teremos entao que reescrever esse
  # teste, considerando a capacidade e a quantidade de inscritos
  def has_places?
    capacity > 0
  end
end
