\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2019/08/13 Custom Resume Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Packages for section styling
\RequirePackage[explicit]{titlesec}
\RequirePackage{xhfill}

% Remove paragraph indentation
\RequirePackage[parfill]{parskip}

% For mail, phone, github images.
\RequirePackage{graphicx}

% Set margins
\RequirePackage[margin=0.6in]{geometry}

% For links
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,
    urlcolor=blue,
}


% Supress Page Numbers
\pagestyle{empty}

\setlength{\parskip}{3pt}
\renewcommand{\baselinestretch}{1.1}

% Add some variables for the title.
\newcommand*{\name}[1]{\gdef\@name{#1}}
\newcommand*{\@name}{Foo Bar}
\newcommand*{\email}[1]{\gdef\@email{#1}}
\newcommand*{\@email}{foo@bar.com}

\newcommand*{\github}[1]{\gdef\@github{#1}}
\newcommand*{\linkedin}[1]{\gdef\@linkedin{#1}}
\newcommand*{\phone}[1]{\gdef\@phone{#1}}

% Commands for generating the title.
\newcommand*{\genemail}{%
  \raisebox{-0.2\height}{\includegraphics[height=8pt]{mail}}\hspace{4pt}%
  \small\@email
}
\newcommand*{\gengithub}{%
  \hspace{8pt}%
  \raisebox{-0.2\height}{\includegraphics[height=10pt]{github}}\hspace{4pt}%
  \small\href{https://github.com/\@github}{\@github}
}
\newcommand*{\genphone}{%
  \hspace{8pt}%
  \raisebox{-0.2\height}{\includegraphics[height=9pt]{phone}}\hspace{4pt}%
  \small\@phone
}
\newcommand*{\genlinkedin}{%
  \hspace{8pt}%
  \raisebox{-0.2\height}{\includegraphics[height=9pt]{linkedin}}\hspace{4pt}%
  \small\href{https://linkedin.com/in/\@linkedin}{\@linkedin}
}

\renewcommand{\maketitle}{%
  {\centering
    \huge\fontseries{m}\selectfont
    \@name
    \par
  }
  \vspace{2pt}
  {\centering
    \genemail%
    \ifdefined\@phone%
      \genphone%
    \fi
    \ifdefined\@github%
      \gengithub%
    \fi
    \ifdefined\@linkedin%
      \genlinkedin%
    \fi
    \vspace{8pt}
    \par
  }
}

\titleformat{\section}
{\normalfont\large\filcenter}
{}{0em}
{\xrfill[0.3ex]{0.5pt}\hspace{10pt}~#1~\hspace{10pt}\xrfill[0.3ex]{0.5pt}}

\titleformat{\subsection}
{\bfseries}
{}{0em}
{#1}

\titlespacing{\subsection}{0pt}{4pt}{-\parskip+4pt}
