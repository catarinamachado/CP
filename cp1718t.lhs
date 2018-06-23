\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1718t}
\usepackage{subcaption}
\usepackage{adjustbox}
%================= lhs2tex=====================================================%
%include polycode.fmt
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format for f i = "\mathsf{for}\ " f "\ " i
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2017/18
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex

\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 13
\\\hline
a81047 & Catarina Machado
\\
a82339 & João Vilaça
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.

Na sequência pedagógica dos planos de estudo dos dois cursos que têm esta
disciplina, restringe-se a aplicação deste método à programação funcional
em \Haskell. Assim,
o presente trabalho prático coloca os alunos perante problemas
concretos que deverão ser implementados em \Haskell.
Há ainda um outro objectivo: o de ensinar a documentar programas e
a produzir textos técnico-científicos de qualidade.

\section{Documentação}
Para cumprir de forma integrada os objectivos enunciados acima vamos recorrer
a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
princípio base é o seguinte:
\begin{quote}\em
Um programa e a sua documentação devem coincidir.
\end{quote}
Por outras palavras, o código fonte e a documentação de um programa deverão estar no
mesmo ficheiro.

O ficheiro \texttt{cp1718t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1718t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1718t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1718t.lhs > cp1718t.tex
    $ pdflatex cp1718t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1718t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1718t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable #-}
import Cp
import List  hiding (fac)
import Nat
import Probability hiding (cond)
import BMP

import Data.List
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import GHC.IO.Exception
import Codec.Picture.Types
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1718t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1718t.aux
    $ makeindex cp1718t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell, a biblioteca
\href{https://hackage.haskell.org/package/JuicyPixels}{JuicyPixels} para processamento
de imagens e a biblioteca \href{http://gloss.ouroborus.net/}{gloss} para geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck JuicyPixels gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

\section*{Problema 1}

Segundo uma \href{https://www.jn.pt/economia/interior/compra-diaria-de-bitcoins-iguala-acoes-da-apple-9257302.html}{notícia do Jornal de Notícias},
referente ao dia 12 de abril, \emph{``apenas numa hora, foram transacionadas 1.2 mil milhões de dólares em bitcoins. Nas últimas 24 horas, foram transacionados 8,5 mil milhões de dólares, num total de 24 mil milhões de dólares referentes às principais criptomoedas''}.

De facto, é inquestionável que as criptomoedas, e em particular as bitcoin, vieram para ficar.
%
Várias moedas digitais, e em particular as bitcoin, usam a tecnologia de block chain
para guardar e assegurar todas as transações relacionadas com a moeda.
%
Uma \href{https://en.bitcoin.it/wiki/Block_chain}{block chain} é uma coleção de blocos que registam os movimentos da moeda; a sua definição em Haskell é apresentada de seguida.

\begin{spec}
data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Block}{bloco} numa block chain
regista um número (mágico) único, o momento da execução, e uma lista de transações,
tal como no código seguinte:

\begin{spec}
type Block = (MagicNo, (Time, Transactions))
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Transaction}{transação}
define a entidade de origem da transferência, o valor a ser transacionado,
e a entidade destino (por esta ordem), tal como se define de seguida.

\begin{spec}
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
\end{spec}

A partir de uma block chain, é possível calcular o valor que cada entidade
detém, tipicamente designado de ledger:

\begin{spec}
type Ledger = [(Entity, Value)]
\end{spec}

Seguem as restantes definições Haskell para completar o código anterior.
Note que |Time| representa o momento da transação, como o número de \href{https://currentmillis.com}{milisegundos} que passaram desde 1970.

\begin{spec}
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int
\end{spec}

Neste contexto, implemente as seguintes funções:

\begin{enumerate}
\item Defina a função |allTransactions :: Blockchain -> Transactions|, como um catamorfismo, que calcula a lista com todas as transações numa dada block chain.

%if False
\begin{code}
allTransactions :: Blockchain -> Transactions
prop1a :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    As transações de uma block chain são as mesmas da block chain revertida:
\begin{code}
prop1a = sort . allTransactions .==. sort . allTransactions . reverseChain
\end{code}

Note que a função |sort| é usada apenas para facilitar a comparação das listas.
\end{propriedade}

\item Defina a função |ledger :: Blockchain -> Ledger|, utilizando catamorfismos e/ou anamorfismos, que calcula o ledger (i.e., o valor disponível) de cada entidade numa uma dada block chain.
    Note que as entidades podem ter valores negativos; de facto isso acontecerá para a primeira transação que executarem.

%if False
\begin{code}
ledger :: Blockchain -> Ledger
prop1b :: Blockchain -> Bool
prop1c :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    O tamanho do ledger é inferior ou igual a duas vezes o tamanho de todas as transações:
\begin{code}
prop1b = length . ledger .<=. (2*) . length . allTransactions
\end{code}
\end{propriedade}

\begin{propriedade}
    O ledger de uma block chain é igual ao ledger da sua inversa:
\begin{code}
prop1c = sort . ledger .==. sort . ledger . reverseChain
\end{code}
\end{propriedade}



\item Defina a função |isValidMagicNr :: Blockchain -> Bool|, utilizando catamorfismos e/ou anamorfismos, que verifica se todos os números mágicos numa dada block chain são únicos.

%if False
\begin{code}
isValidMagicNr :: Blockchain -> Bool
prop1d :: Blockchain -> Bool
prop1e :: Blockchain -> Property
\end{code}
%endif

\begin{propriedade}
    A concatenação de uma block chain com ela mesma nunca é válida em termos de números mágicos:
\begin{code}
prop1d = not . isValidMagicNr . concChain . (split id id)
\end{code}
\end{propriedade}

\begin{propriedade}
    Se uma block chain é válida em termos de números mágicos, então a sua inversa também o é:
\begin{code}
prop1e = isValidMagicNr .==>. isValidMagicNr . reverseChain
\end{code}
\end{propriedade}

\end{enumerate}



\section*{Problema 2}

Uma estrutura de dados frequentemente utilizada para representação e processamento de imagens de forma eficiente são as denominadas \href{https://en.wikipedia.org/wiki/Quadtree}{quadtrees}.
Uma \emph{quadtree} é uma árvore quaternária em que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.
\begin{spec}
data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
\end{spec}

\begin{figure}
\begin{subfigure}{0.3\textwidth}
\begin{verbatim}
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 1 1 1 0 )
( 0 0 0 0 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 0 0 0 0 )
( 1 1 1 1 0 0 0 1 )
\end{verbatim}
\caption{Matriz de exemplo |bm|.}
\label{fig:bm}
\end{subfigure}
\begin{subfigure}{0.7\textwidth}
\begin{verbatim}
Block
 (Cell 0 4 4) (Block
  (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block
   (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))
 (Cell 1 4 4)
 (Block
  (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block
   (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))
\end{verbatim}
\caption{Quadtree de exemplo |qt|.}
\label{fig:qt}
\end{subfigure}
\caption{Exemplos de representações de bitmaps.}
\end{figure}

Uma imagem monocromática em formato bitmap pode ser representada como uma
matriz de bits\footnote{Cf.\ módulo \href{https://hackage.haskell.org/package/matrix}{|Data.Matrix|}.},
tal como se exemplifica na Figura~\ref{fig:bm}.

O anamorfismo |bm2qt| converte um bitmap em forma matricial na sua codificação eficiente em quadtrees, e o catamorfismo |qt2bm| executa a operação inversa:

\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-1.5em
\rightskip\leftskip
\begin{code}
bm2qt :: (Eq a) => Matrix a -> QTree a
bm2qt = anaQTree f where
    f m = if one then i1 u else i2 (a,(b,(c,d)))
     where  x = (nub . toList) m
            u = (head x,(ncols m,nrows m))
            one = (ncols m == 1 || nrows m == 1 || length x == 1)
            (a,b,c,d) = splitBlocks (nrows m `div` 2) (ncols m `div` 2) m
\end{code}
\endgroup
\end{minipage}} %
\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-2em
\rightskip\leftskip
\begin{code}
qt2bm :: (Eq a) => QTree a -> Matrix a
qt2bm = cataQTree (either f g) where
    f (k,(i,j)) = matrix j i (const k)
    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
\end{code}
\endgroup
\end{minipage}}

O algoritmo |bm2qt| particiona recursivamente a imagem em $4$ blocos e termina produzindo folhas para matrizes unitárias ou quando todos os píxeis de um sub-bloco têm a mesma côr.
Para a matriz |bm| de exemplo, a quadtree correspondente |qt = bm2qt bm| é ilustrada na Figura~\ref{fig:qt}.

\begin{figure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person.png}
\caption{Bitmap de exemplo.}
\label{fig:person}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[height=0.2\linewidth]{cp1718t_media/person90.png}
\caption{Rotação.}
\label{fig:person90}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.4\linewidth]{cp1718t_media/personx2.png}
\caption{Redimensionamento.}
\label{fig:personx2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personinv.png}
\caption{Inversão de cores.}
\label{fig:personinv}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person1.png}
\caption{Compresão de $1$ nível.}
\label{fig:person1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person2.png}
\caption{Compresão de $2$ níveis.}
\label{fig:person2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person3.png}
\caption{Compresão de $3$ níveis.}
\label{fig:person3}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person4.png}
\caption{Compresão de $4$ níveis.}
\label{fig:person4}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut1.png}
\caption{Bitmap de contorno.}
\label{fig:personOut1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut2.png}
\caption{Bitmap com contorno.}
\label{fig:personOut2}
\end{subfigure}
%
\caption{Manipulação de uma figura bitmap utilizando quadtrees.}
\end{figure}

Imagens a cores podem ser representadas como matrizes de píxeis segundo o código de cores \href{https://en.wikipedia.org/wiki/RGBA_color_space}{RGBA}, codificado no tipo \href{https://hackage.haskell.org/package/JuicyPixels-3.2.9.5/docs/Codec-Picture.html#t:PixelRGBA8}{|PixelRGBA8|} em que cada pixel é um quádruplo de valores inteiros $(red,green,blue,alpha)$ contidos entre $0$ e $255$.
Atente em alguns exemplos de cores:
\begin{spec}
whitePx  = PixelRGBA8 255 255 255 255
blackPx  = PixelRGBA8 0 0 0 255
redPx    = PixelRGBA8 255 0 0 255
\end{spec}

O módulo |BMP|, disponibilizado juntamente com o enunciado, fornece funções para processar ficheiros de imagem bitmap como matrizes:
\begin{spec}
    readBMP :: FilePath -> IO (Matrix PixelRGBA8)
    writeBMP :: FilePath -> Matrix PixelRGBA8 -> IO ()
\end{spec}

Teste, por exemplo, no |GHCi|, carregar a Figura~\ref{fig:person}:
\begin{verbatim}
    > readBMP "cp1718t_media/person.bmp"
\end{verbatim}

Esta questão aborda operações de processamento de imagens utilizando quadtrees:
\begin{enumerate}
    \item Defina as funções |rotateQTree :: QTree a -> QTree a|, |scaleQTree :: Int -> QTree a -> QTree a| e |invertQTree :: QTree a -> QTree a|, como catamorfismos e/ou anamorfismos, que rodam\footnote{Segundo um ângulo de $90º$ no sentido dos ponteiros do relógio.}, redimensionam \footnote{Multiplicando o seu tamanho pelo valor recebido.} e invertem as cores de uma quadtree\footnote{Um pixel pode ser invertido calculando $255 - c$ para cada componente $c$ de cor RGB, exceptuando o componente alpha.}, respectivamente.
    Tente produzir imagens similares às Figuras~\ref{fig:person90}, \ref{fig:personx2} e \ref{fig:personinv}:
%if False
\begin{code}
rotateQTree :: QTree a -> QTree a
scaleQTree :: Int -> QTree a -> QTree a
invertQTree :: QTree PixelRGBA8 -> QTree PixelRGBA8
prop2c :: QTree Int -> Bool
prop2d :: Nat -> QTree Int -> Bool
prop2e :: QTree PixelRGBA8 -> Bool
\end{code}
%endif
        \begin{verbatim}
    > rotateBMP  "cp1718t_media/person.bmp" "person90.bmp"
    > scaleBMP 2 "cp1718t_media/person.bmp" "personx2.bmp"
    > invertBMP  "cp1718t_media/person.bmp" "personinv.bmp"
        \end{verbatim}

\begin{propriedade}
        Rodar uma quadtree é equivalente a rodar a matriz correspondente:
\begin{code}
prop2c = rotateMatrix . qt2bm .==. qt2bm . rotateQTree
\end{code}
    \end{propriedade}
\begin{propriedade}
    Redimensionar uma imagem altera o seu tamanho na mesma proporção:
\begin{code}
prop2d (Nat s) = sizeQTree . scaleQTree s .==. ((s*) >< (s*)) . sizeQTree
\end{code}
\end{propriedade}
\begin{propriedade}
    Inverter as cores de uma quadtree preserva a sua estrutura:
\begin{code}
prop2e = shapeQTree . invertQTree .==. shapeQTree
\end{code}
\end{propriedade}

    \item Defina a função |compressQTree :: Int -> QTree a -> QTree a|, utilizando catamorfismos e/ou anamorfismos, que comprime uma quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis.
    Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:person1}, \ref{fig:person2}, \ref{fig:person3} e \ref{fig:person4}:
%if False
\begin{code}
compressQTree :: Int -> QTree a -> QTree a
prop2f :: Nat -> QTree Int -> Bool
\end{code}
%endif
        \begin{verbatim}
    > compressBMP 1 "cp1718t_media/person.bmp" "person1.bmp"
    > compressBMP 2 "cp1718t_media/person.bmp" "person2.bmp"
    > compressBMP 3 "cp1718t_media/person.bmp" "person3.bmp"
    > compressBMP 4 "cp1718t_media/person.bmp" "person4.bmp"
        \end{verbatim}
    \begin{propriedade}
        A quadtree comprimida tem profundidade igual à da quadtree original menos a taxa de compressão:
\begin{code}
prop2f (Nat n) = depthQTree . compressQTree n .==. (`minusNat` n) . depthQTree
\end{code}
    \end{propriedade}


    \item Defina a função |outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool|, utilizando catamorfismos e/ou anamorfismos, que recebe uma função que determina quais os píxeis de fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o contorno de uma \href{https://en.wikipedia.org/wiki/Polygon_mesh}{malha poligonal} contida na imagem.
        Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:personOut1} e \ref{fig:personOut2}:
%if False
\begin{code}
outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool
\end{code}
%endif
            \begin{verbatim}
    > outlineBMP    "cp1718t_media/person.bmp" "personOut1.bmp"
    > addOutlineBMP "cp1718t_media/person.bmp" "personOut2.bmp"
            \end{verbatim}
%if False
\begin{code}
prop2g :: QTree Int -> Bool
\end{code}
%endif
    \begin{propriedade}
        A matriz de contorno tem dimensões iguais às da quadtree:
\begin{code}
prop2g = sizeQTree .==. sizeMatrix . outlineQTree (<0)
\end{code}
    \end{propriedade}
    \begin{teste}
        Contorno da quadtree de exemplo |qt|:
\begin{code}
teste2a = outlineQTree (==0) qt == qtOut
\end{code}
    \end{teste}

\end{enumerate}

\section*{Problema 3}
O cálculo das combinações de |n| |k|-a-|k|,
\begin{eqnarray}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
	\label{eq:bin}
\end{eqnarray}
envolve três factoriais. Recorrendo à \material{lei de recursividade múltipla} do cálculo
de programas, é possível escrever o mesmo programa como um simples ciclo-for
onde se fazem apenas multiplicações e somas. Para isso, começa-se por estruturar
a definição dada da forma seguinte,
\begin{eqnarray*}
	|bin n k = h k (n - k)|
\end{eqnarray*}
onde
\begin{eqnarray*}
\start
       |h k d = frac (f k d) (g d)|
\more
       |f k d = frac (fac ((d+k))) (fac k)|
\more
       |g d = fac d|
\end{eqnarray*}
assumindo-se |d = n-k >=0|.
%
É fácil de ver que |f k| e |g| se desdobram em 4 funções mutuamente recursivas, a saber
\begin{spec}
f k 0 = 1
f k (d+1) = underbrace ((d+k+1)) (l k d) * f k d

l k 0 = k+1
l k (d+1) = l k d + 1
\end{spec}
e
\begin{spec}
g 0 = 1
g (d+1) = underbrace ((d+1)) (s d) * g d

s 0 = 1
s (d+1) = s d + 1
\end{spec}
A partir daqui alguém derivou a seguinte implementação:
\begin{code}
bin n k = h k (n-k) where  h k n = let (a,_,b,_) = for loop (base k) n in a % b
\end{code}
Aplicando a lei da recursividade múltipla para |split (f k) (l k)| e para
|split g s| e combinando os resultados com a \material{lei de banana-split},
derive as funções |base k| e |loop| que são usadas como auxiliares acima.

\begin{propriedade}
Verificação que |bin n k| coincide com a sua especificação (\ref{eq:bin}):
\begin{code}
prop3 (NonNegative n) (NonNegative k) = k <= n ==> (bin n k) == (fac n) % (fac k * (fac ((n-k))))
\end{code}
\end{propriedade}

\section*{Problema 4}

\begin{figure}
\begin{center}
\includegraphics[width=0.7\textwidth]{cp1718t_media/pythagoras-tree1.png}
\end{center}
\caption{Passos de construção de uma árvore de Pitágoras de ordem $3$.}
\label{fig:pitagoras1}
\end{figure}

\href{https://en.wikipedia.org/wiki/Fractal}{Fractais} são formas geométricas que podem ser construídas recursivamente de acordo com um conjunto de equações matemáticas.
Um exemplo clássico de um fractal são as \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{árvores de Pitágoras}.
A construção de uma árvore de Pitágoras começa com um quadrado, ao qual se unem dois quadrados redimensionados pela escala $\sqrt{2}/2$, de forma a que os cantos dos $3$ quadrados coincidam e formem um triângulo rectângulo isósceles.
Este procedimento é repetido recursivamente de acordo com uma dada ordem, definida como um número natural (Figura~\ref{fig:pitagoras1}).

Uma árvore de Pitágoras pode ser codificada em Haskell como uma full tree contendo quadrados nos nodos e nas folhas, sendo um quadrado definido simplesmente pelo tamanho do seu lado:
\begin{spec}
data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float
\end{spec}

\begin{enumerate}
    \item Defina a função |generatePTree :: Int -> PTree|, como um anamorfismo, que gera uma árvore de Pitágoras para uma dada ordem.

%if False
\begin{code}
generatePTree :: Int -> PTree
prop4a :: SmallNat -> Bool
prop4b :: SmallNat -> Bool
\end{code}
%endif

\begin{propriedade}
    Uma árvore de Pitágoras tem profundidade igual à sua ordem:
\begin{code}
prop4a (SmallNat n) = (depthFTree . generatePTree) n == n
\end{code}
\end{propriedade}
\begin{propriedade}
    Uma árvore de Pitágoras está sempre balanceada:
\begin{code}
prop4b (SmallNat n) = (isBalancedFTree . generatePTree) n
\end{code}
\end{propriedade}

\item Defina a função |drawPTree :: PTree -> [Picture]|, utilizando catamorfismos e/ou anamorfismos, que anima incrementalmente os passos de construção de uma árvore de Pitágoras recorrendo à biblioteca \href{https://hackage.haskell.org/package/gloss}{gloss}.
    Anime a sua solução:
\begin{verbatim}
    > animatePTree 3
\end{verbatim}

%if False
\begin{code}
drawPTree :: PTree -> [Picture]

window = (InWindow "CP" (800,800) (0,0))
square s = rectangleSolid s s

animatePTree n = animate window white draw
    where
    pics = drawPTree (generatePTree n)
    draw t = pics !! (floor (t/2))
\end{code}
%endif

\end{enumerate}

\section*{Problema 5}

Uma das áreas em maior expansão no campo da informática é a análise de dados
e  \href{https://www.mathworks.com/discovery/machine-learning.html}{machine learning}. Esta questão aborda um \emph{mónade} que ajuda
a fazer, de forma simples, as operações básicas dessas técnicas. Esse mónade
é conhecido por \emph{bag}, \emph{saco} ou \emph{multi-conjunto}, permitindo
que os elementos de um conjunto tenham multiplicidades associadas. Por exemplo,
seja
\begin{code}
data Marble = Red | Pink | Green | Blue | White deriving (Read,Show,Eq,Ord)
\end{code}
um tipo dado.\footnote{``Marble" traduz para ``berlinde" em português.}
A lista |[ Pink,Green,Red,Blue,Green,Red,Green,Pink,Blue,White ]| tem elementos
repetidos. Assumindo que a ordem não é importante, essa lista corresponde ao saco
\begin{quote}\small
\begin{verbatim}
{ Red |-> 2 , Pink |-> 2 , Green |-> 3 , Blue |-> 2 , White |-> 1 }
\end{verbatim}
\end{quote}
que habita o tipo genérico dos ``bags":
\begin{code}
data Bag a = B [(a,Int)] deriving (Ord)
\end{code}
O mónade que vamos construir sobre este tipo de dados faz a gestão automática das multiciplidades.
Por exemplo, seja dada a função que dá o peso de cada berlinde em gramas:
\begin{code}
marbleWeight :: Marble -> Int
marbleWeight Red   = 3
marbleWeight Pink  = 2
marbleWeight Green = 3
marbleWeight Blue  = 6
marbleWeight White = 2
\end{code}
Então, se quisermos saber quantos \emph{berlindes} temos, de cada \emph{peso}, não teremos que fazer contas:
basta calcular
\begin{code}
marbleWeights = fmap marbleWeight bagOfMarbles
\end{code}
onde |bagOfMarbles| é o saco de berlindes referido acima, obtendo-se:
\begin{quote}\small
	\verb!{ 2 |-> 3 , 3 |-> 5 , 6 |-> 2 }!.
\end{quote}
%
Mais ainda, se quisermos saber o total de berlindes em |bagOfMarbles| basta
calcular |fmap (!) bagOfMarbles| obtendo-se \verb!{ () |-> 10 }!; isto é,
o saco tem |10| berlindes no total.


Finalmente, se quisermos saber a probabilidade da cor de um berlinde que tiremos do saco, basta converter
o referido saco numa distribuição correndo:
\begin{code}
marblesDist = dist bagOfMarbles
\end{code}
obtendo-se a distribuição (graças ao módulo \Probability):
\begin{quote}\small
\begin{verbatim}
Green  30.0%
  Red  20.0%
 Pink  20.0%
 Blue  20.0%
White  10.0%
\end{verbatim}
\end{quote}
cf.\ Figura \ref{fig:dist}.

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{cp1718t_media/marblesDist-mod5.png}
\end{center}
\caption{Distribuição de berlindes num saco.}
\label{fig:dist}
\end{figure}

Partindo da seguinte declaração de |Bag| como um functor e como um mónade,
\begin{code}
instance Functor Bag where
    fmap f = B. map (f><id) . unB

instance Monad Bag where
   x >>= f = (muB.fmap f) x where
   return = singletonbag
\end{code}
\begin{enumerate}
\item
Defina a função |muB| (multiplicação do mónade |Bag|) e a função auxiliar
|singletonbag|.
\item	Verifique-as com os seguintes testes unitários:
%if False
\begin{code}
muB :: Bag (Bag a) -> Bag a
\end{code}
%endif
\begin{teste}
Lei |muB.return=id|:
\begin{code}
test5a = bagOfMarbles == muB (return bagOfMarbles)
\end{code}
\end{teste}
\begin{teste}
Lei |muB.muB = muB . fmap muB|:
\begin{code}
test5b = (muB . muB) b3 == (muB .fmap muB) b3
\end{code}
\vskip 1em
onde |b3| é um saco dado em anexo.
\end{teste}
\end{enumerate}

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1718t}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Mónade para probabilidades e estatística}\label{sec:Dist}
%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de |0| a |100%|.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam |100%|.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}

Este mónade é adequado à resolução de problemas de \emph{probabilidades e
estatística} usando programação funcional, de forma elegante e como caso
particular de programação monádica.

\section{Definições auxiliares}\label{sec:helper_functions}
Funções para mostrar \emph{bags}:
\begin{code}
instance (Show a, Ord a, Eq a) => Show (Bag a) where
    show = showbag . consol . unB  where
       showbag = concat .
                 (++ [" }"]) .  ("{ ":) .
                 (intersperse " , ") .
                 sort .
                 (map f) where f(a,b) = (show a) ++ " |-> " ++ (show b)
unB (B x) = x
\end{code}
Igualdade de \emph{bags}:
\begin{code}
instance (Eq a) => Eq (Bag a) where
   b == b' = (unB b) `lequal` (unB b')
           where lequal a b = isempty (a `ominus` b)
                 ominus a b = a ++ neg b
                 neg x = [(k,-i) | (k,i) <- x]
\end{code}
Ainda sobre o mónade |Bag|:
\begin{code}
instance Applicative Bag where
    pure = return
    (<*>) = aap
\end{code}
O exemplo do texto:
\begin{code}
bagOfMarbles = B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]
\end{code}
Um valor para teste (bags de bags de bags):
\begin{code}
b3 :: Bag (Bag (Bag Marble))
b3= B [(B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)
      ,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],2)],2)]
