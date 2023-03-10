\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nirs}[2023/03/06 Template class for nirs report in MEPhI]


% Пакет, позволяющий делать логическое ветвление
\RequirePackage{ifthen}
\RequirePackage{calc}

% Главный стиль
\newboolean{IfMainStyle}
\setboolean{IfMainStyle}{false}

% Строгий и некрасивый стиль
\newboolean{IfTimesStyle}
\setboolean{IfTimesStyle}{false}

% Красивый типографический стиль
\newboolean{IfBeautyStyle}
\setboolean{IfBeautyStyle}{false}


\DeclareOption{mainstyle}{%
    \setboolean{IfMainStyle}{true}
}
\DeclareOption{timesstyle}{%
    \setboolean{IfTimesStyle}{true}
}
\DeclareOption{beautystyle}{%
    \setboolean{IfBeautyStyle}{true}
}


\DeclareOption*{%
\PassOptionsToClass{\CurrentOption}{extarticle}%
}
\ProcessOptions\relax
\LoadClass[a4paper, 14pt]{extarticle}


% Математика
\RequirePackage{amsmath, amsfonts, amssymb, amsthm, mathtools}
\RequirePackage{mathrsfs}
\RequirePackage{icomma}
\RequirePackage{esint}
\RequirePackage[subnum]{cases}



\RequirePackage{ragged2e} % FlushLeft, FlushRight, Center
\RequirePackage{csquotes} % enquote
\RequirePackage{textcase}
\RequirePackage{hyphenat} % super-hyphenation
\RequirePackage{array, tabularx, tabulary, booktabs, longtable, multirow} % everything for tables
\RequirePackage[usenames, dvipsnames, svgnames, table, rgb]{xcolor}

\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{caption}
\RequirePackage{subcaption}

\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{titlesec}


\RequirePackage[top=2cm, bottom=2cm, left=3cm, right=1.5cm, a4paper]{geometry}




\usepackage{microtype}

\RequirePackage{polyglossia}
\defaultfontfeatures{Scale=MatchLowercase, Ligatures=TeX, Renderer=Basic}
\setmainfont{CMU Serif}
\setsansfont{CMU Sans Serif}
\setmonofont{CMU Typewriter Text}
\setdefaultlanguage[spelling=modern, babelshorthands=true]{russian}
\setotherlanguage{english}


\ifthenelse{\boolean{IfMainStyle}}
{
    \setmainfont{CMU Serif}
    \setsansfont{CMU Sans Serif}
    \setmonofont{CMU Typewriter Text}
    \setdefaultlanguage[spelling=modern, babelshorthands=true]{russian}
    \setotherlanguage{english}
}{}

\ifthenelse{\boolean{IfTimesStyle}}
{
    \setmainfont{Times New Roman}
    \setsansfont{Arial}
    \setmonofont{Courier New}
    \setdefaultlanguage[spelling=modern, babelshorthands=true]{russian}
    \setotherlanguage{english}

    \RequirePackage{unicode-math}
    \setmathfont{TeX Gyre Termes Math}
}{}

\ifthenelse{\boolean{IfBeautyStyle}}
{
    \setmainfont{XCharter}
    \setdefaultlanguage[spelling=modern, babelshorthands=true]{russian}
    \setotherlanguage{english}

    \RequirePackage{unicode-math}
    \setmathfont{XCharter-Math.otf}
}{}

\bibliographystyle{gost2008s.bst}
\RequirePackage[backend=biber, bibencoding=utf8,  style=gost-numeric, sorting=none]{biblatex}

\RenewDocumentCommand{\refname}{}{Список литературы}


\usepackage{hyperref}
\definecolor{blackref}{rgb}{0.5,0,0.5}
\hypersetup{                                                % Гиперссылки
    unicode=true,                                           % русские буквы в раздела PDF
    pdftitle={Отчёт о научно-исследовательской работе студента},                                   % Заголовок
    pdfauthor={Широков Денис Дмитриевич},                                      % Автор
    pdfsubject={Численные методы решения задач математической физики с использованием локально-адаптивных сеток},                                      % Тема
    colorlinks=true,                                        % false: ссылки в рамках; true: цветные ссылки
    linkcolor=black,                                          % внутренние ссылки
    citecolor=black,                                        % на библиографию
    filecolor=black,                                      % на файлы
    urlcolor=black                                           % на URL
}



