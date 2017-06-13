require('./humano')

class Mulher < Humano

  # Aqui recebemos uma hash como ultimo parametro para construir uma instancia
  # da classe Mulher. Isso significa que qualquer atributo que queiramos incluir
  # na criacao da instancia sera utilizado, e ira gerar getters e setters.
  def initialize(nome = "Fulana", idade = "", hash_args)
    # o metodo `super` chama o metodo `initialize` da classe pai. No caso, a
    # classe `Humano` possui um método initialize definido com apenas dois
    # parametros. A classe pai nao sabe o que fazer com a hash, esta hash
    # somente eh util dentro desta classe
    super(nome, idade)

    hash_args.each do |chave, valor|
      self.class.instance_eval do
        attr_accessor chave.to_sym
      end
      instance_variable_set("@#{chave}", valor)
    end
  end

  def falar
    "Bla" * 20
  end

  def sexo
    "Feminino"
  end
end