\end{code}
Outras funções auxiliares:
\begin{code}
a |-> b = (a,b)

consol :: (Eq b) => [(b, Int)] -> [(b, Int)]
consol = filter nzero . map (id >< sum) . col where nzero(_,x)=x/=0

isempty :: Eq a => [(a, Int)] -> Bool
isempty = all (==0) . map snd . consol

col x = nub [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]

consolidate :: Eq a => Bag a -> Bag a
consolidate = B . consol . unB

\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o ``layout'' que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e / ou
outras funções auxiliares que sejam necessárias.

\subsection*{Problema 1}

O primeiro problema tem como tema uma block chain, ou seja, uma coleção de blocos
que registam movimentos da moeda.

De modo a resolvê-lo, antes de procedermos ao desenvolvimento
das suas 3 alíneas, tivemos que definir algumas funções que nos ajudarão
a implementar as soluções requeridas.

\begin{code}
inBlockchain = either Bc Bcs

outBlockchain (Bc a) = Left (a)
outBlockchain (Bcs (a,b)) = Right(a,b)

recBlockchain g = id -|- (id >< g)

cataBlockchain g = g . (recBlockchain (cataBlockchain g)) . outBlockchain

anaBlockchain g = inBlockchain . (recBlockchain (anaBlockchain g) ) . g

hyloBlockchain h g = cataBlockchain h . anaBlockchain g
\end{code}

Estas funções, nomeadamente |inBlockchain|, |outBlockchain|,
|recBlockchain|, |cataBlockchain|, |anaBlockchain| e |hyloBlockchain|, podem ser
deduzidas tendo em consideração o Tipo de Dados do problema, a matéria de Cálculo
de Programas e com a ajuda de alguns diagramas.

\vspace{0.2cm}

Uma vez que o tipo de Blockchain é
|Bc {bc :: Block}|
ou
|Bcs {bcs :: (Block, Blockchain)}|,
sabemos que o |inBlockchain| e o |outBlockchain| deverão "fechar" e "abrir"
a Blockchain, respetivamente, logo, conseguimos representar os diagramas:
\begin{eqnarray*}
\xymatrix@@C=2cm{
     |Blockchain|
&
     |Block + (Block >< Blockchain)|
           \ar[l]^-{|inBlockchain|}
}
\end{eqnarray*}

\begin{eqnarray*}
\xymatrix@@C=2cm{
     |Blockchain|
           \ar[r]_-{|outBlockchain|}
&
     |Block + (Block >< Blockchain)|
}
\end{eqnarray*}

Assim, conseguimos perceber de imediato a definição de ambas as funções:
\begin{eqnarray*}
\start
|inBlockchain = either Bc Bcs|
\end{eqnarray*}
\begin{eqnarray*}
\start
|outBlockchain (Bc a) = Left (a)|
\more
|outBlockchain (Bcs (a,b)) = Right(a,b)|
\end{eqnarray*}

Relativamente às funções |recBlockchain|, |cataBlockchain|,
|anaBlockchain| e |hyloBlockchain|, os seus tipos já estavam presentes
no enunciado e o significado e intuito de cada uma delas também já era sabido.

A título de exemplo, através do diagrama em seguida conseguimos ter uma
melhor perceção de qual deverá ser a definição de cada uma destas funções.

Assumimos que as funções |g| e |h| mencionadas são funções que devolvem
a identidade.


