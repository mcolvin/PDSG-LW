---
title: "Robust design-incorporating auxiliary information."
author: Michael E. Colvin
date: 30 September 2016
output:
  md_document:
    variant: markdown_github
  html_document:
    theme: flatly
    highlight: espresso
    toc: FALSE
---

## Analysis preliminaries




## LENTH-WEIGHT ANALYSIS OF COVARIANCE

Analysis overview:

Methods in a nutshell

1. Fit length-weight data as a linear model by log transforming length and weight
2. Estimate effect of year, basin
3. NOTE-year is treated as a factor rather than continuous

Results in a nutshell

1.

<img src="readme_files/figure-html/unnamed-chunk-2-1.png" width="672" />


Figure 1. 

<img src="readme_files/figure-html/unnamed-chunk-3-1.png" width="672" />

Figure 2. Plot of weight (y-axis) and length (x-axis) on log scale for Pallid Sturgeon captured in the upper and lower
Missouri River. Lines represent best fit linear models predicting weight from length.

<img src="readme_files/figure-html/unnamed-chunk-4-1.png" width="672" />

Figure 3. Plot of condition (y-axis) and day of year (x-axis) for Pallid Sturgeon captured in the upper and lower basins.

   


<img src="readme_files/figure-html/unnamed-chunk-5-1.png" width="672" />

Figure 4. Plot of condition (y-axis) and mean weight (x-axis) for Pallid Sturgeon captured in the upper and lower
Missouri River.   


Table 1. Parameter estimates for linear model relating weight to length.
Factors included in the the model are Julian day, Julian day squared, basin, and year.
Varying interactions were used to all the length-weight relationship to vary by year and basin.


--------------------------------------------------------------------------
           &nbsp;              Estimate   Std. Error   t value   Pr(>|t|) 
----------------------------- ---------- ------------ --------- ----------
          **llen**               3.15       0.114       27.7    2.95e-164 

          **jday**             -0.00053    0.000122     -4.34    1.46e-05 

         **jdaysq**            1.36e-06    3.09e-07     4.39     1.14e-05 

       **year_f2004**           -0.882      0.823       -1.07     0.284   

       **year_f2005**           0.303       0.781       0.388     0.698   

       **year_f2006**           -0.311      0.774      -0.402     0.688   

       **year_f2007**           0.309       0.754       0.41      0.682   

       **year_f2008**           -0.538       0.75      -0.718     0.473   

       **year_f2009**           -0.252      0.748      -0.337     0.736   

       **year_f2010**           -0.262      0.748       -0.35     0.726   

       **year_f2011**           -1.22       0.746       -1.64     0.102   

       **year_f2012**           -1.72       0.749       -2.3      0.0217  

       **year_f2013**           -1.49       0.749       -1.99     0.0467  

       **year_f2014**           -0.755       0.75       -1.01     0.314   

       **year_f2015**           0.153       0.748       0.205     0.838   

       **year_f2016**           -0.323       0.76      -0.425     0.671   

         **basinUB**            0.612       0.927       0.66      0.509   

      **jday:basinUB**         0.000998    0.00024      4.15     3.33e-05 

     **basinUB:jdaysq**        -2.5e-06     6e-07       -4.17    3.05e-05 

   **basinUB:year_f2004**       0.969        1.19       0.815     0.415   

   **basinUB:year_f2005**       -1.97       0.988        -2       0.046   

   **basinUB:year_f2006**       -0.385      0.971      -0.396     0.692   

   **basinUB:year_f2007**       -0.487      0.952      -0.511     0.609   

   **basinUB:year_f2008**       -1.02        0.94       -1.09     0.277   

   **basinUB:year_f2009**       -0.363      0.939      -0.387     0.699   

   **basinUB:year_f2010**       -0.896      0.937      -0.957     0.339   

   **basinUB:year_f2011**        1.57        0.94       1.67      0.0943  

   **basinUB:year_f2012**       0.694       0.939       0.739      0.46   

   **basinUB:year_f2013**        0.48       0.939       0.511     0.609   

   **basinUB:year_f2014**       -0.29        0.94      -0.308     0.758   

   **basinUB:year_f2015**       -1.19        0.94       -1.26     0.207   

   **basinUB:year_f2016**       -1.53       0.972       -1.57     0.116   

     **llen:year_f2004**        0.141       0.127       1.11      0.268   

     **llen:year_f2005**       -0.0429       0.12      -0.356     0.722   

     **llen:year_f2006**        0.0502      0.119       0.421     0.674   

     **llen:year_f2007**       -0.0391      0.116      -0.337     0.736   

     **llen:year_f2008**        0.0855      0.115       0.742     0.458   

     **llen:year_f2009**        0.0439      0.115       0.382     0.703   

     **llen:year_f2010**        0.0456      0.115       0.397     0.691   

     **llen:year_f2011**        0.193       0.115       1.69      0.0918  

     **llen:year_f2012**        0.274       0.115       2.38      0.0174  

     **llen:year_f2013**        0.227       0.115       1.97      0.0484  

     **llen:year_f2014**        0.108       0.115       0.939     0.348   

     **llen:year_f2015**       -0.0319      0.115      -0.278     0.781   

     **llen:year_f2016**        0.044       0.117       0.377     0.706   

      **llen:basinUB**          -0.123      0.144      -0.856     0.392   

 **llen:basinUB:year_f2004**    -0.152      0.186      -0.817     0.414   

 **llen:basinUB:year_f2005**    0.338       0.154       2.19      0.0284  

 **llen:basinUB:year_f2006**    0.0788      0.151       0.521     0.602   

 **llen:basinUB:year_f2007**    0.0801      0.148       0.541     0.589   

 **llen:basinUB:year_f2008**    0.189       0.146        1.3      0.195   

 **llen:basinUB:year_f2009**    0.0704      0.146       0.484     0.629   

 **llen:basinUB:year_f2010**    0.158       0.145       1.08      0.278   

 **llen:basinUB:year_f2011**    -0.236      0.146       -1.61     0.106   

 **llen:basinUB:year_f2012**   -0.0916      0.146      -0.629     0.529   

 **llen:basinUB:year_f2013**   -0.0524      0.146       -0.36     0.719   

 **llen:basinUB:year_f2014**    0.0768      0.146       0.527     0.598   

 **llen:basinUB:year_f2015**    0.216       0.146       1.48      0.139   

 **llen:basinUB:year_f2016**    0.266       0.151       1.76      0.0777  

       **(Intercept)**          -13.6        0.74       -18.3    4.1e-74  
--------------------------------------------------------------------------


-------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$   Adjusted $R^2$ 
-------------- --------------------- ------- ----------------
    12097              0.125          0.988       0.988      
-------------------------------------------------------------

Table: Fitting linear model: lwgh ~ llen + jday + jday:basin + jdaysq + jdaysq:basin + year_f + basin + year_f:basin + llen:year_f + basin:llen + basin:llen:year_f