\NewDocumentCommand{\figref}{m}{рис.~\ref{#1}}
\NewDocumentCommand{\Figref}{m}{Рис.~\ref{#1}}
\NewDocumentCommand{\tableref}{m}{табл.~\ref{#1}}
\NewDocumentCommand{\Tableref}{m}{Табл.~\ref{#1}}
\NewDocumentCommand{\seefigref}{m}{см.~рис.~\ref{#1}}
\NewDocumentCommand{\seetableref}{m}{см.~рис.~\ref{#1}}
\NewDocumentCommand{\seeeqref}{m}{см.~формулу~\ref{#1}}


% Переменные
\NewDocumentCommand{\UniversityVar}{}{%
МИНИСТЕРСТВО НАУКИ И ВЫСШЕГО ОБРАЗОВАНИЯ РОССИЙСКОЙ ФЕДЕРАЦИИ ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ ЯДЕРНЫЙ УНИВЕРСИТЕТ \enquote{МИФИ}}
\NewDocumentCommand{\DepartmentVar}{}{%
Кафедра теоретической ядерной физики}
\NewDocumentCommand{\UDKNumbersVar}{}{%
519.633.6}
\NewDocumentCommand{\AuthorFullNameVar}{}{%
Широков Денис Дмитриевич}
\NewDocumentCommand{\SubjectVar}{}{%
Численное решение уравнения теплопроводности с использованием локально-адаптивных сеток}
\NewDocumentCommand{\ProgramVar}{}{%
    03.03.01 Прикладные математика и физика
}
\NewDocumentCommand{\SecretaryVar}{}{%
Корнеев Ф.А.}
\NewDocumentCommand{\SecretaryHonorsVar}{}{%
к.ф.-м.н., доцент}
\NewDocumentCommand{\QualificationVar}{}{%
1
} % 1 -- бакалавр, 2 -- магистр, 3 -- специалист
\NewDocumentCommand{\YearVar}{}{%
2023
}



\newlength\LengthForMounth
\setlength{\LengthForMounth}{8em}

\newlength\LengthForMark
\setlength{\LengthForMark}{8em}

\newlength\LengthForTitleOne
\settowidth{\LengthForTitleOne}{%
Секретарь ГЭК \rule{5em}{0.1pt} \SecretaryVar}


% Команды для изменения соответствующих переменныъ
\NewDocumentCommand{\University}{m}{%
    \RenewDocumentCommand{\UniversityVar}{}{#1}
}
\NewDocumentCommand{\Department}{m}{%
    \RenewDocumentCommand{\DepartmentVar}{}{#1}
}
\NewDocumentCommand{\UDKNumbers}{m}{%
    \RenewDocumentCommand{\UDKNumbersVar}{}{#1}
}
\NewDocumentCommand{\AuthorFullName}{m}{%
    \RenewDocumentCommand{\AuthorFullNameVar}{}{#1}
}
\NewDocumentCommand{\Subject}{m}{%
    \RenewDocumentCommand{\SubjectVar}{}{#1}
}
\NewDocumentCommand{\Program}{m}{%
    \RenewDocumentCommand{\ProgramVar}{}{#1}
}
\NewDocumentCommand{\Secretary}{m}{%
    \RenewDocumentCommand{\SecretaryVar}{}{#1}
    \settowidth{\LengthForTitleOne}{%
    Секретарь ГЭК \rule{5em}{0.1pt} \SecretaryVar}
}
\NewDocumentCommand{\SecretaryHonors}{m}{%
    \RenewDocumentCommand{\SecretaryHonorsVar}{}{#1}    
}
\NewDocumentCommand{\Qualification}{m}{%
    \RenewDocumentCommand{\QualificationVar}{}{#1}
}
\NewDocumentCommand{\Year}{m}{%
    \RenewDocumentCommand{\YearVar}{}{#1}
}



\NewDocumentCommand{\NameWithHonors}{mo}
{
    \IfValueTF{#2}
    {
        \begin{minipage}[b]{\maxof{\widthof{#1}}{\widthof{#2}}}
            \begin{flushleft}
                #1\linebreak
                #2
            \end{flushleft}
        \end{minipage}
    }
    {
        \begin{minipage}[b]{\widthof{#1}}
            \begin{flushleft}
                #1
            \end{flushleft}
        \end{minipage}
    }
}


\NewDocumentCommand{\HandWritingForTitleOne}{mm}
{
    \NameWithHonors{#1}[#2] \rule{5em}{0.1pt}
}


\newsavebox{\OldPrintLeftNamesBox}
\NewDocumentCommand{\PrintLeftNames}{}{}

\newsavebox{\OldPrintRightNamesBox}
\NewDocumentCommand{\PrintRightNames}{}{}

\NewDocumentCommand{\AddName}{mom}
{
    \begin{lrbox}{\OldPrintLeftNamesBox}
        \PrintLeftNames
    \end{lrbox}

    \IfValueTF{#2}
    {
        \RenewDocumentCommand{\PrintLeftNames}{}
        {
            \begin{minipage}{\maxof{\widthof{\usebox{\OldPrintLeftNamesBox}}}{\widthof{\NameWithHonors{#1}[#2]}}}
                \usebox{\OldPrintLeftNamesBox}

                \vspace{1.5em}

                \NameWithHonors{#1}[#2]
            \end{minipage}
        }
    }
    {
        \RenewDocumentCommand{\PrintLeftNames}{}
        {
            \begin{minipage}{\maxof{\widthof{\usebox{\OldPrintLeftNamesBox}}}{\widthof{\NameWithHonors{#1}}}}
                \usebox{\OldPrintLeftNamesBox}

                \vspace{1.5em}

                \NameWithHonors{#1}
            \end{minipage}
        }
    }


    \begin{lrbox}{\OldPrintRightNamesBox}
        \PrintRightNames
    \end{lrbox}

    \RenewDocumentCommand{\PrintRightNames}{}
    {
        \begin{minipage}{\maxof{\widthof{\usebox{\OldPrintRightNamesBox}}}{\widthof{\rule{5em}{0.1pt} #3}}}
            \usebox{\OldPrintRightNamesBox}

            \vspace{1.5em}

            \raisebox{0pt}[\totalheightof{\NameWithHonors{#1}[#2]}][0pt]{\rule{5em}{0.1pt} #3}
        \end{minipage}
    }
}


% Наверное, перенос по словам в титульнике -- не хорошо, поэтому вместо Center, FlushRight используется center и flushright, для выключения переносов.

\AtBeginDocument{%
    \begin{titlepage}
        \begin{russian}
            \begin{center}
                \UniversityVar
            \end{center}

            \vfill

            \begin{center}
                \textsc{\textbf{\DepartmentVar}}
            \end{center}

            \begin{flushright}
                На правах рукописи\linebreak
                УДК \UDKNumbersVar
            \end{flushright}

            \vfill

            \begin{center}
                \textsc{\Large \AuthorFullNameVar}\linebreak

                \textsc{\Large \textbf{\enquote{\SubjectVar}}}
            \end{center}

            \vfill

            \begin{center}
                \ifthenelse{1=\QualificationVar}{%
                    Выпускная квалификационная работа бакалавра \linebreak
                }{%
                    \ifthenelse{2=\QualificationVar}{%
                        Выпускная квалификационная работа магистра \linebreak
                    }{%
                        \ifthenelse{3=\QualificationVar}{%
                            Выпускная квалификационная работа специалиста \linebreak
                        }{Ошибка с \textenglish{\texttt{ifthenelse}}}
                    }
                }
                Направление подготовки \ProgramVar
            \end{center}

            \vfill

            \begin{flushright}
                \begin{minipage}{\LengthForTitleOne}
                    \begin{flushleft}
                        Выпускная квалификационная\linebreak работа защищена\linebreak

                        \enquote{\rule{2em}{0.1pt}} \rule{\LengthForMounth}{0.1pt} \YearVar г.\linebreak

                        Оценка \rule{\LengthForMark}{0.1pt}\linebreak

                        Секретарь ГЭК \rule{5em}{0.1pt} \SecretaryVar

                        \SecretaryHonorsVar
                    \end{flushleft}
                \end{minipage}
            \end{flushright}

            \vfill

            \begin{center}
                \textbf{Москва}\\
                \textrussian{\today}
            \end{center}
        \end{russian}
    \end{titlepage}

    \newpage

    \begin{titlepage}
        \begin{russian}
            \begin{center}
                \textsc{\textbf{%
                Пояснительная записка\linebreak
                к \ifthenelse{1=\QualificationVar}{бакалаврской}{\ifthenelse{2=\QualificationVar}{магистерской}{}} дипломной работе\ifthenelse{3=\QualificationVar}{ специалиста}{}:
                }}
                
                \vspace{1em}

                \textsc{\textbf{\Large \enquote{\SubjectVar}}}
            \end{center}
            
            \vfill

            \begin{flushright}
                \PrintLeftNames \PrintRightNames
            \end{flushright}

            \vfill
        \end{russian}
    \end{titlepage}
    % \setcounter{page}{3}

    \NewDocumentCommand{\StartAppendix}{}
    {
        \appendix
        \addcontentsline{toc}{section}{Приложения}
        \RenewDocumentCommand{\thesection}{}{\Alph{section}}
        \titleformat{\section}{\normalfont\bfseries}{Приложение \thesection\hspace{2em}}{0.5em}{}
        \titlespacing*{\subsection}{0pt}{12pt}{50pt}
    }
}


\NewDocumentCommand{\AddBibliography}{}
{
    \printbibliography
    \addcontentsline{toc}{section}{\refname}
}