\begin{eqnarray*}
\xymatrix@@C=3cm{
   |Blockchain|
          \ar[d]_-{|anaBlockchain g|}
           \ar[r]^-{|g|}
&
   |Block + (Block >< Blockchain)|
          \ar[d]^{|recBlockchain(anaBlockchain g)|}
\\
    |Blockchain|
       \ar[d]_-{|cataBlockchain h|}
       \ar[r]^-{|outBlockchain|}
&
    |Block + (Block >< Blockchain)|
          \ar[l]^-{|inBlockchain|}
           \ar[d]^{|recBlockchain(cataBlockchain h)|}
\\
   |Blockchain|
&
   |Block + (Block >< Blockchain)|
       \ar[l]^-{|h|}
}
\end{eqnarray*}

Assim, intuitivamente conseguimos perceber a definição de cada uma delas.
\begin{eqnarray*}
\start
|recBlockchain g = id + (id >< g)|
\more
|cataBlockchain h = h . (recBlockchain (cataBlockchain h)) . outBlockchain|
\more
|anaBlockchain g = inBlockchain . (recBlockchain (anaBlockchain g) ) . g|
\more
|hyloBlockchain h g = cataBlockchain h . anaBlockchain g|
\end{eqnarray*}


Na resolução das alíneas recorremos a alguns diagramas onde também fica
implícito o porquê da definição de cada uma destas funções.


\begin{enumerate}
\item Função |allTransactions|

O objetivo da função |allTransactions| é calcular a lista com todas as transações
numa dada block chain, utilizando um catamorfismo.

O diagrama desta função será:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
           \ar[d]_-{|cataBlockchain g|}
&
    |Block + (Block >< Blockchain)|
           \ar[d]^{|recBlockchain (cataBlockchain g)|}
           \ar[l]_-{|inBlockchain|}
\\
     |Transactions|
&
     |Block + (Block >< Transactions)|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


O objetivo é descobrir o gene |g|, para assim termos a definição final de como
algo do género |allTransactions = cataBlockchain g|

Assim, tendo em atenção o tipo de Block:
\begin{eqnarray*}
|type Block = (MagicNo, (Time, Transactions))|
\end{eqnarray*}

E o tipo de Blockchain já apresentado, deduzimos que o |g| terá que ser um ``either'',
|g = either b0 joint|,
onde de um lado irá tratar o |Block| e do outro o |Block >< Transactions|. Isso deve-se
ao facto de |g| receber como parâmetro: |Block + (Block >< Transactions)|, ou seja, uma
"soma", e devolver: |Transactions|, logo, obrigatoriamente a função terá que ser ``either''
para abolir o |+|.


\begin{enumerate}
\item Descobrir |b0|

Para tratar o lado em que o domínio é |Block|, e sabendo que o resultado terá que
ser |Transactions|, o objetivo desta função será "retirar" do |Block| as |Transactions|.

Assim, teremos que definir |b0| com projeções |p2| como podemos verificar no diagrama
em seguida:
\hfill \break
\xymatrix@@C=20cm{
    |MagicNo >< (Time >< Transactions)|
           \ar[d]_-{|p2 . p2|}
\\
    |Transactions|
}
\hfill \break

Deste modo, fica definido |b0| como:
\begin{eqnarray*}
|b0 = p2 . p2|
\end{eqnarray*}


\item Descobrir |joint|

Tendo em conta o domínio da função |joint|, ou seja, |Block >< Transactions|,
percebemos que o objetivo desta função será retirar de |Block| as suas
|Transactions| e juntá-las às |Transactions| já acumuladas (passadas como
parâmetro).

Assim, uma definição de |joint| |pointwise| é:
\begin{eqnarray*}
|joint (block, transac) = (p2 (p2 block)) ++ transac|
\end{eqnarray*}

Esta função cumpre os requisitos a que a proposemos, uma vez que retira de
|Block| as |Transactions|, e concatena-as às |Transactions| passadas como parâmetro.

\end{enumerate}

Temos então a definição de |b0| e |joint|, pelo que ficamos a saber qual é o gene g:
\begin{eqnarray*}
\start
|g = either b0 joint|
%
\just\equiv{ Definição de b0 ; Definição de joint }
%
|g = either (p2 . p2) joint|
\more
|   where joint(x,y) = (p2 (p2 x)) ++ y|
%
\end{eqnarray*}


Deste modo, está definida a função |allTransactions| pedida:
\begin{code}
allTransactions a = cataBlockchain ( either (p2.p2) joint ) a
    where joint(x,y) = (p2 (p2 x)) ++ y
\end{code}



\item Função |ledger|

O objetivo desta função é calcular o valor disponível de cada entidade numa
dada block chain.


\begin{code}
groupL :: Ledger -> Ledger
groupL t = ( sums . map (mapFst head . unzip) . groupBy (\x y -> fst x == fst y) . sort) t
    where mapFst f (a, b) = (f a, b)
          sums [] = []
          sums ((a,b):t) = (a, sum b) : sums t

ledger a = groupL (cataList ( either nil insert ) (allTransactions a))
    where insert(x,y) = (p1 x, -p1 (p2 x)) : (p2 (p2 x), p1 (p2 x)) : y
\end{code}




TODOOOO

|type Transaction = (Entity, (Value, Entity))|
|type Transactions = [Transaction]|

|type Ledger = [(Entity, Value)]|

|type Block = (MagicNo, (Time, Transactions))|









\item Função |isValidMagicNr|

\end{enumerate}










----

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}




\begin{eqnarray*}
\xymatrix@@C=3cm{
   |A*|
          \ar[d]_-{|ana lsplitBGene|}
           \ar[r]^-{|lsplitBGene|}
&
   |1 + A* >< (A >< A above) above|
          \ar[d]^{|id +((ana lsplitBGene) >< map(id >< ana lsplitBGene))|}
\\
    |B|
       \ar[d]_-{|cata inordBGene|}
       \ar[r]^-{|outB|}
&
    |1 + B >< (A >< B) above|
          \ar[l]^-{|inB|}
           \ar[d]^{|id +((cata inordBGene) >< map(id >< cata inordBGene))|}
\\
   |A above|
&
   |1 + A above >< (A >< A above) above|
       \ar[l]^-{|inordBGene|}
}
\end{eqnarray*}

\begin{code}
isValidMagicNr a = all ( (==) 1 . length) . group . sort $ cataBlockchain ( either list insert ) a
    where   list x = [p1 x]
            insert(x,y) = (p1 x) : y
\end{code}


\subsection*{Problema 2}

O segundo problema tem como tema uma estrutura de dados que é muito utilizada para
representação e processamento de imagens- quadtrees. Tal como é referido no
enunciado do problema, uma quadtree é uma árvore quaternária em
que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.

Antes de procedermos ao desenvolvimento das funções propostas neste problema
definimos algumas funções que nos serão muito úteis.

\vspace{0.5cm}

Uma |QTree| poderá ser:
\begin{eqnarray*}
|Cell a Int Int|
\end{eqnarray*}
Ou
\begin{eqnarray*}
|Block (QTree a) (QTree a) (QTree a) (QTree a)|
\end{eqnarray*}

Em consequência, as definições de |inQTree| e |outQTree| terão que ser as seguintes:

\begin{code}
inQTree = either (uncurryCell) (uncurryBlock)
    where uncurryCell (e, (n1, n2)) = Cell e n1 n2

