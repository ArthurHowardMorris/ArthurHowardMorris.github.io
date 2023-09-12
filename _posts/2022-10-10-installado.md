---
title: '2022-10-10'
categories:
  - coding
tags: 
  - install
  - stata
  - psacalc
published: true
---

Installing `.ado` files in general--`psacalc2` in particular.

Part of an on going series answering questions that I get via email. Installation comes up rather often since I have a [fork of `psacalc` on my github page](https://github.com/ArthurHowardMorris/psacalc_supports_reghdfe), unoriginally named `psacalc2`, that allows folks to use `psacalc` with `reghdfe`. My contribution is pretty minor. `psacalc` allows use of `areg` and is written mostly in pure Stata (as opposed to Mata or C) so it was straightforward to make a few tweaks to allow use with `reghdfe`. Since I'm not distributing this via SSC (given that my edits are minor that would be a bit presumptuous), folks often struggle to install `psacalc2`. So here's a quick rundown on how to install `.ado` files:

There are two main ways to get `.ado` files onto your machine so that Stata knows what you are talking about when you use them.

## 1. `ssc install`

The most common way to install `.ado` files is with the `ssc install` command. This is super straightforward, and you don't even need to know what it does for it to work. This is how most folks probably install `psacalc`. 

``` Stata
ssc install psacalc
```

A more general version of this is `net install`. Another approach is the `github` command (itself available via `ssc install github`).

If you need to find an `.ado` file on your machine, for example `psacalc`, passing `which psacalc` to the interpreter will return the following:

``` Stata
/Users/arthurmorris/Library/Application Support/Stata/ado/plus/p/psacalc.ado
*! psacalc 2.1 12May2017
```

## 2. place the `.ado` file in the "adopath"

The "adopath" is just a list of locations where Stata expects to find `.ado` files. If you pass `adopath` to the interpreter Stata will reply by telling you where it is looking for `.ado` files. The defaults will look something like this:

``` Stata
[1]  (BASE)      "/Applications/Stata/ado/base/"
[2]  (SITE)      "/Applications/Stata/ado/site/"
[3]              "."
[4]  (PERSONAL)  "/Users/arthurmorris/Documents/Stata/ado/personal/"
[5]  (PLUS)      "/Users/arthurmorris/Library/Application Support/Stata/ado/plus/"
[6]  (OLDPLACE)  "~/ado/"
```

1 & 2 are maintained by Stata itself so we will leave them alone. 3 "." means that Stata looks in the current working directory, this would be more useful if Stata `.do` files knew where they were located while they were running... but they don't, so I find that relying on this behavior often causes more hassle than it's worth (in contrast to python where this works very well). __4 is the main event for our purposes,__ but before we dive in there I'll just note that 5 is where `ssc install` and `net install` puts the files that they download, and 6 is a depreciated location used by previous versions of Stata.[^adopath]

[^adopath]: See `help adopath` for details on how to modify this list. 

Okay, back to 4.

### Put any `.ado` files that you download manually (or write yourself) in "PERSONAL" 

Stata makes referencing this location easy by including it as the c-class parameter `c(sysdir_personal)` (see `help creturn`), but--possibly unexpectedl--does not create this folder when you install it. To download and install `psacalc2` do the following:

1. Go to github and download the file: [https://github.com/ArthurHowardMorris/psacalc_supports_reghdfe](https://github.com/ArthurHowardMorris/psacalc_supports_reghdfe)
2. Check whether your `c(sysdir_personal)` exists. If the following works then  exists :)

``` Stata
cd "`c(sysdir_personal)'"
```

3. If 2. throws and error, then create the folder:

``` Stata
mkdir "`c(sysdir_personal)'"
```

4. Place the files you downloaded in the folder you just created. A fast way to do this is just open a terminal and:

``` bash
cd /Users/arthurmorris/Documents/Stata/ado/personal/
open .
```

to open a finder widow, then drag and drop from your downloads folder, but at this point you probably can navigate on your own.

5. Finally, confirm that your new command is where you think that it should be:

```Stata
which psacalc2
```

should tell you that your file is now in your "PERSONAL" folder.
