\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{masterthesis}

\RequirePackage{etoolbox} % Extend Latex coding capabilities

\LoadClass[fontsize=11pt,a4paper,twoside,extrafontsizes, onecolumn, openright, draft, %showtrims
	]{memoir}
%% N.B: Change draft -> final for the final version not showing over-
%% full boxes

% TODO: check what openbib does with the \bibindent option 

%%% formatting & styling %%%
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage[babel,stretch=10]{microtype}

%%% pretty refs %%%% 
\RequirePackage{prettyref}
\newrefformat{def}{Def.~\ref{#1}}
\newrefformat{chap}{Chap.~\ref{#1}}
\newrefformat{fig}{Fig.~\ref{#1}}



%%% bibliography %%%
\RequirePackage[
    backend=biber,
    bibencoding=utf8,
    style=phys,
    biblabel=brackets,
    pageranges=false,
    citestyle=numeric-comp,
    sorting=appn,
    sortcites=true,
    url=false,
    eprint=true,
]{biblatex}

\DeclareSortingTemplate{appn}{
    \sort{
        \field{presort}
    }
    \sort[final]{
        \field{sortkey}
    }
    \sort{\citeorder}
    \sort{
        \field{sortyear}
        \field{year}
    }
    \sort{
        \field{sortname}
        \field{author}
        \field{editor}
        \field{translator}
        \field{sorttitle}
        \field{title}
    }
    \sort{
        \field{sorttitle}
        \field{title}
    }
    \sort{
        \field{volume}
        \literal{0}
    }
}

\AtBeginBibliography{%
    \urlstyle{rm}%
}

% \DeclareFieldFormat[article,periodical]{number}{\mkbibparens{#1}}
% \renewbibmacro*{volume+number+eid}{%
%   \printfield{volume}%
%   \printfield{number}%
%   \setunit*{\addspace}%
%   \printfield{eid}%
% }

\renewbibmacro*{in:}{%
  \iffieldundef{journaltitle}
    {}
    {\printtext{\bibstring{in}\intitlepunct}}}

% Biber sourcemap: Remove ISSNs
\DeclareSourcemap{
    \maps[datatype=bibtex]{
      \map{
        \pertype{article}
        \step[fieldset=issn, null]
        \step[fieldset=arxivId, null]
        \step[fieldset=pmid, null]
        \step[fieldset=doi, null]
        \step[fieldset=eprint, null]
      }
    }
  }

\addbibresource{backmatter/library.bib}


%%% hyperref and url %%%
\RequirePackage[unicode]{hyperref}
\hypersetup{
    colorlinks=true,
    citecolor=blue,
    linkcolor=blue,
    urlcolor=blue,
	bookmarksnumbered=true,
	bookmarksopen=true,
	pdfdisplaydoctitle,
	pdfsubject=Master thesis in Quantum Science and Technology,
	pdfcreator=Gianluca Grosso,
    pdfkeywords={Tensor Network, Tensor Cross Interpolation, Thesis, TUM, LMU, Quantum Science and Technology, QST, Quantum Many Body}
}

%%% cover %%% 
\RequirePackage[pass]{geometry}
\input{frontmatter/cover}

%%% title %%%

\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\input{frontmatter/title}


%%% chapter %%%
\chapterstyle{madsen}

%%% headers & footers %%%
\nouppercaseheads
\makepagestyle{mystyle}
\makeheadrule{mystyle}{\textwidth}{\normalrulethickness}
\makeevenhead{mystyle}{\thepage}{}{\itshape \leftmark}
\makeoddhead{mystyle}{\itshape \rightmark}{}{\thepage}

\PassOptionsToPackage{hyphens}{url}
\def\UrlFont{\ttfamily}

%%% math symbols %%%
\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage{braket}
\RequirePackage{dsfont} %% \mathds

%%% algorithms %%%
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

%%% chemistry %%%
\RequirePackage[version=4]{mhchem}
\mhchemoptions{textfontname=sffamily, mathfontname=mathsf}

% \DeclareMathOperator*{\argmin}{argmin}
% \DeclareMathOperator*{\argmax}{argmax}
% \DeclareMathOperator*{\tr}{tr}
% \DeclareMathOperator*{\Tr}{Tr}

\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}

% Theorems and definitions 
\theoremstyle{plain}%
\theoremheaderfont{\normalfont\bfseries\sffamily}% Matches e.g. \section* font
\theorembodyfont{\normalfont\itshape}% or \itshape if you want them italic
\theorempreskip{\baselineskip}
\theorempostskip{\baselineskip}

\newtheorem{definition}{Definition}[chapter]
\newtheorem{assumption}[definition]{Assumption}
\newtheorem{theorem}[definition]{Theorem}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{lemma}[definition]{Lemma}
\newtheorem{corollary}[definition]{Corollary}
\newtheorem{example}[definition]{Example}
\newtheorem{conjecture}[definition]{Conjecture}


% \newenvironment{mydef}[1][]{%
%   % The environment begins here:
%   \par\vspace{1\baselineskip}% space above
%   \noindent
%   {\normalfont\bfseries\sffamily #1}\quad
%   \normalfont          
% }{%
%   % The environment ends here:
%   \par\vspace{1\baselineskip}
% }

%%% tables %%%
\RequirePackage{booktabs,multirow,longtable,diagbox}

%%% figures %%%
\RequirePackage{graphicx,float}


%%% code listing %%%
\RequirePackage{xcolor}

% %%% copyrightpage %%%

\newcommand{\copyrightpage}{
    \cleartoverso
  \thispagestyle{empty}%
  \vspace*{\fill}
	\begin{center}
		{\scshape \noindent \small \copyright \small 2025\hspace{3pt}-- Gianluca Grosso }\\
		\noindent All rights reserved.
	\end{center}
	\vspace*{\fill}
}

%%% abstract page %%%

\makepagestyle{centerpagenumber}
\makeoddfoot{centerpagenumber}{}{\thepage}{} 
\makeevenfoot{centerpagenumber}{}{\thepage}{} 

\newcommand{\abstractpage}{
    \cleardoublepage
    \thispagestyle{centerpagenumber}
    \setcounter{page}{1}
	\noindent\begin{minipage}[b]{.6\linewidth}%
		\normalfont {\textit{Thesis advisor: Prof. Jan von Delft}}
	\end{minipage}
	\begin{minipage}[b]{.3\linewidth}
		\raggedleft \normalfont \textit{Gianluca Grosso}
	\end{minipage}%

	\vspace*{9pt}
	\begin{Spacing}{1}
    \noindent
		{\LARGE{\textbf{Adaptive distribution of quantics tensor trains into subdomains with controlled bond dimension}}}
	\end{Spacing}
	\bigskip
	\centerline{\Large {{ABSTRACT}}}
	\bigskip
	\par
}


\newcommand{\acknowledgments}{
	\cleardoublepage
	\chapter*{Acknowledgements}
	\noindent
}




 