uncurryBlock :: (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
uncurryBlock (q1, (q2, (q3, q4))) = Block q1 q2 q3 q4

outQTree (Cell e n1 n2) = Left (e, (n1, n2))
outQTree (Block q1 q2 q3 q4) = Right (q1, (q2, (q3, q4)))
\end{code}

O diagrama da função |inQTree| é o seguinte:
\begin{eqnarray*}
\xymatrix@@C=2cm{
     |QTree a|
&
     |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[l]^-{|inQTree|}
}
\end{eqnarray*}

E o diagrama da função |outQTree| é o seguinte:
\begin{eqnarray*}
\xymatrix@@C=2cm{
     |QTree a|
           \ar[r]_-{|outQTree|}
&
     |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
}
\end{eqnarray*}


No caso da função |inQTree|, que "fecha" a |QTree|, o retorno deverá ser uma |QTree|, logo, no
caso da |Cell| (lado esquerdo do |+|) temos que ajustar o parâmetro recebido |(a, (Int, Int))|
devolvendo |Cell a Int Int|, para assim a função devolver a informação
no tipo de dados correto. No caso do |Block|, recebendo
|(q1, (q2, (q3, q4)))| teremos que retornar |Block q1 q2 q3 q4|.
Esta função é definida como um ``either'' porque temos estas duas "hipóteses"
de tipo de dados dentro do tipo de dados |QTree|.

\vspace{0.2cm}

No caso da função |outQTree| o raciocínio é o inverso. Uma vez que esta função
recebe uma |QTree| podemos definir a função com dois casos diferentes, tal como
se pode ver na solução por nós proposta.

Os dois diagramas em seguida ajudam-nos a perceber melhor como tratar os dois
casos de |QTree| na função |outQTree|:

\hfill \break
\xymatrix@@C=20cm{
    |(a, (Int, Int))|
           \ar[d]_-{|i1|}
\\
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
}
\hfill \break

e

\hfill \break
\xymatrix@@C=20cm{
    |(QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[d]_-{|i2|}
\\
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
}
\hfill \break

Assim, quando recebemos uma |Cell e n1 n2| o objetivo será
injetá-la à esquerda de modo a respeitar o tipo de dados, devolvendo
então: |Left (e, (n1, n2))|. No caso de |Block q1 q2 q3 q4|, injetamos
à direita retornando: |Right (q1, (q2, (q3, q4)))|.

\vspace{0.5cm}

Outras funções cruciais para a resolução deste problema são as seguintes:

\begin{code}
baseQTree f g = (f >< id) -|- (g >< (g >< (g >< g)))

recQTree g = baseQTree id g

cataQTree g = g . (recQTree (cataQTree g)) . outQTree

anaQTree g = inQTree . (recQTree (anaQTree g)) . g

hyloQTree h g = cataQTree h . anaQTree g
\end{code}


Para melhor compreensão do intuito de cada uma delas desenhamos dois diagramas:

O primeiro, mostra a função |baseQTree|. Atendendo ao seu tipo,
já contido no enunciado, conseguimos perceber qual é o objetivo desta função.
A título de exemplo, vamos considerar que f tem um tipo: |f :: A -> E|
e que g tem um tipo: |g :: C -> D|:

\hfill \break
\xymatrix@@C=20cm{
    |Either (a, b) (c, (c, (c, c)))|
           \ar[d]_-{baseQTree f g}
\\
    |Either (e, b) (d, (d, (d, d)))|
}
\hfill \break

Assim, percebemos de imediata que a função |baseQTree| terá que ser definida como
|(f >< id) + (g >< (g >< (g >< g)))|:

\hfill \break
\xymatrix@@C=20cm{
    |Either (a, b) (c, (c, (c, c)))|
           \ar[d]_-{|(f >< id) + (g >< (g >< (g >< g)))|}
\\
    |Either (e, b) (d, (d, (d, d)))|
}
\hfill \break

\vspace{0.4cm}

O segundo, que é um pouco mais complexo, é apenas um exemplo do que se pode
fazer com a combinação destas funções, nomedamente |inQTree|, |outQTree|,
|recQTree|, |cataQTree|, |anaQTree| e |hyloQTree|. Vamos assumir que neste nosso diagrama
as funções |g| e |h| mencionadas são funções que devolvem a identidade, ou seja,
não alteram o conteúdo da |QTree|, mas respeitam os tipos de dados ideais:
\begin{eqnarray*}
\xymatrix@@C=3cm{
   |QTree a|
          \ar[d]_-{|anaQTree g|}
           \ar[r]^-{|g|}
&
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
          \ar[d]^{|recQTree(anaQTree g)|}
\\
    |QTree a|
       \ar[d]_-{|cataQTree h|}
       \ar[r]^-{|outQTree|}
&
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
          \ar[l]^-{|inQTree|}
           \ar[d]^{|recQTree(cataQTree h)|}
\\
   |QTree a|
&
   |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
       \ar[l]^-{|h|}
}
\end{eqnarray*}

A função |hyloQTree| é definida como sendo |hyloQTree h g = cataQTree h . anaQTree g|,
ou seja, no diagrama anterior pode ser identificado por uma seta vertical que vai desde o
argumento da função |anaQTree| até ao retorno da função |cataQTree|.

Assim, com a ajuda destes diagramas, encontramos as definições procuradas.

\vspace{0.5cm}

Por fim, temos |fmap|, que tem como objetivo aplicar a função |f| a todas
as |Cell| da |QTree|, mais especificamente ao conteúdo da |Cell| que diz respeito ao
valor/ objeto da matriz (não à dimensão). A função simplesmente aplica a todos esses elementos
a função |f|.

Assim, decidimos definir a nossa função |fmap| da seguinte forma:
\begin{code}
instance Functor QTree where
    fmap f = cataQTree (inQTree . baseQTree f id)
\end{code}

No seguinte diagrama conseguimos perceber o que é que as funções
|inQTree . baseQTree f id| fazem, considerando que f é uma função
do tipo: |f :: A -> E|:

\hfill \break
\xymatrix@@C=20cm{
    |Either (a, b) (c, (c, (c, c)))|
       \ar[d]_-{|baseQTree f id|}
\\
    |Either (e, b) (c, (c, (c, c)))|
       \ar[d]_-{|inQTree|}
\\
    |QTree e|
}

Ou seja, numa primeira fase a função |baseQTree f id| aplica a função |f| ao
conteúdo da |Cell| e numa segunda fase a função |inQTree| junta o resultado
da aplicação da função |baseQTree f id| numa |QTree|.


Assim, aplicando um |cataQTree| a esta composição de funções construímos:
\begin{eqnarray*}
\xymatrix@@C=3cm{
    |QTree a|
           \ar[d]_-{|cataQTree g|}
&
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[d]^{|recQTree(cataQTree g)|}
           \ar[l]_-{|inQTree|}
\\
     |QTree e|
&
     |Either (a, (Int, Int)) (QTree e, (QTree e, (QTree e, QTree e)))|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

Sendo |g f = inQTree . baseQTree f id|.

Em suma, tal como nos diz a própria definição de
catamorfismo, na seta vertical mais à direita o mesmo é aplicado recursivamente
à parte direita do |+| (o |Functor|, ou seja, |recQTree| encarrega-se disso) e,
depois disso, temos então a "cauda" processada, tal como podemos ver no diagrama.
O nosso gene |g|
responsabiliza-se pelo último passo de transformar na |Cell| (lado
esquerdo do |+| inferior) o seu conteúdo (através da função |f|) e de juntar tudo numa só
|QTree|.

\vspace{0.3cm}

Agora reunimos todas as condições para nos concentrarmos no desenvolvimento das
alíneas deste problema.

\begin{enumerate}

\item Função |rotateQTree|

O objetivo desta função é rodar uma |QTree|.

Optamos por utilizar um catamorfismo para definir
esta função. Assim, temos que |rotateQTree = cataQTree g|.
Tendo em conta a definição de |cataQTree| podemos definir |g|
como um ``either'', onde um dos lados irá tratar a |Cell| e o outro
o |Block|.

Consequentemente, para perceber que impacto esta função |rotateQTree|
terá na |QTree| analisamos a matriz de bits (Figura~\ref{fig:bm}) e a
respetiva codificação em quadtrees (Figura~\ref{fig:qt}).

Vamos agora exemplificar o nosso raciocínio com alguns exemplos:

Numa primeira fase iremos analisar o que acontecerá numa |Cell|.
Por exemplo, se tivermos a |Cell|:
\begin{verbatim}
( 0 0 0 0 )
( 0 0 0 0 )
\end{verbatim}

Que é representada por |Cell 0 4 2|, rodando-a $90º$ fica:
\begin{verbatim}
( 0 0 )
( 0 0 )
( 0 0 )
( 0 0 )
\end{verbatim}
Que é representada por |Cell 0 2 4|.

Logo, fica implícito que no que diz respeito a rodar uma |Cell| o que
acontece é que as suas dimensões verticais e horizontais trocam.

Definimos então a função |rotateCell| que roda uma |Cell|:
\begin{eqnarray*}
|rotateCell (e, (n1, n2)) = Cell e n2 n1|
\end{eqnarray*}

O tipo desta função terá que ser o acima apresentado tendo em consideração
os tipos da função |cataQTree| e |inQTree|.

\vspace{0.5cm}

Numa segunda fase analisamos o que acontece num |Block|.

Procedendo da mesma forma, definimos um |Block| de exemplo:
\begin{verbatim}
( 0 0 0 0 )
( 0 0 0 0 )
( 1 1 1 1 )
( 1 1 1 1 )
\end{verbatim}

Que é definida por |Block (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Cell 1 2 2)|.

Rodando o |Block| $90º$:
\begin{verbatim}
( 1 1 0 0 )
( 1 1 0 0 )
( 1 1 0 0 )
( 1 1 0 0 )
\end{verbatim}

Ficamos com uma |Block (Cell 1 2 2) (Cell 0 2 2) (Cell 1 2 2) (Cell 0 2 2)|.

Assim, percebemos que os quatro parâmetros de |Block| rodam entre si.
O primeiro parâmetro passará a ser o segundo parâmetro, o segundo passará
a ser o último, o terceiro fica em primeiro e, por fim, o último parâmetro
fica a ser o terceiro.

Conseguimos então perceber a definição que trata o |Block|:
\begin{eqnarray*}
|rotateBlock (q1, (q2, (q3, q4))) = Block q3 q1 q4 q2|
\end{eqnarray*}

Assim, temos todas as condições necessárias para definir a função
pedida, |rotateQTree|:
\begin{code}
rotateQTree = cataQTree (either (rotateCell) (rotateBlock))
    where rotateCell (e, (n1, n2)) = Cell e n2 n1
          rotateBlock (q1, (q2, (q3, q4))) = Block q3 q1 q4 q2
\end{code}

O diagrama desta função é o seguinte:
\begin{eqnarray}
\xymatrix@@C=2cm{
    |QTree a|
           \ar[d]_-{|cataQTree g|}
&
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[d]^{|recQTree (cataQTree g)|}
           \ar[l]_-{|inQTree|}
\\
     |QTree a|
&
     |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[l]^-{|g|}
}
\end{eqnarray}

Onde:
\begin{eqnarray*}
\start
|g = (either (rotateCell) (rotateBlock))|
\more
|where rotateCell (e, (n1, n2)) = Cell e n2 n1|
\more
|rotateBlock (q1, (q2, (q3, q4))) = Block q3 q1 q4 q2|
\end{eqnarray*}


\item Função |scaleQTree|

Esta função redimensiona uma |Qtree| tendo em consideração o |Int| passado
como parâmetro.

Assim, intuitivamente percebemos que teremos que multiplicar o fator passado
como parâmetro pela dimensão da matriz.

Mais uma vez recorremos a um |cataQTree| para definir a função |scaleQTree|.
Deste modo, utilizando o mesmo raciocínio da função anterior, precisamos de definir
o gene |g| como um ``either'' onde a |Cell| e o |Block| serão tratados
individualmente.

O gene |g| terá a seguinte definição:
\begin{eqnarray*}
|g n = either (scaleCell n) (uncurryBlock)|
\end{eqnarray*}

Uma vez que as dimensões da matriz são somente responsabilidade da |Cell|
não teremos que alterar nada no |Block|.

De forma a respeitar os tipos, no que diz respeito a tratar o |Block|, utilizamos
a função |uncurryBlock| já definida por nós, que apenas altera a forma como
o |Block| é mostrado, não alterando o seu conteúdo.

Para tratar a |Cell| vamos recorrer a uma função auxiliar, |scaleCell|,
cujo único objetivo será multiplicar as dimensões da |Cell| pelo fator e devolvê-la
no tipo de dados correto:
\begin{eqnarray*}
|scaleCell n (e, (n1, n2)) = Cell e (n1 * n) (n2 * n)|
\end{eqnarray*}

O diagrama desta função é o mesmo da função anterior, diagrama (3),
variando somente o gene |g|, que neste caso é o anteriormente referido.

Assim, temos definida a função |scaleQTree|:
\begin{code}
scaleQTree n = cataQTree (either (scaleCell n) (uncurryBlock))
    where scaleCell n (e, (n1, n2)) = Cell e (n1 * n) (n2 * n)
\end{code}


\item Função |invertQTree|

O intuito da função |invertQTree| é inverter as cores de uma quadtree. Assim,
terá obrigatoriamente de se tratar de uma matriz de píxeis, neste caso de |PixelRGBA8|.
É nos também dito que o pixel pode ser invertido calculando (255 - w), sendo w
a componente de cor RGB.

Logo, utilizando o mesmo raciocínio da função |scaleQTree|, vamos definir
a função |invertQTree| como um |cataQTree| onde também somente a |Cell|
precisa de ser modificada, tendo em conta que é a |Cell| que possui o contéudo
da |QTree|, ou seja, o parâmetro que nos interessa alterar.

Logo, teremos um gene |g| com a seguinte definição:
\begin{eqnarray*}
|g = either invertCell uncurryBlock|
\end{eqnarray*}

Precisamos então somente de definir a função |invertCell|, que poderá
ser definida como:
\begin{eqnarray*}
\start
|invertCell ((PixelRGBA8 a b c d), (n1, n2)) =|
\more
|Cell (PixelRGBA8 (255-a) (255-b) (255-c) (255-d)) n1 n2|
\end{eqnarray*}

Esta função pode também ser ilustrada através do diagrama (3), mas com um gene |g|
definido como o mencionado anteriormente.

Consequentemente, temos todas as condições necessárias para definir
a função |invertQTree|:

\begin{code}
invertQTree = cataQTree (either (invertCell) (uncurryBlock))
    where invertCell ((PixelRGBA8 a b c d), (n1, n2)) =
                Cell (PixelRGBA8 (255-a) (255-b) (255-c) (255-d)) n1 n2
\end{code}

\item Função |compressQTree|

O objetivo desta função é comprimir a |QTree| cortando folhas da árvore de modo
a reduzir a sua profundidade num dado número de níveis, passado como parâmetro na função.
Basicamente, o que irá acontecer à imagem é perder informação e por isso ``desfocar''.

Para o desenvolvimento desta função recorremos a uma |anaQTree| uma vez que
consideramos que seria mais simples de tratar o problema usando esse
conceito/ definição.

De uma forma mais concreta, pensamos em utilizar uma |anaQTree| uma vez que sabiamos que
ela se iria concentrar em cada nível da árvore gradualmente, começando
da raiz até às folhas. Assim, de uma forma geral, pensamos
que a nossa |anaQTree| deveria ter um gene que averigua-se se estamos no
nível desejado e em caso afirmativa eliminasse toda a |QTree| a partir desse nível.


Assim, passamos para o chamado desenvolvimento do problema:

Temos por exemplo |QTree| da Figura~\ref{fig:qt},
que é representada pela |QTree qt|, que já vinha também no enunciado:
\begin{eqnarray*}
\start
|qt = Block|
\more
|(Cell 0 4 4)|
\more
|(Block (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))|
\more
|(Cell 1 4 4)|
\more
|(Block (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))|
\end{eqnarray*}

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{imgs/qt.png}
\end{center}
\caption{Esquema da |QTree qt|.}
\label{fig:qt}
\end{figure}


Se quisermos aplicar a função |compressQTree 2|, ou seja, comprimir
dois níveis, o esquema da |QTree| de retorno deverá ser o seguinte
o esquema presenta na Figura~\ref{fig:qtcompress2}, representado por:
\begin{eqnarray*}
\start
|qt_compress2 = Block|
\more
|(Cell 0 4 4)|
\more
|(Cell 0 4 4)|
\more
|(Cell 1 4 4)|
\more
|(Cell 1 4 4)|
\end{eqnarray*}

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{imgs/qtcompress2.png}
\end{center}
\caption{Esquema da |QTree qt| comprimida em 2 níveis.}
\label{fig:qtcompress2}
\end{figure}

Deste modo, apercebemo-nos que teriamos que ter uma função que nos ``cortasse'' todos
os ramos da |QTree| a abolir. Percebemos através da Figura~\ref{fig:qt}
e da Figura~\ref{fig:qtcompress2} que
se essa função, que poderá chamar-se |corta|, receber como parâmetro a parte da
|Qtree| a eliminar deveremos transforma-la numa única |Cell|.

Nesta fase, tivemos que perceber quais as dimensões da |Cell|
resultado pelo que, por exemplo, se tivermos:
\begin{eqnarray*}
|Block (Cell 0 3 2) (Cell 1 2 2) (Cell 1 4 2) (Cell 0 1 2)|
\end{eqnarray*}

Representado por:
\begin{verbatim}
( 0 0 0 1 1 )
( 0 0 0 1 1 )
( 1 1 1 1 0 )
( 1 1 1 1 0 )
\end{verbatim}


A |Cell| resultado deverá ser:
\begin{eqnarray*}
\start
|Cell 0 5 4|
\end{eqnarray*}

E em modo matriz:
Representado por:
\begin{verbatim}
( 0 0 0 0 0 )
( 0 0 0 0 0 )
( 0 0 0 0 0 )
( 0 0 0 0 0 )
\end{verbatim}

Assim, percebemos que se o |Block a b c d| for então constítuido apenas com |Cell|,
ou seja, |a, b, c, d :: Cell|, as dimensões resultado deverão ser calculadas da seguinte
forma:
\begin{eqnarray*}
\start
       |corta (Block (Cell c1 n1 n2) (Cell c2 m1 m2) (Cell c3 k1 k2) (Cell c4 o1 o2)) =|
\more
        |Cell (c1) (n1 + m1) (n2 + k2)|
\end{eqnarray*}

Optamos por dar como resultado o valor da primeira |Cell|, que no nosso caso é c1.


No caso de o |Block| ainda não ser constituído por apenas |Cell|, tal como referimos
anteriormente, aplicamos recursivamente a função |corta| a cada um dos "argumentos"
de |Block|, e ao próprio |Block|, até conseguirmos chegar a um |Block| só com
|Cell| e o convertermos para |Cell| da forma já referida.
A recursividade irá tratar de nos fornecer a solução que desejamos.
Para esta hipótese a função |corta| será então:
\begin{eqnarray*}
       |corta (Block q1 q2 q3 q4) = corta (Block (corta q1) (corta q2) (corta q3) (corta q4))|
\end{eqnarray*}

Pensando no caso de quando esta função é aplicada a somente uma |Cell| isolada a função deverá
retornar a |Cell| argumento exatamente igual:
\begin{eqnarray*}
       |corta (Cell a b c) = Cell a b c|
\end{eqnarray*}

Juntando estas 3 hipóteses, temos então a função |corta| definida:
\begin{eqnarray*}
\start
        |corta (Cell a b c) = Cell a b c|
\more
        |corta (Block (Cell c1 n1 n2) (Cell c2 m1 m2) (Cell c3 k1 k2) (Cell c4 o1 o2)) =|
\more
        |Cell (c1) (n1 + m1) (n2 + k2)|
\more
        |corta (Block q1 q2 q3 q4) = corta (Block (corta q1) (corta q2) (corta q3) (corta q4))|
\end{eqnarray*}

Assim, precisamos apenas de definir concretamente, e através de código,
em que momento esta função será aplicada.

Aproveitando a função |depthQTree|, que calcula a profundidade de uma |QTree|,
podemos então contruir uma função auxiliar, por exemplo chamada |compress|,
que irá receber o número de níveis a eliminar. Como sabemos que o nosso
|anaQTree| irá olhar individualmente para cada nível, a nossa |compress n|
averiguará se a profundidade do ramo atual é igual ao número de níveis a cortar.

Podemos utilizar esta técnica pois o anamorfismo percorre cada ramo de cima (raiz)
para baixo e não volta para cima, por isso, quando o sub-ramo tiver uma profundidade
igual ao número de níveis a cortar sabemos que é esse o nível que procuramos,
para podermos aplicar a nossa função |corta|. Se ainda não tivermos chegado
ao nível que procuramos, a função |compress| deverá devolver a |QTree|, ou seja,
o ramo, intacto.

Tivemos que ter em consideração o caso em que o número de níveis a cortar
é maior que toda a profundidade da árvore, sendo que neste caso toda a |QTree|
deverá ser cortada (é aplicada à função |cortar|) ficando somente a |Cell|
comprimida.

É ainda mencionar que, tendo em conta o tipo de |anaQTree|, a nossa |compress|
deverá retornar sempre uma |QTree| ``aberta'' e, assim, aplicamos
a função |outQTree|.


Finalmente, juntando todos estes passos, temos a função |compressQTree| definida:

\begin{code}
corta :: QTree a -> QTree a
corta (Cell a b c) = Cell a b c
corta (Block (Cell c1 n1 n2) (Cell c2 m1 m2) (Cell c3 k1 k2) (Cell c4 o1 o2)) =
                              Cell (c1) (n1 + m1) (n2 + k2)
corta (Block q1 q2 q3 q4) = corta (Block (corta q1) (corta q2) (corta q3) (corta q4))

compressQTree n = anaQTree (compress n)
    where compress n a | (n == (tam a) || n > (tam a)) = outQTree (corta a)
                       | otherwise = outQTree a
          tam a = depthQTree a
\end{code}

O anamorfismo que representa esta função é o seguinte:
\begin{eqnarray}
\xymatrix@@C=2cm{
    |QTree a|
        \ar[d]_-{|anaQTree g|}
        \ar[r]^-{|g|}
&
    |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[d]^{|recQTree (anaQTree g)|}
\\
     |QTree a|
&
     |Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))|
           \ar[l]^-{|inQTree|}
}
\end{eqnarray}


Tal como dizia no enunciado, contruímos as |QTrees| com compressões 1, 2, 3 e 4,
obtendo então, respetivamente, a Figura~\ref{fig:compress1},
a Figura~\ref{fig:compress2}, a Figura~\ref{fig:compress3}
e a Figura~\ref{fig:compress4}.

\begin{figure}
\begin{subfigure}{0.4\textwidth}
    \begin{center}
    \includegraphics[width=0.25\textwidth]{imgs/compress1.png}
    \end{center}
    \caption{Figura Person comprimida em 1 nível.}
    \label{fig:compress1}
\end{subfigure}
\begin{subfigure}{0.4\textwidth}
    \begin{center}
    \includegraphics[width=0.23\textwidth]{imgs/compress2.png}
    \end{center}
    \caption{Figura Person comprimida em 2 níveis.}
    \label{fig:compress2}
\end{subfigure}
\end{figure}

\begin{figure}
\begin{subfigure}{0.4\textwidth}
    \begin{center}
    \includegraphics[width=0.25\textwidth]{imgs/compress3.png}
    \end{center}
    \caption{Figura Person comprimida em 3 níveis.}
    \label{fig:compress3}
\end{subfigure}
\begin{subfigure}{0.4\textwidth}
    \begin{center}
    \includegraphics[width=0.22\textwidth]{imgs/compress4.png}
    \end{center}
    \caption{Figura Person comprimida em 4 níveis.}
    \label{fig:compress4}
\end{subfigure}
\end{figure}


\item Função |outlineQTree|

A função |outlineQTree| recebe uma função que determina quais os píxeis de
fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o
contorno de uma malha poligonal contida na imagem.

Após analisar o problema e as funções que o enunciado já fornece percebemos
que podemos aproveitar uma função já existente e adaptá-la ao nosso problema.
Esta função é a função |qt2bm|, que converte uma |QTree a| em |Matrix a|.

\begin{eqnarray*}
\start
|qt2bm :: (Eq a) => QTree a -> Matrix a|
\more
|qt2bm = cataQTree (either f g) where|
\more
|f (k,(i,j)) = matrix j i (const k)|
\more
|g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)|
\end{eqnarray*}

