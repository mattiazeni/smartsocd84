%%
%% This is file `SmartReport.cls',
%% Written by D. Miorandi, U-Hopper srl
%%
%% This class has been developed for usage within the SmartSociety FP7
%% Projecy and is distributed in the hope that it will be useful, but WITHOUT
%% ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
%% FITNESS FOR A PARTICULAR PURPOSE.
%% 
%% Direct use of code from this class in another class which is either sold
%% for profit, or not made freely available, is explicitly forbidden by the
%% author.
%% 
%%v. 1.0: First working version
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SmartReport}[20012/01/30 1.0 SmartSociety FP7 Project Deliverable
document class]
\typeout{SmartSociety Report Class v.1.1}
\typeout{written by Daniele Miorandi}
\typeout{daniele.miorandi@u-hopper.com}
\typeout{--SmartReport builds on top of ``article.cls''--} 
\typeout{use at your own risk}
\typeout{good luck!}
\newif\if@bntr@chp
\RequirePackage{color,graphicx,ifthen,colortbl,lastpage}
\RequirePackage[table]{xcolor}
%\RequirePackage{tabularx}

%%% Options
\DeclareOption{a5paper}
{\ClassWarningNoLine{SmartReport}{Option `a5paper' not supported}}
\DeclareOption{b5paper}
{\ClassWarningNoLine{SmartReport}{Option `b5paper' not supported}}
\DeclareOption{letterpaper}
{\ClassWarningNoLine{SmartReport}{Option `letterpaper' not supported}}
\DeclareOption{legalpaper}
{\ClassWarningNoLine{SmartReport}{Option `legalpaper' not supported}}
\DeclareOption{executivepaper}
{\ClassWarningNoLine{SmartReport}{Option `executivepaper' not supported}}
\DeclareOption{landscape}
{\ClassWarningNoLine{SmartReport}{Option `landscape' not supported}}
\DeclareOption{titlepage}
{\ClassWarningNoLine{SmartReport}{Option `titlepage' not supported}}
\DeclareOption{twocolumn}
{\ClassWarningNoLine{SmartReport}{Option `twocolumn' not supported}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{article}}
\DeclareOption{onecolumn}{\PassOptionsToClass{onecolumn}{article}}
\DeclareOption{TechReport}{\PassOptionsToClass{twoside}{article}}
\DeclareOption{american}{\@bntr@italianfalse}
\DeclareOption{english}{\@bntr@italianfalse}
\DeclareOption{chapterplain}{\@bntr@chptrue}
\DeclareOption{chapterempty}{\@bntr@chpfalse}
\ExecuteOptions{final,a4paper,onecolumn,TechReport}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
% Loading the class article with forced options
\LoadClass[11pt,notitlepage,twoside,final]{article}
%%%
\RequirePackage{titlesec}

%%% New Headings
%\newcommand{\@fp7}{FP7-gen}
\newcommand{\@bntr@newpagestyle}[2]{%
\@namedef{ps@#1}{\let\@oddfoot\@empty\let\@evenfoot\@empty
\let\@mkboth\@bntr@mkboth#2}}
\if@bntr@chp
\let\ps@latexplain\ps@plain
\let\ps@plain\ps@empty
\fi
\AtBeginDocument{\pagestyle{underheadings}}
\@bntr@newpagestyle{underheadings}{%
\def\@evenhead{\underline{\makebox[\textwidth]
{{\small{\copyright\hbox{ SmartSociety Consortium 2013-2017}} \hfill Deliverable\hbox{ }\@bntr@delnumber}
\rule[-0.5ex]{0pt}{1ex}}}}%
\def\@oddhead{\underline{\makebox[\textwidth]
{{\small{Deliverable\hbox{ }\@bntr@delnumber\hbox{ }
     \hfill  \copyright\hbox{ SmartSociety Consortium 2013-2017}}}
%\hfill 
%SMART/\@bntr@instshort/wp\@bntr@wpnumber/\@bntr@versionnumber}
\rule[-0.5ex]{0pt}{1ex}}}}%
\def\@evenfoot{
\small 
\thepage \hbox{ of} \pageref{LastPage} \hfill
\hbox{http://www.smart-society-project.eu}}
\def\@oddfoot{
\small 
\copyright \hbox{ SmartSociety Consortium 2013-2017}\hfill\thepage \hbox{ of} \pageref{LastPage}}
}
%%% Document page shape
%\ifcase \@ptsize% mods for 10 pt
%\ClassWarningNoLine{SmartReport}
%{You should use 11pt option instead of 10pt}
%\setlength\textheight{50\baselineskip}
%\or% mods for 11 pt
%\setlength\textheight{46\baselineskip}
%\or% mods for 12 pt
%\ClassWarningNoLine{SmartReport}
%{You should use 11pt option instead of 12pt}
%\textheight 42\baselineskip
%\fi
\advance\textheight by \topskip
\setlength\headsep{10mm}
\setlength\topmargin{3mm}
%\setlength\evensidemargin{5mm}
%\setlength\oddsidemargin{15mm}
%\setlength\textwidth{140mm}
\setlength\parskip {0.2em plus 1pt minus 1pt}
\AtBeginDocument{
\setlength\baselineskip {1.3125\baselineskip}
}
\setlength\evensidemargin{3mm}
\setlength\oddsidemargin{7mm}
\setlength\textwidth{150mm}
%%% MakeTitle Strings Definition Commands
%% Init strings
\let\@bntr@smartheadings\@empty
\let\@bntr@smartabstract\@empty
\let\@bntr@number\@empty
%%%DM: here goes the definition of the logo file
%\definecolor{SMARTcolor}{RGB}{0,176,240}
\definecolor{tableShade}{RGB}{204,204,204}
\newcommand*{\logo}{SmartLogo}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Introduce new commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\wpleader}[1]{\gdef\@bntr@wpleader{#1}}
\newcommand*{\wpnumber}[1]{\gdef\@bntr@wpnumber{#1}}
\newcommand*{\wptitle}[1]{\gdef\@bntr@wptitle{#1}}
\newcommand*{\instname}[1]{\gdef\@bntr@instname{#1}}
\newcommand*{\instshort}[1]{\gdef\@bntr@instshort{#1}}
\newcommand*{\contribshort}[1]{\gdef\@bntr@contribshort{#1}}
\newcommand*{\deltitle}[1]{\gdef\@bntr@deltitle{#1}}
\newcommand*{\delshorttitle}[1]{\gdef\@bntr@delshorttitle{#1}}
\newcommand*{\delnumber}[1]{\gdef\@bntr@delnumber{#1}}
\newcommand*{\deltype}[1]{\gdef\@bntr@deltype{#1}}
\newcommand*{\delowner}[1]{\gdef\@bntr@delowner{#1}}
\newcommand*{\qualityassessor}[1]{\gdef\@bntr@qualityassessor{#1}}
\newcommand*{\versionnumber}[1]{\gdef\@bntr@versionnumber{#1}}
\newcommand*{\delstatus}[1]{\gdef\@bntr@delstatus{#1}}
%\newcommand*{\verification}[1]{\gdef\@bntr@verification{#1}}
\newcommand*{\delavail}[1]{\gdef\@bntr@delavail{#1}}
\newcommand*{\duedate}[1]{\gdef\@bntr@duedate{#1}}
\newcommand*{\deldate}[1]{\gdef\@bntr@deldate{#1}}
\newcommand*{\smartkeywords}[1]{\gdef\@bntr@smartkeywords{#1}}
\newcommand*{\smartheadings}[1]{\gdef\@bntr@smartheadings{#1}}
\newcommand*{\titlesmartabstract}[1]{\gdef\@bntr@smartabstract{#1}}
\newcommand*{\titlesmartcontributors}[1]{\gdef\@bntr@smarcontributors{#1}}
\newcommand*{\editor}[1]{\gdef\@bntr@editor{#1}}
\newcommand*{\address}[1]{\gdef\@bntr@address{#1}}
\newcommand*{\markthischapter}[1]{\markboth{#1}{}}
\newcommand*{\markthissection}[1]{\markright{#1}}
\renewcommand*\contentsname{Table of Contents}
\renewcommand*{\appendixname}{Annex}
\let\@bntr@mkboth\markboth
\newcommand*\printindex{\InputIfFileExists{\jobname.ind}{}
{\ClassWarningNoLine{SmartReport}{No file \jobname.ind.}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Introduce new environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{smartcontributors}
{
%\rowcolors{1}{tableShade}{tableShade}
\section*{\smartcontributorsname}
\rowcolors{1}{tableShade}{tableShade}
\begin{tabular}{|p{0.3\textwidth}p{0.65\textwidth}|}
\hline
{\bf Partner Acronym} & {\bf Contributor}\\
}
{\hline
\end{tabular}
\newpage\thispagestyle{underheadings}\cleardoublepage\thispagestyle{underheadings}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{smartabstract}
{
\section*{\smartabstractname}
}{
\newpage \tableofcontents\newpage
}
%%%%%%%%%%%

%%% Language Dependent Names
\AtBeginDocument{
\providecommand*\smartcontributorsname{List of Contributors}
\providecommand*\smartabstractname{Executive Summary}
}
\renewcommand*{\maketitle}{
\begin{titlepage}%
\let\footnotesize\small
\let\footnoterule\relax
\null%
\vskip 1cm
\begin{minipage}[c]{0.2\textwidth}
\includegraphics[width=4cm]{\logo} 
\end{minipage}%
\begin{minipage}[c]{0.6\textwidth}
\mbox{ }\\
\end{minipage}%
\begin{minipage}[c]{0.2\textwidth}
\includegraphics[width=2.2cm]{FP7-gen} 
\includegraphics[width=2.2cm]{EUflag}
\end{minipage}%
\begin{center}%
\vskip 0.3cm
{\huge\textbf{\sffamily SmartSociety }\par \vskip 1em}
{\Large Hybrid and Diversity-Aware Collective Adaptive Systems}\newline{\Large When
  People Meet Machines to Build a Smarter Society}\newline
\vskip 0.5cm
{\Large Grant Agreement No. 600584}\newline
\vskip 1.5cm
{\Large\textbf{\sffamily Deliverable \@bntr@delnumber}}
{\Large\textbf{\sffamily Working Package \@bntr@wpnumber}}
\vskip 1em
{\huge\textbf{\sffamily \@bntr@deltitle}}
 \vskip 2em
\end{center}
\hfill
{\large\begin{tabular}{|p{0.35\textwidth}|p{0.45\textwidth}|}
\hline
{\bf Dissemination Level (Confidentiality):}\footnotemark & {\it \@bntr@delavail}\\ \hline
{\bf Delivery Date in Annex I:}& {\it \@bntr@duedate}\\ \hline
{\bf Actual Delivery Date }& {\it \@bntr@deldate}\\ \hline
{\bf Status}\footnotemark & {\it
  \@bntr@delstatus}\\ \hline
{\bf Total Number of pages:} & \pageref{LastPage} \\ \hline
{\bf Keywords:}& {\it\@bntr@smartkeywords }\\ \hline
\end{tabular}
}\vskip1em
\footnotetext[1]{PU: Public; RE:
  Restricted to Group; PP: Restricted to Programme; CO: Consortium
  Confidential as specified in the Grant Agreeement}
\footnotetext[2]{F: Final; D: Draft; RD: Revised Draft}
\end{titlepage}%
%\let\thanks\relax\let\maketitle\relax
\cleardoublepage
\noindent{\bf Disclaimer}\\
\noindent This document contains material, which is the copyright of {\it SmartSociety} Consortium parties, and no copying or distributing, in any form or by any means, is allowed without the prior written agreement of the owner of the property rights. The commercial use of any information contained in this document may require a license from the proprietor of that information.
Neither the {\it SmartSociety} Consortium as a whole, nor a certain
party of the {\it SmartSociety}s Consortium warrant that the information contained in this document is suitable for use, nor that the use of the information is free from risk, and accepts no liability for loss or damage suffered by any person using this information.
This document reflects only the authors' view. The European Community
is not liable for any use that may be made of the information
contained herein.
\vfill
\begin{tabular}{|p{0.4\textwidth}|p{0.6\textwidth}|}
\hline
{\bf Full project title:} & SmartSociety: Hybrid and Diversity-Aware Collective Adaptive Systems: When
  People Meet Machines to Build a Smarter Society \\\hline
{\bf Project Acronym:} & SmartSociety\\\hline
{\bf Grant Agreement Number:} & 600854\\\hline
 {\bf Number and title of work-package:} & \@bntr@wpnumber \hbox{ }
\@bntr@wptitle \\\hline
{\bf Document title:} & \@bntr@deltitle\\\hline
{\bf Work-package leader:} & \@bntr@wpleader\\\hline
{\bf Deliverable owner:} & \@bntr@delowner\\\hline
{\bf Quality Assessor:} & \@bntr@qualityassessor\\ \hline
\end{tabular}
%\setcounter{footnote}{0}%
\clearpage
%\let\thanks\relax\let\maketitle\relax
}
%% ENVIRONMENTS

% "box" symbols at end of proofs
\def\QEDclosed{\mbox{\rule[0pt]{1.3ex}{1.3ex}}} % for a filled box
% V1.6 some journals use an open box instead that will just fit around a closed one
\def\QEDopen{{\setlength{\fboxsep}{0pt}\setlength{\fboxrule}{0.2pt}\fbox{\rule[0pt]{0pt}{1.3ex}\rule[0pt]{1.3ex}{0pt}}}}
\def\QED{\QEDclosed} % default to closed
\def\proof{\noindent\hspace{2em}{\itshape Proof: }}
\def\endproof{\hspace*{\fill}~\QED\par\endtrivlist\unskip}
%\itemindent is set to \z@ by list, so define new temporary variable
\endinput
%%
%% End of file `SmartReport.cls'.
%%%%%%%%%%%%%%%%%%%%%%%%%


%% Good luck, you probably need it!
%%   Daniele 