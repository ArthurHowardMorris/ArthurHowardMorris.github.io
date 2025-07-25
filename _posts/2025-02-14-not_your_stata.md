---
title: '2025-02-14'
categories:
  - coding
tags:
  - stata
  - things i learned in 2025
published: true
---

Last year I switched from owning to renting Stata. The difference matters,
sometimes it's the difference between owning Stata and owning a brick.

I switched from buying perpetual licenses to paying a subscription for StataNow.
I liked the idea of the rolling releases (letting me have new features without
waiting for the next major version) and I understand that providing a more
stable cash flow to the company has benefits for them. It's how software works
these days... so fine. I did it.

Now, I'm fortunate that my university gives me a budget for this sort of
expense, and so I'm happy to pay the folks at Stata to keep building tools like
this. However, there is always a little faffing about with red tape that happens
when you renew subscriptions this way (made a little worse that Stata's
reminders were a little... shall we say 'phishy'). Nonetheless, there was a
small lag between my StataNow subscription expiring and the new one starting.
During the interim my StataNow was completely bricked. None of my Stata code
would run. I realized that this is a profound problem, and ultimately it
convinced me to move all of my workflows to open source alternatives.

Before I explain my thinking, I want to clarify a couple things.

## _Mea culpa_ maybe

1. I could have avoided the lapse in subscriptions.
2. It's totally fair for Stata to do this. They pay people to develop stuff that
   I use, and I pay them for it. All fair.
3. I solved the problem by simply switching back to StataMP 18 from StataNow for
   the few days that StataNow was not functional.[^why]

[^why]: I have a copy of StataMP 18 with a perpetual license for MacOS, Windows,
    and Linux saved along with my offsite backups of the code and data for all
of my published papers.

## Why I'm (incrementally) removing Stata from my workflow

If you can't run Stata then you can't replicate the results that you have
produced with Stata. This is the classic "we cannot replicate our own results
problem" that has featured in several high profile retractions. It's the rock on
which promising careers have wrecked.[^prev] Most of the time consuming and
fiddly bits of my workflows are results of my obsession with avoiding this
problem. __But StataNow caused this problem__. So while it's totally fair for
Stata to shift toward the subscription model for their software, my brief lapse
in StataNow highlights that if we don't own our tools we don't own the code or
the results and we can't guarantee that we can reproduce them. For me that's
unacceptable.

Now, I'll keep using Stata for quite some time, because it is something of a
_lingua franca_ in Economics and it's subfields, and because I have a
substantial codebase already written in it. However, I'll be transitioning
toward tools that allow me to 'own' the tools.

My previous post about UV highlights one way that the Python ecosystem is
working to make it easy to create reproducible research, the AER's use of Docker
for replication packages, and the entire NIX ecosystem, are all evidence that
this need for reproducibility isn't just a bee in my bonnet... or at least it's
evidence that many similar bees are in many bonnets in many different parts of
the ecosystem.

[^prev]: I've pointed out in previous posts that retractions in non-experimental
    empirical research commonly turn on the ability of the authors to reproduce
_their own_ results, _not_ failures of other researchers to replicate the
results.