Assim, olhamos para o gene do |cataQTree (either f g)| e pensamos no que teremos
que alterar para a nossa função |outlineQTree| retornar uma |Matrix Bool|.
Sabemos que teremos que aplicar a função passada como parâmetro às |Cell|
de modo a saber se a mesma se trata de um píxel (conjunto de píxeis) de fundo.

Uma vez que é a |Cell| que contém os píxeis, no que diz respeito ao |Block|
nada precisará de ser feito. Logo, a função |g| será exatamente a mesma.

No caso das |Cell|, teremos então que dividir a função |f| em dois casos,
um deles quando após aplicada a função dada como parâmetro ao conteúdo da |Cell|
dá |True| e o segundo quando dá |False|:
\begin{enumerate}
\item |True|- contéudo da |Cell| ser um píxel de fundo:

Neste caso, sabemos que teremos que devolver uma |Matrix Bool| onde
o interior será |False| e o contorno |True|, por exemplo, para uma
Matriz de 4x4:
\begin{verbatim}
( True True  True  True )
( True False False True )
( True False False True )
( True True  True  True )
\end{verbatim}

Logo, aproveitando a função |matrix|, usamos uma expressão lambda
onde se as coordenadas (x, y) da matriz pertencerem à borda da mesma,
ou seja, isso acontece quando |x == 1| ou |y == 1| ou |x == largura maxima| ou
|y == altura maxima|, o valor é |True|, caso contrário o valor será |False|.

\item |False|- O contéudo da |Cell| não ser um píxel de fundo:

Neste caso, basta aplicar a função |matrix| onde o conteúdo dos
elementos é |False|.

\end{enumerate}

Consequentemente, temos todos os dados para definir a nossa função |outlineQTree|:

\begin{code}
outlineQTree magic a = cataQTree (either (f magic) g) a
    where f magic (k,(i,j))
            | (magic k) = matrix j i (\(x,y) -> if (x == 1 || y == 1 || x == j || y == i) then True else False)
            | otherwise = matrix j i (const False)
          g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)

\end{code}

\begin{figure}
\begin{subfigure}{0.4\textwidth}
    \begin{center}
    \includegraphics[width=0.25\textwidth]{imgs/outline1.png}
    \end{center}
    \caption{Figura Person produzida com a função |outlineBMP|.}
    \label{fig:outline1}
\end{subfigure}
\begin{subfigure}{0.4\textwidth}
    \begin{center}
    \includegraphics[width=0.25\textwidth]{imgs/outline2.png}
    \end{center}
    \caption{Figura Person produzida com a função |addOutlineBMP|.}
    \label{fig:outline2}
\end{subfigure}
\end{figure}


No enunciado desta função era ainda sugerido que produzissemos imagens
com o auxílio de duas funções que utilizam a |outlineQTree|. As duas
imagens que obtivemos estão presentes na Figura~\ref{fig:outline1}
e a Figura~\ref{fig:outline2}.

\end{enumerate}


É ainda de salientar que todas as funções do problema passaram em todos os testes
do QuickCheck e nos Testes Unitários.

\subsection*{Problema 3}

O objetivo deste problema é derivar as funções |base k| e |loop| de modo a
podermos calcular as combinações de |n| |k|-a-|k|,
\begin{eqnarray*}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
\end{eqnarray*}
recorrendo a um ciclo-for onde apenas se fazem multiplicações e somas:
\begin{eqnarray*}
    |bin n k = h k (n-k) where h k n = let (a,_,b,_) = for loop (base k) n in a % b|
\end{eqnarray*}

Tendo em conta o |where h k n| e o |in a % b| da função acima apresentada
e comparando com a definição de |h k| do enunciado,
\begin{eqnarray*}
\start
       |h k n = frac (f k n) (g n)|
\more
       |f k n = frac (fac ((n+k))) (fac k)|
\more
       |g n = fac n|
\end{eqnarray*}
constatamos que o nosso \material{a} em |in a % b| terá que ser a função
|f k| e o \material{b} será a função |g|.

Assim, para podermos descobrir a definição das funções pedidas (|base k| e |loop|)
teremos que, a partir da definição de |f k| (e consequentemente de |l k|) e da definição
de |g| (e consequentemente de |s|), descobrirmos a definição de |split (f k) (l k)|
e de |split g s| (com recurso à lei da recursividade múltipla)
e posteriormente combinarmos os seus resultados com a lei de banana-split.

Para tal, dividimos o nosso problema em diferentes partes:

\begin{enumerate}
\item Determinar |split (f k) (l k)|

Para isso, tirando partido da indicação do enunciado, ou seja, com o intuito
de aplicar a lei da recursividade múltipla, temos:

\begin{eqnarray*}
\start
    |lcbr(
		f k . in = o . F (split (f k) (l k))
	)(
		l k . in = p . F (split (f k) (l k))
	)|
%
\just\equiv{ Fokkinga: (50) }
%
|split (f k) (l k) = cataNat (split o p)|
%
\end{eqnarray*}

O objetivo será então determinar |o| e |p| e, para isso, teremos que olhar
individualmente para cada uma das funções |f k| e |l k|, apresentadas no
enunciado:

\begin{enumerate}
\item Descobrir |o| (com a ajuda da função |f k|)

\begin{eqnarray*}
\start
    |lcbr(
        f k 0 = 1
    )(
        f k (d + 1) = (l k d) * (f k d)
    )|
%
\just\equiv{ Def comp: (74) ; (*) escrita como função prefixo }
%
    |lcbr(
		f k . 0 = 1
	)(
		f k . (d + 1) = (*) (l k d) (f k d)
	)|
%
\just\equiv{ Igualdade extencional: (73) ; Def const: (76) }
%
    |lcbr(
		f k . (const 0) = (const 1)
	)(
		f k . (d + 1) = (*) (l k d) (f k d)
	)|
%
\just\equiv{ Definição de mul: mul (a, b) = (*) a b ;  }
%
    |lcbr(
        f k . (const 0) = (const 1)
    )(
        f k . (d + 1) = mul (f k d, l k d)
    )|
%
\just\equiv{ Def split: (78) ; Def comp: (74) ; Definição de succ: succ d = d + 1 ; Igualdade extencional: (73) }
%
    |lcbr(
		f k . (const 0) = (const 1)
	)(
		f k . (succ) = mul . split (f k) (l k)
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (f k . (const 0)) (f k . (succ)) = either ((const 1) . id) (mul . split (f k) (l k))|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|f k . (either (const 0) ((succ))) = (either (const 1) (mul)) . (id + split (f k) (l k)) |
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split (f k) (l k)) = (id + split (f k) (l k))| }
%
|f k . in = (either (const 1) (mul)) . F (split (f k) (l k) |
%
\end{eqnarray*}

Logo, |o = (either (const 1) (mul))|.


\item Descobrir |p| (com a ajuda da função |l k|)
\begin{eqnarray*}
\start
    |lcbr(
        l k 0 = k + 1
    )(
        l k (d + 1) = l k d + 1
    )|
%
\just\equiv{ Def comp: (74) }
%
    |lcbr(
		l k . 0 =  k + 1
	)(
		l k . (d + 1) = l k d + 1
	)|
%
\just\equiv{ Definição de succ: succ d = d + 1 ; Def const: (76) ; Igualdade extencional: (73) }
%
    |lcbr(
		l k . (const 0) =  const (succ k)
	)(
		l k . (succ) = succ . (l k)
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (l k . (const 0)) (l k . (succ)) = either (const (succ k)) (succ . l k)|
%
\just\equiv{ Natural id : (1) ; Cancelamento x : (7) }
%
|either (l k . (const 0)) (l k . (succ)) = either (const (succ k) . id) (succ . p2 . split (f k) (l k))|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|l k . (either (const 0) ((succ))) = (either (const (succ k)) (succ . p2)) . (id + split (f k) (l k)) |
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split (f k) (l k)) = (id + split (f k) (l k))| }
%
|l k . in = (either (const (succ k)) (succ . p2)) . F (split (f k) (l k))|
%
\end{eqnarray*}

Logo, |p =  (either (const (succ k)) (succ . p2))|.

\vspace{0.5cm}

Deste modo, após encontrarmos a definição de |o| e de |p| conseguimos determinar
a definição de |split (f k) (l k)| uma vez que já haviamos concluido que
|split (f k) (l k) = cataNat (split o p)|.

Logo, |split (f k) (l k) = cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))|.
\end{enumerate}


\item Determinar |split g s|

Para descobrir |split g s| seguimos o mesmo raciocínio, isto é, tentamos
descobrir um |v| e um |j| de modo a podermos aplicar a lei da recursividade múltipla:

\begin{eqnarray*}
\start
    |lcbr(
		g . in = v . F (split g s)
	)(
		s . in = j . F (split g s)
	)|
%
\just\equiv{ Fokkinga: (50) }
%
|split g s = cataNat (split v j)|
%
\end{eqnarray*}

\begin{enumerate}
\item Descobrir |v| (com a ajuda da função |g|)

\begin{eqnarray*}
\start
    |lcbr(
        g 0 = 1
    )(
        g (d+1) = (g d) * (s d)
    )|
%
\just\equiv{ Def comp: (74) ; (*) escrita como função prefixo }
%
    |lcbr(
		g . 0 = 1
	)(
		g . (d + 1) = (*) (g d) (s d)
	)|
%
\just\equiv{ Igualdade extencional: (73) ; Def const: (76) }
%
    |lcbr(
		g . (const 0) = (const 1)
	)(
		g . (d + 1) = (*) (g d) (s d)
	)|
%
\just\equiv{ Definição de mul: mul (a, b) = (*) a b ;  }
%
    |lcbr(
        g . (const 0) = (const 1)
    )(
        g . (d + 1) = mul (g d, s d)
    )|
%
\just\equiv{ Def split: (78) ; Def comp: (74) ; Definição de succ: succ d = d + 1 ; Igualdade extencional: (73) }
%
    |lcbr(
		g . (const 0) = (const 1)
	)(
		g . (succ) = mul . split (g) (s)
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (g . (const 0)) (g . (succ)) = either ((const 1) . id) (mul . split g s)|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|g . (either (const 0) ((succ))) = (either (const 1) (mul)) . (id + split g s)|
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split g s) = (id + split g s| }
%
|g . in = (either (const 1) (mul)) . F (split g s)|
%
\end{eqnarray*}

Logo, |v = (either (const 1) (mul))|.


\item Descobrir |j| (com a ajuda da função |s|)
\begin{eqnarray*}
\start
    |lcbr(
        s 0 = 1
    )(
        s (d + 1) = s d + 1
    )|
%
\just\equiv{ Def comp: (74) }
%
    |lcbr(
		s . 0 =  1
	)(
		s . (d + 1) = s d + 1
	)|
%
\just\equiv{ Definição de succ: succ d = d + 1 ; Def const: (76) ; Igualdade extencional: (73) }
%
    |lcbr(
		s . (const 0) =  const 1
	)(
		s . (succ) = succ . s
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (s . (const 0)) (s . (succ)) = either (const 1) (succ . s)|
%
\just\equiv{ Natural id : (1) ; Cancelamento x : (7) }
%
|either (s. (const 0)) (s . (succ)) = either (const 1 . id) (succ . p2 . split g s)|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|s . (either (const 0) ((succ))) = (either (const 1) (succ . p2)) . (id + split s g) |
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split s g = (id + split s g)| }
%
|s . in = (either (const 1) (succ . p2)) . F (split s g) |
%
\end{eqnarray*}

Logo, |j =  (either (const 1) (succ . p2))|.

\vspace{0.5cm}

Deste modo, após encontrarmos a definição de |v| e de |j| conseguimos determinar
a definição de |split g s| uma vez que já haviamos constatado que
|split g s = cataNat (split v j)|.

