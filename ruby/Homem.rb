# Precisamos importar o arquivo com a superclasse para que ela possa ser
# utilizada
require('./humano')

class Home < Humano # Sim, sem o `m` ao final, mostrando que nao ha resticao
                    # entre nome de classe e de arquivo

  def falar
    "Bla"
  end

  def sexo
    "Masculino"
  end

  # Definindo um array grande que contera as variantes entre os metodos a serem
  # gerados dinamicamente
  ARRAY_GIGANTE = [
    'nome', 'email', 'endereco',
    'cidade', 'cpf', 'nascimento', 'estado'
  ]

  ARRAY_GIGANTE.each do |dado|
    # getters - definindo getters dinamicamente, note que essa tecnica eh util
    # para os casos onde existe grande similaridade no comportamento dos metodos
    # sendo definidos
    define_method "#{dado}_do_cliente" do
      v = "#{dado}_do_cliente"
      instance_variable_get("@#{v}")
    end

    # setters - o mesmo vale para os setters, note a diferenca no nome do metodo
    # que recebe um sinal de atribuicao
    define_method "#{dado}_do_cliente=" do |valor|
      v = "#{dado}_do_cliente"
      instance_variable_set("@#{v}", valor)
    end
  end
end
