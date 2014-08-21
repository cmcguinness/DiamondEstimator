Readme for Diamond Weight Estimator
===

This project holds an R Shiny application that implements a simple diamond weight estimator.

It consists of the following files:

* DiamondEstimator.Rproj: project definition file for RStudio
* server.R: The server code, which is responsible for calculating the estimated weight as well as a minor UI effect.
* ui.R: The user interface, which has the inputs to program, the output, and some misc text and effects.
* www/estimator-banner.png: The banner shown in the UI
* www/ heart.png, oval.png, round.png: Help images that show how to measure a diamond

The program uses industry standard algorithms to calculate diamond weights, although I have not rigorously
tested the code.  It is meant as an example program, not a production application, and so relying on its
results are iffy.
