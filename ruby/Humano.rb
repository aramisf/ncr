class Humano

  # Metodo construtor de classe. Disponibiliza um `Humano.new`
  def initialize(nome = "Fulano", idade = nil)
    @nome = nome
    @idade = idade || 0
  end

  # `attr_acessor` cria os metodos getter e setter para o atributo `nome` (pode
  # ser escrito em qualquer lugar dentro desta classe)
  attr_accessor :nome

  # Sobrescrevendo `attr_reader` do atributo `idade`:
  def idade
    @idade
  end

  # Sobrescrevendo o `attr_writer` do atributo `idade`:
  def idade=(idade)
    @idade = idade
  end

  # Metodo que usa metodos internos da instancia para formar uma
  def apresentarse
    "Ola, meu nome eh #{nome}, tenho #{idade} anos de idade."
  end

  # Este método utiliza diretamente o valor da variavel de instancia
  def eunasci
    "Eu nasci no ano de #{Time.now.year - @idade}"
  end

  # Implementando um metodo que sabe-se que devera ser implementado nas classes
  # filhas. Gerar um erro aqui indica (ao programador) que a implementacao deste
  # metodo nas classes filhas eh obrigatoria
  def sexo
    raise NotImplementedError, "Filho, faz favor, use uma subclasse"
  end
end
