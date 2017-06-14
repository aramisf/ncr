# Sistema de Matrículas

Este arquivo pretende servir como um guia, reunindo os comandos executados para
implementar o sistema apresentado no curso.

Assumo que você chegou aqui a partir do [README.rails.md][1], e portanto você já
tem o ruby e o rails instalados no seu sistema. Se isso não for verdade, volte
[ali][1] e instale.

[1]: https://github.com/aramisf/ncr/blob/master/rails/README.rails.md


## Salas

Nossa primeira entidade a ser construída no sistema será a Sala de aula.
Que atributos são necessários para que esta sala seja ulitizada?

  - Precisamos identificar uma sala, então podemos adicionar um número.
  - Também é necessário saber quantos alunos a sala comporta, então precisamos
    adicionar também a capacidade.

```bash
$ rails generate scaffold Classroom number:integer capacity:integer
<...>
$ rails db:migrate # ou rake db:migrate
```

O comando `rails db:migrate` (ou `rake db:migrate`) serve para migrar a base de
dados, criando e/ou atualizando as tabelas que a compõe.

### Testes para as Salas

Sabemos que uma sala não pode ser referenciada se não houver um número que a
identifique, logo, temos que o número da sala é um parâmetro obrigatório.

```ruby
# test/models/classroom_test.rb
class ClassroomTest < ActiveSupport::TestCase
  test "should not be valid without a number" do
    room = Classroom.new
    assert_nil room.number
    refute room.valid?
    room.number = 100
    assert room.valid?
  end
```

Executando este teste, observamos que o requisito não é atendido:

```bash
$ rails test
<...>
F

Failure:
ClassroomTest#test_should_not_be_valid_without_a_number
[/Users/aramisf/git/ncr/rails/escola/test/models/classroom_test.rb:7]:
Expected true to not be truthy.

bin/rails test test/models/classroom_test.rb:4
<...>
```


Para resolver o problema precisamos adicionar uma validação de atributos. Abra o
arquivo `app/models/classroom.rb`, e adicione uma validação, exigindo a presença
do atributo em questão:


```ruby
class Classroom < ApplicationRecord
  validates_presence_of :number
end
```


Execute novamente os testes e verifique o resultado:

```bash
<...>
# Running:

........

Finished in 0.372282s, 21.4891 runs/s, 29.5475 assertions/s.
8 runs, 11 assertions, 0 failures, 0 errors, 0 skips
```


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

```bash
$ mkdir db/seeds
$ vim db/seeds/classrooms.rb  # use o editor de texto que preferir
```


Segue um exemplo de como seu arquivo de sementes ficará. Fique à vontade para
adicionar quantas salas quiser:

```ruby
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
```

Depois, basta adicionar o arquivo recém criado à lista de arquivos a serem
executados durante a semeadura:

```ruby
# db/seeds.rb
require File.expand_path('../seeds/classrooms', __FILE__)
```


Verifique que a semeadura surtiu o efeito desejado:

```bash
$ rails s
# Abra seu navegador em `http://0.0.0.0:3000/classrooms`
```



## Cursos

Agora que temos as Salas criadas corretamente, passemos para a criação dos
Cursos. Vamos mudar um pouco a abordagem, de forma que você mesmo possa
aproveitar para praticar os conceitos aprendidos:


1. Crie um `scaffold` para os cursos, os atributos que vamos colocar são:
  1. Nome
  2. Descrição
  3. ID da Sala onde o curso será ministrado
  4. ID do Professor que ministrará o curso


Alguns comandos do `rails` podem ser abreviados, como é o caso do `generate`:

```bash
$ rails g scaffold Course name:string description:text classroom_id:integer
```

Já pode criar também uma semente de banco para os seus cursos:

```bash
$ vim db/seeds/courses.rb
```

Lembre-se de adicionar o arquivo à lista de sementes:

```bash
$ echo "require File.expand_path('../seeds/courses', __FILE__)" >> db/seeds.rb
```


### Testes para cursos

Para que sejam oferecidos, os cursos precisam ter um nome, uma descricão, e no
mínimo, uma sala onde possam ser ministrados.

O número de vagas de cada curso será definido pela sala onde ele for alocado.
Geralmente aloca-se um curso em uma sala que esteja vaga.

`DICA`: utilize o método `delegate` do rails para que uma instância de curso
obtenha seu número de vagas a partir da sala a ele associada:


#### Um problema que você pode ter encontrado ao escrever os testes

Se você escreveu um teste verificando que um curso só é válido com uma sala a
ele associada, você pode ter se deparado com este erro:

```
Error:
CourseTest#test_a_course_should_not_be_valid_without_a_classroom:
NoMethodError: undefined method `classroom' for #<Course:0x007fa0c3e98ac0>
Did you mean?  classroom_id
```

Se isto aconteceu, você pode utilizar o rails para indicar que a classe `Course`
possui um relacionamento com a classe `Classroom`

```ruby
class Course < ApplicationRecord
  belongs_to :classroom
end
```

Você se deparou com este problema?