Logo, |split g s = cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2)))|.
\end{enumerate}


\item Aplicar a lei de banana split à definição de |split (f k) (l k)| e |split g s|
>>>>>>> 92ef662830d1a4bcacb7f52ed2b5cba883d1b669

A lei de banana split (51) é a seguinte:
\begin{eqnarray*}
\start
|split (cataNat i) (cataNat j)|
%
\just\equiv{ Banana-split : (51) }
%
|cataNat ((i >< j) . (split (F p1) (F p2)))|
%
\end{eqnarray*}

Assim, podemos constatar que, no nosso caso:
\begin{eqnarray*}
|cataNat i = cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))|
\end{eqnarray*}
e
\begin{eqnarray*}
|cataNat j = cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2)))|
\end{eqnarray*}


Assim, retomando o resultado anterior e aplicando a lei temos:
\begin{eqnarray*}
\start
|split (cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))) (cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2))))|
%
\just\equiv{ Banana-split : (51) }
%
|cataNat ( ((cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))) >< (cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2))))) . split (F p1) (F p2) )|
%
\end{eqnarray*}

Agora podemos então continuar a resolver o problema, sempre com o intuito de chegar
a um |cataNat (either b i)| para podermos aplicar a definição de ciclo for:
\begin{eqnarray*}
|for b (const i) = cataNat (either i b)|
\end{eqnarray*}

\vspace{0.5cm}

Retomando o resultado anterior e continuando a aplicar as leis do cálculo de programas, temos:
\begin{eqnarray*}
\start
|cataNat ( ((split (either (const 1) (mul)) (either (const (succ k)) (succ . p2))) >< (split (either (const 1) (mul)) (either (const 1) (succ . p2)))) . split (F p1) (F p2) )|
%
\just\equiv{ Absorção x : (11) ; Lei da troca : (28) }
%
|cataNat ( split ((either ( split (const 1) (const (succ k)) ) ( split (mul) (succ . p2) )) . F p1) ((either ( split (const 1) (const 1) ) ( split (mul) (succ . p2) )) . F p2)   )|
%
\just\equiv{ Definição do Functor (dos naturais): |F p1 = id + p1|, |F p2 = id + p2| }
%
|cataNat ( split ((either ( split (const 1) (const (succ k)) ) ( split (mul) (succ . p2) )) . (id + p1)) ((either ( split (const 1) (const 1) ) ( split (mul) (succ . p2) )) . (id + p2))   )|
%
\just\equiv{ Absorção + : (22) x2 ; Fusão x : (10) x2 ; Natural id : (1) x2 }
%
|cataNat ( split (either ( split (const 1) (const (succ k)) ) ( split (mul . p1) (succ . p2 . p1) )) (either ( split (const 1) (const 1) ) ( split (mul . p2) (succ . p2 . p2) ))  )|
%
\just\equiv{ Lei da troca : (28) }
%
|cataNat ( either ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2)) ) ) |
%
\just\equiv{ Definição de for: |for b (const i) = cataNat (either i b)| }
%
|for ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2))) ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}


Assim, tendo em conta a definição do enunciado:
\begin{eqnarray*}
| for loop (base k) |
\end{eqnarray*}

E comparando com o nosso resultado:
\begin{eqnarray*}
|for ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2))) ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}

Temos que:
\begin{eqnarray*}
\start
| loop = ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2))) |
\more
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}

\item Derivar a definição de |base k|

Focando em |base k|:
\begin{eqnarray*}
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}

Vamos agora introduzir variáveis à definição |pointfree| para
podermos ter o resultado da função |base k| em haskell.

Uma vez que o tipo de split, por exemplo, |split (id) (id)| é:
\hfill \break
\xymatrix@@C=20cm{
    |A|
           \ar[d]_-{|split (id) (id)|}
\\
    |A >< A|
}
\hfill \break

O tipo de |split (split (id) (id)) (split (id) (id))| será:
\hfill \break
\xymatrix@@C=20cm{
    |A|
           \ar[d]_-{|split (split (id) (id)) (split (id) (id))|}
\\
    |(A >< A) >< (A >< A)|
}
\hfill \break

Assim, conseguimos perceber qual é o tipo da variável que temos que adicionar
uma vez que no nosso caso também se trata de um split de split.

Logo, continuando a derivação:
\begin{eqnarray*}
\start
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
%
\just\equiv{ Igualdade extensional : (73)  }
%
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) a |
%
\just\equiv{ Def split : (78) }
%
| base k = ((split (const 1) (const (succ k))) a, (split (const 1) (const 1)) a) |
%
\just\equiv{ Def split : (78) x2 }
%
| base k = ( ((const 1) a, (const (succ k)) a), ((const 1) a, (const 1) a) ) |
%
\just\equiv{ Def const : (76) x4 ; Definição de succ: succ k = k + 1 }
%
| base k = ( (1, k + 1), (1, 1) ) |
%
\end{eqnarray*}

Porém, tendo em consideração a implementação desejada:
\begin{eqnarray*}
    |bin n k = h k (n-k) where h k n = let (a,_,b,_) = for loop (base k) n in a % b|
\end{eqnarray*}

Vemos que em |let (a,_,b,_)| o tipo de dados é um quádruplo o que implica que
os tipos de |loop| e |base k|, mais especificamente
o tipo de retorno, terão que ser também um quádruplo (o |for loop (base k) n|, por sua vez,
também deverá retornar um quádruplo).

Deste modo, através da aplicação de uma simples função que nos altere o tipo de dados, por exemplo:
\begin{eqnarray*}
\start
|altera :: ((a, b), (c, d)) -> (a, b, c, d)|
\more
|altera ((a, b), (c, d)) = (a, b, c, d)|
\end{eqnarray*}

Conseguimos ter a derivação desejada da função |base k|:
\begin{eqnarray*}
|base k = (1, k + 1, 1, 1)|
\end{eqnarray*}

\item Derivar a definição de |loop|

Por último, para derivar a definição de |loop| teremos que pensar da mesma forma, ou seja,
inserir variáveis. Porém, ao contrário da função |base k|, as variáveis a inserir terão que ser
do tipo ((a, b), (c, d)) uma vez que temos um split com projeções |p1| e |p2|.
Nos diagramas abaixo pode-se verificar o motivo desta diferença de domínio:

Tendo em conta o primeiro split do split maior, temos:
\hfill \break
\xymatrix@@C=5cm{
    |(A >< B) >< (C >< D)|
           \ar[d]_-{|split (mul . p1) (succ . p2 . p1)|}
\\
    |Z >< B|
}
\hfill \break

É de salientar que o tipo mul (a, b) = a * b, ou seja, o tipo desta função é:
\hfill \break
\xymatrix@@C=5cm{
    |(A >< B)|
           \ar[d]_-{|mul|}
\\
    |Z|
}
\hfill \break


Tendo agora em consideração o segundo split do split maior, temos:
\hfill \break
\xymatrix@@C=5cm{
    |(A >< B) >< (C >< D)|
           \ar[d]_-{|split (mul . p2) (succ . p2 . p2)|}
\\
    |(Z >< D)|
}
\hfill \break


Temos então,
\begin{eqnarray*}
\start
| loop = split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2)) |
%
\just\equiv{ Igualdade extensional : (73)  }
%
| loop = split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2)) ((a, b), (c, d)) |
%
\just\equiv{ Def split : (78) }
%
| loop = ((split (mul . p1) (succ . p2 . p1)) ((a, b), (c, d)), (split (mul . p2) (succ . p2 . p2)) ((a, b), (c, d))) |
%
\just\equiv{ Def split : (78) x2 ; Def comp : (74) x6 ; Def proj : (81) x6 }
%
| loop = ( (mul (a, b), succ b), (mul (c, d), succ d) ) |
%
\just\equiv{ Definição de succ : succ k = k + 1  x2 ; Definição de mul : mul (m,n) = m * n x2 }
%
| loop = ( (a * b, b + 1), (c * d, d + 1) ) |
%
\end{eqnarray*}

Deparámo-nos com o mesmo problema da função |base k| e por isso vamos aplicar novamente a função
|altera| para reparar o tipo de dados de retorno. Temos então:
\begin{eqnarray*}
|loop (a, b, c, d) = (a * b, b + 1, c * d, d + 1)|
\end{eqnarray*}

\end{enumerate}


Deste modo, obtemos os dois resultados pretendidos:

O objetivo deste problema é derivar as funções |base k| e |loop| de modo a
podermos calcular as combinações de |n| |k|-a-|k|,
\begin{eqnarray*}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
\end{eqnarray*}
recorrendo a um ciclo-for onde apenas se fazem multiplicações e somas:
\begin{eqnarray*}
    |bin n k = h k (n-k) where h k n = let (a,_,b,_) = for loop (base k) n in a % b|
\end{eqnarray*}

Tendo em conta o |where h k n| e o |in a % b| da função acima apresentada
e comparando com a definição de |h k| do enunciado,
\begin{eqnarray*}
\start
       |h k n = frac (f k n) (g n)|
\more
       |f k n = frac (fac ((n+k))) (fac k)|
\more
       |g n = fac n|
\end{eqnarray*}
constatamos que o nosso \material{a} em |in a % b| terá que ser a função
|f k| e o \material{b} será a função |g|.

Assim, para podermos descobrir a definição das funções pedidas (|base k| e |loop|)
teremos que, a partir da definição de |f k| (e consequentemente de |l k|) e da definição
de |g| (e consequentemente de |s|), descobrirmos a definição de |split (f k) (l k)|
e de |split g s| (com recurso à lei da recursividade múltipla)
e posteriormente combinarmos os seus resultados com a lei de banana-split.

Para tal, dividimos o nosso problema em diferentes partes:

\begin{enumerate}
\item Determinar |split (f k) (l k)|

Para isso, tirando partido da indicação do enunciado, ou seja, com o intuito
de aplicar a lei da recursividade múltipla, temos:

\begin{eqnarray*}
\start
    |lcbr(
		f k . in = o . F (split (f k) (l k))
	)(
		l k . in = p . F (split (f k) (l k))
	)|
%
\just\equiv{ Fokkinga: (50) }
%
|split (f k) (l k) = cataNat (split o p)|
%
\end{eqnarray*}

O objetivo será então determinar |o| e |p| e, para isso, teremos que olhar
individualmente para cada uma das funções |f k| e |l k|, apresentadas no
enunciado:

\begin{enumerate}
\item Descobrir |o| (com a ajuda da função |f k|)

\begin{eqnarray*}
\start
    |lcbr(
        f k 0 = 1
    )(
        f k (d + 1) = (l k d) * (f k d)
    )|
%
\just\equiv{ Def comp: (74) ; (*) escrita como função prefixo }
%
    |lcbr(
		f k . 0 = 1
	)(
		f k . (d + 1) = (*) (l k d) (f k d)
	)|
%
\just\equiv{ Igualdade extencional: (73) ; Def const: (76) }
%
    |lcbr(
		f k . (const 0) = (const 1)
	)(
		f k . (d + 1) = (*) (l k d) (f k d)
	)|
%
\just\equiv{ Definição de mul: mul (a, b) = (*) a b ;  }
%
    |lcbr(
        f k . (const 0) = (const 1)
    )(
        f k . (d + 1) = mul (f k d, l k d)
    )|
%
\just\equiv{ Def split: (78) ; Def comp: (74) ; Definição de succ: succ d = d + 1 ; Igualdade extencional: (73) }
%
    |lcbr(
		f k . (const 0) = (const 1)
	)(
		f k . (succ) = mul . split (f k) (l k)
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (f k . (const 0)) (f k . (succ)) = either ((const 1) . id) (mul . split (f k) (l k))|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|f k . (either (const 0) ((succ))) = (either (const 1) (mul)) . (id + split (f k) (l k)) |
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split (f k) (l k)) = (id + split (f k) (l k))| }
%
|f k . in = (either (const 1) (mul)) . F (split (f k) (l k) |
%
\end{eqnarray*}

Logo, |o = (either (const 1) (mul))|.


\item Descobrir |p| (com a ajuda da função |l k|)
\begin{eqnarray*}
\start
    |lcbr(
        l k 0 = k + 1
    )(
        l k (d + 1) = l k d + 1
    )|
%
\just\equiv{ Def comp: (74) }
%
    |lcbr(
		l k . 0 =  k + 1
	)(
		l k . (d + 1) = l k d + 1
	)|
%
\just\equiv{ Definição de succ: succ d = d + 1 ; Def const: (76) ; Igualdade extencional: (73) }
%
    |lcbr(
		l k . (const 0) =  const (succ k)
	)(
		l k . (succ) = succ . (l k)
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (l k . (const 0)) (l k . (succ)) = either (const (succ k)) (succ . l k)|
%
\just\equiv{ Natural id : (1) ; Cancelamento x : (7) }
%
|either (l k . (const 0)) (l k . (succ)) = either (const (succ k) . id) (succ . p2 . split (f k) (l k))|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|l k . (either (const 0) ((succ))) = (either (const (succ k)) (succ . p2)) . (id + split (f k) (l k)) |
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split (f k) (l k)) = (id + split (f k) (l k))| }
%
|l k . in = (either (const (succ k)) (succ . p2)) . F (split (f k) (l k))|
%
\end{eqnarray*}

Logo, |p =  (either (const (succ k)) (succ . p2))|.

\vspace{0.5cm}

Deste modo, após encontrarmos a definição de |o| e de |p| conseguimos determinar
a definição de |split (f k) (l k)| uma vez que já haviamos concluido que
|split (f k) (l k) = cataNat (split o p)|.

Logo, |split (f k) (l k) = cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))|.
\end{enumerate}


\item Determinar |split g s|

Para descobrir |split g s| seguimos o mesmo raciocínio, isto é, tentamos
descobrir um |v| e um |j| de modo a podermos aplicar a lei da recursividade múltipla:

\begin{eqnarray*}
\start
    |lcbr(
		g . in = v . F (split g s)
	)(
		s . in = j . F (split g s)
	)|
%
\just\equiv{ Fokkinga: (50) }
%
|split g s = cataNat (split v j)|
%
\end{eqnarray*}

\begin{enumerate}
\item Descobrir |v| (com a ajuda da função |g|)

\begin{eqnarray*}
\start
    |lcbr(
        g 0 = 1
    )(
        g (d+1) = (g d) * (s d)
    )|
