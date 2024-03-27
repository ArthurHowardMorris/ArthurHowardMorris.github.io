
Adding regex to `estout`/`esttab`. 

I often find that I need to tweak tables produced by `esttab`, I assume that this is often because just haven't [read the friendly docs (btw, Ben Jann's docs are very friendly)](http://repec.org/bocode/e/estout/esttab.html) as well as I should.

Here's a quick example:
```
sysuse auto
eststo: quietly regress price mpg foreign
eststo: xi: quietly regress price mpg foreign i.rep78
esttab using example.tex, wide indicate(rep dummies = _Irep78*) title(Example using sysuse auto)
```
Yields the following table:
```LaTeX
\begin{table}[htbp]\centering
\def\sym#1{\ifmmode^{#1}\else\(^{#1}\)\fi}
\caption{Example using sysuse auto}
\begin{tabular}{l*{2}{cc}}
\hline\hline
            &\multicolumn{2}{c}{(1)}           &\multicolumn{2}{c}{(2)}           \\
            &\multicolumn{2}{c}{price}         &\multicolumn{2}{c}{price}         \\
\hline
mpg         &      -294.2\sym{***}&     (-5.28)&      -299.6\sym{***}&     (-4.73)\\
foreign     &      1767.3\sym{*}  &      (2.52)&      1102.3         &      (1.22)\\
\_cons      &     11905.4\sym{***}&     (10.28)&     10856.2\sym{***}&      (4.79)\\
rep dummies &          No         &            &         Yes         &            \\
\hline
\(N\)       &          74         &            &          69         &            \\
\hline\hline
\multicolumn{5}{l}{\footnotesize \textit{t} statistics in parentheses}\\
\multicolumn{5}{l}{\footnotesize \sym{*} \(p<0.05\), \sym{**} \(p<0.01\), \sym{***} \(p<0.001\)}\\
\end{tabular}
\end{table}
```
Which looks great! But you'll notice that the "No/Yes" indication is not aligned with the name of the model.
Using the current command we can use the `substitute()` option to fix this:
```Stata
esttab using example.tex, wide indicate(rep dummies = _Irep78*) /// 
    title(Example using sysuse auto) /// 
    substitute( "No         &" "\multicolumn{2}{c}{No}" /// 
		"Yes         &" "\multicolumn{2}{c}{Yes}")
```
Takes care of this very nicely, but it is sensitive to the number of spaces between "No" and "&" I wanted something more general. So while I was proctoring an exam last week I read through the `estout` code and realized that I could use `ustrregexra` to allow the following alternative:
```Stata
esttab using example.tex, wide indicate(rep dummies = _Irep78*) /// 
    title(Example using sysuse auto) /// 
    regex(  "No .&" "\multicolumn{2}{c}{No}" /// 
	    "Yes .&" "\multicolumn{2}{c}{Yes}")
```

To my utter astonishment, the solution that I put together during the exam
seems to work, so I've started a [fork on GitHub for this](https://github.com/ArthurHowardMorris/estout), take it for a spin if
you like and let me know if you have thoughts. This obviously isn't a high
priority (check my cv, it still says Assistant Professor), but here are two
more  things I'd like to add if time permits:

1. Allow the substitution to use matching subgroups in the replacement. This
   would allow me to center the statistics as well.
2. Use a C-Plugin to make a full POSIX compliant regex available in Stata. The
   current specification is... well... small. And only lightly documented, so
    if you just start writing a regex it probably won't work! And there are no
    regex checkers that know about Stata's rather idiosyncratic regex dialect. This
    is probably more work that it's worth, because I don't actually use Stata for
    text processing. If I do this it will as an exercise in integrating C programs
    into Stata, since there are well developed implementations of the POSIX regex
    spec in C.
