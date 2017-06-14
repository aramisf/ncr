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

    ```
    rails generate scaffold Classroom number:integer capacity:integer
    <...>
    rails db:migrate # ou rake db:migrate
    ```

### Testes para as Salas

Sabemos que uma sala não pode ser referenciada se não houver um número que a
identifique, logo, temos que o número da sala é um parâmetro obrigatório.

```
# test/models/classroom_test.rb

class ClassromTest < ActiveSupport::TestCase
  test "should not be valid without a number" do
    room = Classroom.new(number:nil)
    refute room.valid?
  end
end
```

Executando este teste, observamos que o requisito não é atendido:

```
rails test
