puts "Iniciando semeadura de Cursos"
i = 0
Course.create([
  {
    classroom_id: i += 1,
    name: 'Body Builder',
    description: 'Aqui é Body Builder Ipsum PORRA! Que não vai dá rapaiz, não vai
    dá essa porra. Vo derrubar tudo essas árvore do parque ibirapuera. Sai de
    casa comi pra caralho porra. Aqui nóis constrói fibra, não é água com
    músculo. Vai subir árvore é o caralho porra! Eu quero esse 13 daqui a
    pouquinho aí.

    Sai de casa comi pra caralho porra. Boraaa, Hora do Show Porra. Vem porra!
    Birl! É nóis caraio é trapezera buscando caraio! Vai subir árvore é o
    caralho porra!',
  },
  {
    classroom_id: i += 1,
    name: 'Mestre Cervejero',
    description: 'Mussum Ipsum, cacilds vidis litro abertis. Vehicula non. Ut
    sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. In
    elementis mé pra quem é amistosis quis leo. A ordem dos tratores não altera
    o pão duris. Pra lá , depois divoltis porris, paradis.

    Não sou faixa preta cumpadi, sou preto inteiris, inteiris. Leite de
    capivaris, leite de mula manquis sem cabeça. Mais vale um bebadis
    conhecidiss, que um alcoolatra anonimis. Nullam volutpat risus nec leo
    commodo, ut interdum diam laoreet. Sed non consequat odio.',
  },
  {
    classroom_id: i += 1,
    name: 'Ruby',
    description: 'Curso sobre a Linguagem de Programação Ruby',
  },
  {
    classroom_id: i += 1,
    name: 'Perl',
    description: 'Curso avançado sobre a linguagem de Programação Perl',
  },
  {
    classroom_id: i += 1,
    name: 'Matemática para Programadores',
    description: 'Curso focado em cálculo, álgebra e métodos numéricos, para afiar a lâmina dos programadores',
  },
])
puts "Semeadura de cursos terminada"
