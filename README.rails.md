# Um pouco sobre Rails


## Instalação

  - Assumindo que você tem o Ruby instalado no seu sistema, basta executar este
    comando:

    ```
    gem install rails
    ```


## O Básico

  - http://guides.rubyonrails.org/getting_started.html


## Tutoriais

  - http://apionrails.icalialabs.com/book/frontmatter
  - https://www.thinkful.com/learn/ruby-on-rails-tutorial/


## Referências

  - http://guides.rubyonrails.org
  - http://rubyonrails.org
  - https://github.com/bbatsov/rails-style-guide


# Live Demo


## O Problema

Você está desenvolvendo um sistema para uma escola. A escola funciona somente à
noite, oferecendo cursos diversos.

Existe um corpo docente de tamanho fixo e cada professor ministra um único curso.
Existe também um número finito de salas. No entanto, as salas possuem tamanhos
diferentes, e por isso podem abrigar quantidades diferentes de alunos. Logo, nem
todos os cursos terão o mesmo número de vagas.

Seu objetivo é construir um sistema gerenciador de matrículas.

Deve ser possível cadastrar professores, salas e cursos antes de disponibilizar
as matrículas para os alunos.

O sistema deve ser capaz de detectar quando uma sala já está cheia, e sugerir ao
aluno que procure outro curso para se matricular.


### O que vamos usar nesta demonstração

  - TDD - Desenvolvimento Orientado a Testes
  - Sementes de banco, para iniciar o sistema com alguns cursos, professores e
    salas previamente cadastrados

### O que não vamos usar nesta demonstração

  - Edição de CSS
  - Autenticação de usuário