%
\just\equiv{ Def comp: (74) ; (*) escrita como função prefixo }
%
    |lcbr(
		g . 0 = 1
	)(
		g . (d + 1) = (*) (g d) (s d)
	)|
%
\just\equiv{ Igualdade extencional: (73) ; Def const: (76) }
%
    |lcbr(
		g . (const 0) = (const 1)
	)(
		g . (d + 1) = (*) (g d) (s d)
	)|
%
\just\equiv{ Definição de mul: mul (a, b) = (*) a b ;  }
%
    |lcbr(
        g . (const 0) = (const 1)
    )(
        g . (d + 1) = mul (g d, s d)
    )|
%
\just\equiv{ Def split: (78) ; Def comp: (74) ; Definição de succ: succ d = d + 1 ; Igualdade extencional: (73) }
%
    |lcbr(
		g . (const 0) = (const 1)
	)(
		g . (succ) = mul . split (g) (s)
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (g . (const 0)) (g . (succ)) = either ((const 1) . id) (mul . split g s)|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|g . (either (const 0) ((succ))) = (either (const 1) (mul)) . (id + split g s)|
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split g s) = (id + split g s| }
%
|g . in = (either (const 1) (mul)) . F (split g s)|
%
\end{eqnarray*}

Logo, |v = (either (const 1) (mul))|.


\item Descobrir |j| (com a ajuda da função |s|)
\begin{eqnarray*}
\start
    |lcbr(
        s 0 = 1
    )(
        s (d + 1) = s d + 1
    )|
%
\just\equiv{ Def comp: (74) }
%
    |lcbr(
		s . 0 =  1
	)(
		s . (d + 1) = s d + 1
	)|
%
\just\equiv{ Definição de succ: succ d = d + 1 ; Def const: (76) ; Igualdade extencional: (73) }
%
    |lcbr(
		s . (const 0) =  const 1
	)(
		s . (succ) = succ . s
	)|
%
\just\equiv{ Eq + : (27) ; Natural id : (1) }
%
|either (s . (const 0)) (s . (succ)) = either (const 1) (succ . s)|
%
\just\equiv{ Natural id : (1) ; Cancelamento x : (7) }
%
|either (s. (const 0)) (s . (succ)) = either (const 1 . id) (succ . p2 . split g s)|
%
\just\equiv{ Fusão + : (20) ; Absorção x : (11) }
%
|s . (either (const 0) ((succ))) = (either (const 1) (succ . p2)) . (id + split s g) |
%
\just\equiv{ Definição de in e functor (dos naturais): |in = either (const 0) ((succ))| , |F (split s g = (id + split s g)| }
%
|s . in = (either (const 1) (succ . p2)) . F (split s g) |
%
\end{eqnarray*}

Logo, |j =  (either (const 1) (succ . p2))|.

\vspace{0.5cm}

Deste modo, após encontrarmos a definição de |v| e de |j| conseguimos determinar
a definição de |split g s| uma vez que já haviamos constatado que
|split g s = cataNat (split v j)|.

Logo, |split g s = cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2)))|.
\end{enumerate}


\item Aplicar a lei de banana split à definição de |split (f k) (l k)| e |split g s|

A lei de banana split (51) é a seguinte:
\begin{eqnarray*}
\start
|split (cataNat i) (cataNat j)|
%
\just\equiv{ Banana-split : (51) }
%
|cataNat ((i >< j) . (split (F p1) (F p2)))|
%
\end{eqnarray*}

Assim, podemos constatar que, no nosso caso:
\begin{eqnarray*}
|cataNat i = cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))|
\end{eqnarray*}
e
\begin{eqnarray*}
|cataNat j = cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2)))|
\end{eqnarray*}


Assim, retomando o resultado anterior e aplicando a lei temos:
\begin{eqnarray*}
\start
|split (cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))) (cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2))))|
%
\just\equiv{ Banana-split : (51) }
%
|cataNat ( ((cataNat (split (either (const 1) (mul)) (either (const (succ k)) (succ . p2)))) >< (cataNat (split (either (const 1) (mul)) (either (const 1) (succ . p2))))) . split (F p1) (F p2) )|
%
\end{eqnarray*}

Agora podemos então continuar a resolver o problema, sempre com o intuito de chegar
a um |cataNat (either b i)| para podermos aplicar a definição de ciclo for:
\begin{eqnarray*}
|for b (const i) = cataNat (either i b)|
\end{eqnarray*}

\vspace{0.5cm}

Retomando o resultado anterior e continuando a aplicar as leis do cálculo de programas, temos:
\begin{eqnarray*}
\start
|cataNat ( ((split (either (const 1) (mul)) (either (const (succ k)) (succ . p2))) >< (split (either (const 1) (mul)) (either (const 1) (succ . p2)))) . split (F p1) (F p2) )|
%
\just\equiv{ Absorção x : (11) ; Lei da troca : (28) }
%
|cataNat ( split ((either ( split (const 1) (const (succ k)) ) ( split (mul) (succ . p2) )) . F p1) ((either ( split (const 1) (const 1) ) ( split (mul) (succ . p2) )) . F p2)   )|
%
\just\equiv{ Definição do Functor (dos naturais): |F p1 = id + p1|, |F p2 = id + p2| }
%
|cataNat ( split ((either ( split (const 1) (const (succ k)) ) ( split (mul) (succ . p2) )) . (id + p1)) ((either ( split (const 1) (const 1) ) ( split (mul) (succ . p2) )) . (id + p2))   )|
%
\just\equiv{ Absorção + : (22) x2 ; Fusão x : (10) x2 ; Natural id : (1) x2 }
%
|cataNat ( split (either ( split (const 1) (const (succ k)) ) ( split (mul . p1) (succ . p2 . p1) )) (either ( split (const 1) (const 1) ) ( split (mul . p2) (succ . p2 . p2) ))  )|
%
\just\equiv{ Lei da troca : (28) }
%
|cataNat ( either ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2)) ) ) |
%
\just\equiv{ Definição de for: |for b (const i) = cataNat (either i b)| }
%
|for ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2))) ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}


Assim, tendo em conta a definição do enunciado:
\begin{eqnarray*}
| for loop (base k) |
\end{eqnarray*}

E comparando com o nosso resultado:
\begin{eqnarray*}
|for ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2))) ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}

Temos que:
\begin{eqnarray*}
\start
| loop = ( split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2))) |
\more
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}

\item Derivar a definição de base k

Focando em |base k|:
\begin{eqnarray*}
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
\end{eqnarray*}

Vamos agora introduzir variáveis à definição |pointfree| para
podermos ter o resultado da função |base k| em haskell.

Uma vez que o tipo de split, por exemplo, |split (id) (id)| é:
\hfill \break
\xymatrix@@C=20cm{
    |A|
           \ar[d]_-{|split (id) (id)|}
\\
    |A >< A|
}
\hfill \break

O tipo de |split (split (id) (id)) (split (id) (id))| será:
\hfill \break
\xymatrix@@C=20cm{
    |A|
           \ar[d]_-{|split (split (id) (id)) (split (id) (id))|}
\\
    |(A >< A) >< (A >< A)|
}
\hfill \break

Assim, conseguimos perceber qual é o tipo da variável que temos que adicionar
uma vez que no nosso caso também se trata de um split de split.

Logo, continuando a derivação:
\begin{eqnarray*}
\start
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) |
%
\just\equiv{ Igualdade extensional : (73)  }
%
| base k = ( split (split (const 1) (const (succ k))) (split (const 1) (const 1)) ) a |
%
\just\equiv{ Def split : (78) }
%
| base k = ((split (const 1) (const (succ k))) a, (split (const 1) (const 1)) a) |
%
\just\equiv{ Def split : (78) x2 }
%
| base k = ( ((const 1) a, (const (succ k)) a), ((const 1) a, (const 1) a) ) |
%
\just\equiv{ Def const : (76) x4 ; Definição de succ: succ k = k + 1 }
%
| base k = ( (1, k + 1), (1, 1) ) |
%
\end{eqnarray*}

Porém, tendo em consideração a implementação desejada:
\begin{eqnarray*}
    |bin n k = h k (n-k) where h k n = let (a,_,b,_) = for loop (base k) n in a % b|
\end{eqnarray*}

Vemos que em |let (a,_,b,_)| o tipo de dados é um quádruplo o que implica que
os tipos de |loop| e |base k|, mais especificamente
o tipo de retorno, terão que ser também um quádruplo (o |for loop (base k) n|, por sua vez,
também deverá retornar um quádruplo).

Deste modo, através da aplicação de uma simples função que nos altere o tipo de dados, por exemplo:
\begin{eqnarray*}
\start
|altera :: ((a, b), (c, d)) -> (a, b, c, d)|
\more
|altera ((a, b), (c, d)) = (a, b, c, d)|
\end{eqnarray*}

Conseguimos ter a derivação desejada da função |base k|:
\begin{eqnarray*}
|base k = (1, k + 1, 1, 1)|
\end{eqnarray*}

\item Derivar a definição de loop

Por último, para derivar a definição de |loop| teremos que pensar da mesma forma, ou seja,
inserir variáveis. Porém, ao contrário da função |base k|, as variáveis a inserir terão que ser
do tipo ((a, b), (c, d)) uma vez que temos um split com projeções |p1| e |p2|.
Nos diagramas abaixo pode-se verificar o motivo desta diferença de domínio:

Tendo em conta o primeiro split do split maior, temos:
\hfill \break
\xymatrix@@C=5cm{
    |(A >< B) >< (C >< D)|
           \ar[d]_-{|split (mul . p1) (succ . p2 . p1)|}
\\
    |Z >< B|
}
\hfill \break

É de salientar que o tipo mul (a, b) = a * b, ou seja, o tipo desta função é:
\hfill \break
\xymatrix@@C=5cm{
    |(A >< B)|
           \ar[d]_-{|mul|}
\\
    |Z|
}
\hfill \break


Tendo agora em consideração o segundo split do split maior, temos:
\hfill \break
\xymatrix@@C=5cm{
    |(A >< B) >< (C >< D)|
           \ar[d]_-{|split (mul . p2) (succ . p2 . p2)|}
\\
    |(Z >< D|
}
\hfill \break


Temos então,
\begin{eqnarray*}
\start
| loop = split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2)) |
%
\just\equiv{ Igualdade extensional : (73)  }
%
| loop = split (split (mul . p1) (succ . p2 . p1)) (split (mul . p2) (succ . p2 . p2)) ((a, b), (c, d)) |
%
\just\equiv{ Def split : (78) }
%
| loop = ((split (mul . p1) (succ . p2 . p1)) ((a, b), (c, d)), (split (mul . p2) (succ . p2 . p2)) ((a, b), (c, d))) |
%
\just\equiv{ Def split : (78) x2 ; Def comp : (74) x6 ; Def proj : (81) x6 }
%
| loop = ( (mul (a, b), succ b), (mul (c, d), succ d) ) |
%
\just\equiv{ Definição de succ : succ k = k + 1  x2 ; Definição de mul : mul (m,n) = m * n x2 }
%
| loop = ( (a * b, b + 1), (c * d, d + 1) ) |
%
\end{eqnarray*}

Deparámo-nos com o mesmo problema da função |base k| e por isso vamos aplicar novamente a função
|altera| para reparar o tipo de dados de retorno. Temos então:
\begin{eqnarray*}
|loop (a, b, c, d) = (a * b, b + 1, c * d, d + 1)|
\end{eqnarray*}

\end{enumerate}


Deste modo, obtemos os dois resultados pretendidos:

\begin{code}
base k = (1, k + 1, 1, 1)

loop (a, b, c, d) = (a * b, b + 1, c * d, d + 1)
\end{code}

\subsection*{Problema 4}

\begin{code}

inFTree = either Unit (uncurryB Comp)
    where uncurryB f (a,(t1,t2)) = f a t1 t2
outFTree (Unit c)       = Left c
outFTree (Comp a t1 t2) = Right(a,(t1,t2))
baseFTree f g h  = g -|- (f  >< (h >< h))
recFTree f = baseFTree id id f
cataFTree a = a . (recFTree (cataFTree a)) . outFTree
anaFTree f = inFTree . (recFTree (anaFTree f) ) . f
hyloFTree a c = cataFTree a . anaFTree c

instance Bifunctor FTree where
    bimap f g = cataFTree ( inFTree . baseFTree f g id )

generatePTree a = anaFTree (((const 0) -|- (split m (split id id))) . outNat) a
    where
        m x = 50 * (sqrt(2) / 2) ^ abs(x-a)

drawPTree a = anaList ((nil -|- (split list id)) . outNat) (depthFTree a)
    where
        list n = (foldMap lineLoop (squares n))
        squares n = concat $ take (depthFTree a - n) $ iterateM mkBranches start
        start = [(-100,0),(0,0),(0,-100),(-100,-100)]
        iterateM f x = iterate (>>= f) (pure x)
        mkBranches [a, b, c, d] =   let d = 0.5 <*> (b <+> ((-1) <*> a))
                                        l1 = d <+> orth d
                                        l2 = orth l1
                                    in
                                        [ [a <+> l2, b <+> (2 <*> l2), a <+> l1, a]
                                        , [a <+> (2 <*> l1), b <+> l1, b, b <+> l2] ]
        (a, b) <+> (c, d) = (a+c, b+d)
        n <*> (a, b) = (a*n, b*n)
        orth (a, b) = (-b, a)

\end{code}

\subsection*{Problema 5}

O quinto e último problema diz respeito a |monades|. O mónade do
problema é conhecido por \emph{bag}, \emph{saco}
ou \emph{multi-conjunto}, permitindo que os elementos de um
conjunto tenham multiplicidades associadas.

Para este problema o objetivo é que completemos a definição
de |Monad Bag|, nomeadamente no que diz respeito
ao |muB| (multiplicação do mónade |Bag|) e a respetiva
função auxiliar |singletonbag|. É também necessário definir
a função |dist|.

\vspace{0.4cm}

Começando pela função |singletonbag|, tal como o próprio nome indica,
o objetivo dela é ter um saco com apenas um elemento do valor passado como
parâmetro, para ser o |return| do |Monad|.

Assim, a sua definição é intuitiva e é a seguinte:
\begin{code}
singletonbag a = B[(a, 1)]
\end{code}

É o construtor |B| que se encarrega de fazer com que o
tipo de retorno de |singletonbag| seja o desejado.

\vspace{0.3cm}

Quanto ao |muB|, sabemos que o seu tipo de dados deverá ser o seguinte:
\begin{eqnarray*}
|muB :: Bag (Bag a) -> Bag a|
\end{eqnarray*}

