require 'test/unit' # Biblioteca padrao de testes, nao eh necessario instalar `a parte
require './humano'

class TesteEmHumano < Test::Unit::TestCase
  test "humano deve saber seu nome" do
    assert_equal "Fulano", Humano.new.nome
  end

  test "humano deve ter idade 0 caso ninguem fale nada" do
    assert_equal 0, Humano.new.idade
  end

  test "humano deve saber se apresentar" do
    humano = Humano.new("Zeh", 60)
    assert_equal "Ola, meu nome eh Zeh, tenho 60 anos de idade.", humano.apresentarse
  end

  test "humano sem genero deve gerar excecao quando se pergunta seu sexo" do
    assert_raise(NotImplementedError){ Humano.new.sexo }
  end

  test "humano tem q saber quando nasceu" do
    idade_do_zeh = 40
    zeh = Humano.new("Zeh", idade_do_zeh)
    ano = Time.now.year
    assert_equal "Eu nasci no ano de #{ano - idade_do_zeh}", zeh.eunasci
  end
end
