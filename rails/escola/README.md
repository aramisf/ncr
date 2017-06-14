# Sistema de Matrículas

Este arquivo pretende servir como um guia, reunindo os comandos executados para
implementar o sistema apresentado no curso.

Assumo que você chegou aqui a partir do
[README.rails.md](https://github.com/aramisf/ncr/blob/master/README.rails.md), e
portanto você já tem o ruby e o rails instalados no seu sistema. Se isso não for
verdade, volte [ali](https://github.com/aramisf/ncr/blob/master/README.rails.md)
e instale.


## Salas

Nossa primeira entidade a ser construída no sistema será a Sala de aula.
Que atributos são necessários para que esta sala seja ulitizada?

  - Precisamos identificar uma sala, então podemos adicionar um número.
  - Também é necessário saber quantos alunos a sala comporta, então precisamos
    adicionar também a capacidade.

    rails generate scaffold Classroom number:integer capacity:integer
    <...>
    rails db:migrate # ou rake db:migrate

O comando `rails db:migrate` (ou `rake db:migrate`) serve para migrar a base de
dados, criando e/ou atualizando as tabelas que a compõe.

### Testes para as Salas

Sabemos que uma sala não pode ser referenciada se não houver um número que a
identifique, logo, temos que o número da sala é um parâmetro obrigatório.

    # test/models/classroom_test.rb
    class ClassroomTest < ActiveSupport::TestCase
      test "should not be valid without a number" do
        room = Classroom.new
        assert_nil room.number
        refute room.valid?
        room.number = 100
        assert room.valid?
      end

Executando este teste, observamos que o requisito não é atendido:

    $ rails test
    <...>
    F

    Failure:
    ClassroomTest#test_should_not_be_valid_without_a_number
    [/Users/aramisf/git/ncr/rails/escola/test/models/classroom_test.rb:7]:
    Expected true to not be truthy.

    bin/rails test test/models/classroom_test.rb:4
    <...>


Para resolver o problema precisamos adicionar uma validação de atributos. Abra o
arquivo `app/models/classroom.rb`, e adicione uma validação, exigindo a presença
do atributo em questão:


    class Classroom < ApplicationRecord
      validates_presence_of :number
    end


Execute novamente os testes e verifique o resultado:


    <...>
    # Running:

    ........

    Finished in 0.372282s, 21.4891 runs/s, 29.5475 assertions/s.
    8 runs, 11 assertions, 0 failures, 0 errors, 0 skips


Todos os testes foram aprovados :sunglasses:


## Exercício 1

Para sabermos a quantidade de vagas que serão abertas para cada um dos cursos,
precisamos saber qual é a capacidade da sala onde cada curso será ministrado.
Escreva um teste garantindo que uma sala só é válida se possuir uma capacidade a
ela atribuída. Cuidado, pois agora uma sala precisa que ambos os atributos
`number` e `capacity` estejam presentes.

`DICA`: Utilize `fixtures` para reduzir o tamanho dos seus testes.


### Criando Sementes de banco

As sementes de banco nos servirão como fonte inicial de dados, permitindo que
tenhamos uma visibilidade dos dados assim que o sistema tiver sido montado.

Crie um novo arquivo chamado `db/seeds/classrooms.rb`:

    $ mkdir db/seeds
    $ vim db/seeds/classrooms.rb  # use o editor de texto que preferir


Segue um exemplo de como seu arquivo de sementes ficará. Fique à vontade para
adicionar quantas salas quiser:

    # db/seeds/classrooms.rb
    Classroom.create([
      {
        number: 1
        capacity: 50
      },
      {
        number: 2
        capacity: 80
      },
    ])

Depois, basta adicionar o arquivo recém criado à lista de arquivos a serem
executados durante a semeadura:

    # db/seeds.rb
    require File.expand_path('../seeds/classrooms', __FILE__)


Verifique que a semeadura surtiu o efeito desejado:

    $ rails s
    # Abra seu navegador em `http://0.0.0.0:3000/classrooms`