Deste modo, tendo ainda em consideração a definição de |Monad|
sabemos que esta função recebe um Bag de Bags, como por
exemplo:
\begin{eqnarray*}
\start
|b2 :: Bag (Bag Marble)|
\more
|b2 = B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)|
\more
|,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],2)]|
\end{eqnarray*}

E que o objetivo é que a função retorne um Bag somente, que, no
caso de correr |muB b2| deverá ser:
\begin{eqnarray*}
\start
|b1 :: Bag Marble|
\more
|b1 = B[(Pink,12),(Green,19),(Red,12),(Blue,12),(White,5)]|
\end{eqnarray*}

Sucintamente, o objetivo do |muB| é que dado um Bag com Bags lá dentro
todos os seus elementos se juntem num só Bag. Para tal, é necessário
ter em atenção quantos Bags estão dentro do Bag maior e
agrupar convenientemente os seus conteúdos,
tal como vimos no exemplo anterior.

Assim, com recurso a algumas funções auxiliares produzimos o código
em seguida:
\begin{code}
muB b = B (concat (fmap unB (junta (unB b))))
    where junta ((ba, int) : bas) = (fmapSpecial (*int) ba) : (junta bas)
          junta [] = []
          fmapSpecial f = B . map (id >< f) . unB
\end{code}

O diagrama seguinte mostra as alterações nos tipos de dados que vão
acontecendo no decorrer da definição de |muB| por nós proposta:
\begin{eqnarray*}
\xymatrix@@C=5cm{
    |Bag(Bag a)|
        \ar[d]_-{|unB|}
\\
    |[(Bag a, Int)]|
        \ar[d]_-{|junta|}
\\
    |[Bag a]|
        \ar[d]_-{|fmap unB|}
\\
    |[[(a, Int)]]|
        \ar[d]_-{|concat|}
\\
    |[(a, Int)]|
        \ar[d]_-{|B|}
\\
    |Bag a|
}
\end{eqnarray*}

Passando a explicar por palavras passo a passo
o que acontece na função |muB|, temos que:
\begin{enumerate}
\item |un B|

Numa primeira fase ``desembrulhamos'' o Bag de Bags, passando agora
a ter uma lista com |(Bag a, Int)| onde poderemos iterar mais facilmente
sobre os elementos.

\item |junta|

Esta função, com a ajuda de uma função auxiliar chamada |fmapSpecial|,
transforma a lista de |(Bag a) >< Int|, sendo que este Int
representa o número de ``sacos'' que existem de |Bag a|, numa só lista de |Bag a|.
A função multiplica o número de sacos que existem daquele tipo pelo conteúdo
dentro do |Bag a|. Ou seja, se temos 3 sacos com 2 berlindes azuis
dentro de cada um sabemos que no total temos 6 berlindes azuis, e é exatamente
isso que a função faz dentro de cada |Bag a| da lista.

\item |fmap unB|

Este passo ``abre'' todos os |Bag a| dentro de |[Bag a]|, ficando agora
com o tipo |[[(a, Int)]]|. Mais uma vez, este passo é feito
para facilitar o manuseamento dos elementos.

\item |concat|

Esta função, já predefinida, é responsável por concatenar a |[[(a, Int)]]|
em |[(a, Int)]|. O que esta função faz é somente juntar os pares |(a, Int)|
numa só lista.

\item |B|

Neste último passo é aplicado o construtor de |Bag| à lista de |(a, Int)| e com
isso fica garantido que os |(a, Int)| repetidos se juntam, somando
os respetivos |Int|, e que o tipo
de dados de retorno é o tipo desejado, nomeadamente |Bag a|.

\end{enumerate}

\vspace{0.3cm}

Para a função |dist|, tendo em consideração o exemplo dado no enunciado, onde para o
``saco'':
\begin{eqnarray*}
|B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]|
\end{eqnarray*}
O resultado da aplicação desta função deverá ser:
\begin{verbatim}
Green  30.0%
  Red  20.0%
 Pink  20.0%
 Blue  20.0%
White  10.0%
\end{verbatim}
Percebemos que |dist| divide o número de elementos de cada elemento
pelo número total de elementos.

Assim, definimos a função como:
\begin{code}
dist (B a) = D ((map (\(x,y) -> (x, (/) (toFloat y) (toFloat (number a))))) a)
    where number [] = 0
          number ((_, int): cs) = int + number cs

\end{code}

A função percorre todos os elementos de |B a| (|[a, Int]|, mais especificamente,
uma vez que é este o parâmetro que passamos ao |map|)
e divide cada Int pelo número total de elementos do conjunto, que é calculado
com a ajuda da função auxiliar |number|.

De modo a retornarmos o resultado da forma correta, nomeadamente |Dist a|,
tivemos que fazer duas pequenas alterações no código: a primeira foi converter
o |y| e o |number a| (numero total de berlindes) de cada par para |Float| antes de os
dividirmos. A segunda é aplicar o construtor |D|, do módulo |Probability|,
ao resultado do |map|
para assim conseguirmos obter o tipo de dados desejado.


\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.}
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Outras definições auxiliares -------------------------------------------%

%if False
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

newtype Nat = Nat {getNat :: Int}
 deriving ( Eq, Ord, Show, Enum, Read, Typeable)

instance Arbitrary Nat where
  arbitrary =
    (frequency
       [ (5, (Nat . abs) `fmap` arbitrary)
       , (1, return (Nat 0))
       ]
    ) `suchThat` ge0
    where ge0 (Nat x) = x >= 0

  shrink (Nat x) =
    [ Nat x'
    | x' <- shrink x
    , x' >= 0
    ]

newtype SmallNat = SmallNat Int
 deriving ( Eq, Ord, Show, Read,Enum,Num,Typeable)

instance Arbitrary SmallNat where
  arbitrary = liftM SmallNat (QuickCheck.choose (0,10))

  shrink (SmallNat x) =
    [ SmallNat x'
    | x' <- shrink x
    , x' >= 0, x' <= 10
    ]

instance Arbitrary a => Arbitrary (Matrix a) where
  arbitrary = do
    rows <- QuickCheck.choose (0,100)
    cols <- QuickCheck.choose (0,100)
    xs <- vectorOf (rows * cols) arbitrary
    return (fromList rows cols xs)
  shrink = shrinkNothing

minusNat :: Int -> Int -> Int
minusNat x = Nat.for predNat x

predNat :: Int -> Int
predNat 0 = 0
predNat n = n - 1

-- * pergunta 1

data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
type Block = (MagicNo, (Time, Transactions))
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
type Ledger = [(Entity, Value)]
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int

inBlockchain :: Either Block (Block, Blockchain) -> Blockchain
outBlockchain :: Blockchain -> Either Block (Block, Blockchain)
recBlockchain :: (c -> d) -> Either b1 (b2, c) -> Either b1 (b2, d)
cataBlockchain :: (Either Block (Block, d) -> d) -> Blockchain -> d
anaBlockchain :: (c -> Either Block (Block, c)) -> c -> Blockchain
hyloBlockchain :: (Either Block (Block, c1) -> c1) -> (c2 -> Either Block (Block, c2)) -> c2 -> c1

list2chain [] = Bc ("numeromagico1", (0, []))
list2chain [b] = Bc b
list2chain (h:t) = Bcs (h, list2chain t)

instance Arbitrary Blockchain where
  arbitrary = do
    xs <- arbitrary
    -- nao convem ter numeros repetidos
    return $ list2chain $ nubBy (\(n, _) (n', _) -> n /= n') xs
  shrink = shrinkNothing

e1 = "ent1"
e2 = "ent2"

mg1 = "b1"
mg2 = "b2"
mg3 = "b3"

tm1 = 1
tm2 = 2
tm3 = 3

t1 = (e1, (100, e2))
t2 = (e2, (50, e1))

bl1, bl2, bl3 :: Block
bl1 = (mg1, (tm1, []))
bl2 = (mg2, (tm2, [t1]))
bl3 = (mg3, (tm3, [t2]))

bs1, bs2 :: Blockchain
bs1 = Bcs (bl1, Bcs (bl2, Bc bl3))
bs2 = Bcs (bl3, Bcs (bl2, Bc bl2))
bs3 = Bc bl2
bs4 = Bcs (bl1, Bc bl3)


reverseChain :: Blockchain -> Blockchain
reverseChain = cataBlockchain (either Bc snocChain)


snocChain :: (Block, Blockchain) -> Blockchain
snocChain (b, Bc b') = Bcs (b', Bc b)
snocChain (b, Bcs (b', bs)) = Bcs (b', snocChain (b, bs))


concChain :: (Blockchain, Blockchain) -> Blockchain
concChain (b1, (Bc b)) = snocChain (b, b1)
concChain (b1, (Bcs (b, bs))) = concChain ((snocChain (b, b1)), bs)


lenChain = cataBlockchain (either (const 1) (succ . p2))

-- * pergunta 2

data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)

inQTree :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
outQTree :: QTree a -> Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))
baseQTree :: (a1 -> b) -> (a2 -> d1) -> Either (a1, d2) (a2, (a2, (a2, a2))) -> Either (b, d2) (d1, (d1, (d1, d1)))
recQTree :: (a -> d1) -> Either (b, d2) (a, (a, (a, a))) -> Either (b, d2) (d1, (d1, (d1, d1)))
cataQTree :: (Either (b, (Int, Int)) (d, (d, (d, d))) -> d) -> QTree b -> d
anaQTree :: (a1 -> Either (a2, (Int, Int)) (a1, (a1, (a1, a1)))) -> a1 -> QTree a2
hyloQTree :: (Either (b, (Int, Int)) (c, (c, (c, c))) -> c) -> (a -> Either (b, (Int, Int)) (a, (a, (a, a)))) -> a -> c

instance (Eq a,Arbitrary a) => Arbitrary (QTree a) where
  arbitrary = do
    rows <- QuickCheck.choose (1,100)
    cols <- QuickCheck.choose (1,100)
    xs <- vectorOf (rows * cols) arbitrary
    return ((bm2qt . fromList rows cols) xs)
  shrink = shrinkNothing

rotateMatrix :: Matrix a -> Matrix a
rotateMatrix m = matrix (ncols m) (nrows m) rot
    where
    rot (j,i) = unsafeGet (nrows m - i + 1) j m

rotatebm :: Eq a => Matrix a -> Matrix a
rotatebm = qt2bm . rotateQTree . bm2qt

rotateBMP :: FilePath -> FilePath -> IO ()
rotateBMP from to = withBMP from to rotatebm

instance Arbitrary PixelRGBA8 where
    arbitrary = do
        r <- px
        g <- px
        b <- px
        a <- px
        return (PixelRGBA8 r g b a)
      where px = QuickCheck.choose (0,255)
    shrink = shrinkNothing

sizeMatrix :: Matrix a -> (Int,Int)
sizeMatrix = ncols `split` nrows

sizeQTree :: QTree a -> (Int,Int)
sizeQTree = cataQTree (either snd g)
    where
    g (a,(b,(c,d))) = (fst a + fst b,snd a + snd c)

shapeQTree :: QTree a -> QTree ()
shapeQTree = fmap (!)

scalebm :: Eq a => Int -> Matrix a -> Matrix a
scalebm s = qt2bm . scaleQTree s . bm2qt

scaleBMP :: Int -> FilePath -> FilePath -> IO ()
scaleBMP s from to = withBMP from to (scalebm s)

invertbm :: Matrix PixelRGBA8 -> Matrix PixelRGBA8
invertbm = qt2bm . invertQTree . bm2qt

invertBMP :: FilePath -> FilePath -> IO ()
invertBMP from to = withBMP from to invertbm

depthQTree :: QTree a -> Int
depthQTree = cataQTree (either (const 0) f)
    where f (a,(b,(c,d))) = 1 + maximum [a,b,c,d]

compressbm :: Eq a => Int -> Matrix a -> Matrix a
compressbm n = qt2bm . compressQTree n . bm2qt

compressBMP :: Int -> FilePath -> FilePath -> IO ()
compressBMP n from to = withBMP from to (compressbm n)

outlinebm :: Eq a => (a -> Bool) -> Matrix a -> Matrix Bool
outlinebm isBackground = outlineQTree isBackground . bm2qt

outlineBMP :: FilePath -> FilePath -> IO ()
outlineBMP from to = withBMP from to (fmap mono . outlinebm (==whitePx))
    where
    mono False = whitePx
    mono True = blackPx

addOutlineBMP :: FilePath -> FilePath -> IO ()
addOutlineBMP from to = withBMP from to joinbm
    where
    joinbm bm = elementwiseUnsafe joinpx bm (outlinebm (==whitePx) bm)
    joinpx px1 False = px1
    joinpx px1 True = blackPx

qtOut = fromLists
    [[  True, True, True, True, True, True, True, True ]
    ,[  True,False,False, True, True, True, True, True ]
    ,[  True,False,False, True,False,False,False, True ]
    ,[  True, True, True, True,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False, True, True, True, True ]
    ,[ False,False,False,False, True, True, True,False ]
    ]

bm = fromLists [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,1,1,1,0],
    [0,0,0,0,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,1]]

qt = bm2qt bm

-- * pergunta 4

data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float

inFTree :: Either b (a, (FTree a b, FTree a b)) -> FTree a b
outFTree :: FTree a1 a2 -> Either a2 (a1, (FTree a1 a2, FTree a1 a2))
baseFTree :: (a1 -> b1) -> (a2 -> b2) -> (a3 -> d) -> Either a2 (a1, (a3, a3)) -> Either b2 (b1, (d, d))
recFTree :: (a -> d) -> Either b1 (b2, (a, a)) -> Either b1 (b2, (d, d))
cataFTree :: (Either b1 (b2, (d, d)) -> d) -> FTree b2 b1 -> d
anaFTree :: (a1 -> Either b (a2, (a1, a1))) -> a1 -> FTree a2 b
hyloFTree :: (Either b1 (b2, (c, c)) -> c) -> (a -> Either b1 (b2, (a, a))) -> a -> c

depthFTree :: FTree a b -> Int
depthFTree = cataFTree (either (const 0) g)
    where g (a,(l,r)) = max l r + 1

isBalancedFTree :: FTree a b -> Bool
isBalancedFTree = isJust . cataFTree (either (const (Just 0)) g)
    where
    g (a,(l,r)) = join (liftA2 equal l r)
    equal x y = if x == y then Just (x+1) else Nothing
\end{code}
%endif

%----------------- Fim do documento -------------------------------------------%

\end{document}
