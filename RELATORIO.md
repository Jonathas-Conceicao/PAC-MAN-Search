# Busca de Caminhos - PAC-MAN - Relatório de Resultados

Grupo:
-	Guilherme Souza,
-	Jonathas Conceição,
-	Mateus Schmalfuss.

## Algoritmos

Quatro algoritmos foram implementados para busca de caminho no jogo do PAC-MAN:
- [A*](#a-estrela)
- [Custo Uniforme](#custo-uniforme)
- [Têmpera Simulada](#têmpera-simulada)
- [Subida de Encosta](#subida-de-encosta)

Os Gifs neste relatório apresentam mostram
(1) o PAC-MAN,
(2) o estado final (representado pela comida),
(3) o labirtion que ele deve resolver,
(4) e os estados explorados.
Estados explorados são marcados em vermelho,
sendo os primeiros a serem explorados de um tom mais forte,
e os últimos um tom mais leve.
Nos Gifs o PAC-MAN percorre o caminho que encontrei para atingir o estado final.

Ao fim são apresentados [resultados e comparação](#resultados-e-comparação) entre os algoritmos
e [labirintos extras](#labirintos-extras) implementados para testes.

### A Estrela
O **A\*** é um algoritmo de _busca informada_ que pode ser aplicado em grafos ponderados.
Partindo de um nodo inicial do grafo,
tem-se como objetivo encontrar o caminho de menor custo até um nodo objetivo.
Ele executa mantendo uma árvore de caminhos originados do nodo inicial
e passando pelas arestas até que o nodo final seja atingido.

![Exemplo da busca A*](media/ASS.gif)  
**Gif 1: Exemplo da busca A\***

O Gif 1 mostra uma busca em A* executada usando
uma heurística de _Distância Manhattan_,
como há um caminho direto,
o PAC-MAN encontra o estado final sem precisar explorar estados adicionais.

### Custo Uniforme
A busca em **Custo Uniforme**,
também chamada de _algoritmo de Dijkstra_,
é usado para encontrar a menor distância entre dois nodos em um grafo ponderado.
No jogo do PAC-MAN pode-se aplicar peso às arestas
e usar a busca em **Custo Uniforme** para fazer o PAC-MAN priorizar caminho em uma direção.

![Exemplo da busca em Custo Uniforme](media/UCS.gif)  
**Gif 2: Exemplo da busca em Custo Uniforme**

O Gif 2 mostra uma busca de Custo Uniforme executada usando
pesos que priorizam a ida para esquerda.
Um caminho direto para esquerda é o primeiro a ser considerado,
ao atingir uma parede,
alternativas com mais uma curva para cima ou para baixo passa a ser consideradas,
o PAC-MAN eventualmente encontra o estado final e executa o percurso.

### Têmpera Simulada
_Intro Text_

![Exemplo da busca usando Tempera Simulada](media/SAS.gif)  
**Gif 3: Exemplo da busca usando Tempera Simulada**

_Text about Gif_

### Subida de Encosta
_Intro Text_

![Exemplo da busca em Custo Uniforme](media/HCS.gif)  
**Gif 4: Exemplo da busca em Custo Uniforme**

_Text about Gif_

## Resultados e Comparação
Para comparação dos algoritmos a execução em dois labirintos diferentes foi considerada.
As tabelas apresentam o desempenho dos quatro algoritmos para os labirintos em questão.

No Labirinto 1 o **A\*** foi usado com a heurística de _Distância Manhattan_,
a **Custo Uniforme** com pesos que favorecem a ida para _esquerda_.
Pode-se observar que,
(1) como há uma parede separando o caminho reto do PAC-MAN à comida,
o algoritmo **A\*** usando a _Distância Manhattan_ resulta numa resposta sub-ótima;
(2) Com os pesos usados no **Custo Uniforme**, é possível encontrar a melhor resposta,
além de gastar menos esforço computacional;
(3) a **Têmpera Simulada** (..);
(4) a **Subida de Encosta**, por sua vez, para a busca antes de encontrar a resposta final,
não gerando pontuação final.

![Maze 1](media/maze1.png)  
**Figura 1: Labirinto 1**

**Tabela 1: Comparação no Labirinto 1**

|     Algoritmo     | Qnt. Estados | Pontuação |
|:-----------------:|:------------:|:---------:|
|         A*        |      76      |    470    |
|   Custo Uniforme  |      64      |    474    |
|  Têmpera Simulada |              |           |
| Subida de Encosta |       5      |     -     |

Já no Labirinto 2, o **A\*** foi usado com a heurística de _Distância Euclidiana_,
e o _Custo Uniforme_ com pesos que favorecem a ida para _esquerda_.
Pode-se observar que,
(1) o **A\*** termina explorando todos os estados possíveis, mas encontra a resposta ótima;
(2) a busca em **Custo Uniforme** também explora todos os estados e encontra a resposta ótima;
(3) a **Têmpera Simulada** (..);
(4) a **Subida de Enconsta**, por fim, encontra a resposta final sem se perder em caminhos secundários,
encontrado a resposta ótima com menos esforço computacional.

![Maze 2](media/maze2.png)  
**Figura 2: Labirinto 2**

**Tabela 2: Comparação no Labirinto 2**

|     Algoritmo     | Qnt. Estados | Pontuação |
|:-----------------:|:------------:|:---------:|
|         A*        |      48      |    471    |
|   Custo Uniforme  |      48      |    471    |
|  Têmpera Simulada |              |           |
| Subida de Encosta |      39      |    471    |

## Labirintos Extras
_Texto comentando os diferentes tipos de labirintos_

![Maze n](media/labn.png)  
**Figura n+2: Labirinto n+2**




