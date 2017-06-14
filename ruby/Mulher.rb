# Precisamos importar o arquivo com a superclasse para que ela possa ser
# utilizada
require('./humano')

class Mulher < Humano

  # Aqui recebemos uma hash como ultimo parametro para construir uma instancia
  # da classe Mulher. Isso significa que qualquer atributo que queiramos incluir
  # na criacao da instancia sera utilizado, e ira gerar getters e setters.
  def initialize(nome = "Fulana", idade = "", hash_args = {})
    # o metodo `super` chama um metodo na classe pai. Neste caso, porque o nome
    # deste metodo eh `initialize`, o super vai enviar uma mensagem
    # `:initialize` na classe pai da classe atual (classe `Humano`).
    # A classe Humano possui um método initialize definido com apenas dois
    # parametros, por isso aqui chamamos o `super` apenas com estes dois.
    # Esta hash passada como 3o parametro serve apenas para esta classe
    super(nome, idade)

    # `.each` eh um iterador sobre colecoes, neste caso aqui, espera-se que a
    # colecao retorne pares de objetos, o que funciona corretamente com Hashes.
    # Se vc quiser tentar executar um Mulher.new('fulana', 50, ['a','b','c']) voce vai
    # entender o que ocorre quando se tenta iterar sobre um array esperando
    # pares
    hash_args.each do |chave, valor|
      # descomente abaixo caso queira passar um array
      #puts "Chave: #{chave}, valor: #{valor}"
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
