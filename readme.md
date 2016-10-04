Analysis preliminaries
----------------------

LENTH-WEIGHT ANALYSIS OF COVARIANCE
-----------------------------------

Analysis overview:

Methods in a nutshell

1.  Fit length-weight data as a linear model by log transforming length and weight
2.  Estimate effect of year, basin
3.  NOTE-year is treated as a factor rather than continuous

Results in a nutshell

1.  

![](readme_files/figure-markdown_github/unnamed-chunk-2-1.png)

Figure 1.

![](readme_files/figure-markdown_github/unnamed-chunk-3-1.png)

Figure 2. Plot of weight (y-axis) and length (x-axis) on log scale for Pallid Sturgeon captured in the upper and lower Missouri River. Lines represent best fit linear models predicting weight from length.

![](readme_files/figure-markdown_github/unnamed-chunk-4-1.png)

Figure 3. Plot of condition (y-axis) and day of year (x-axis) for Pallid Sturgeon captured in the upper and lower basins.

![](readme_files/figure-markdown_github/unnamed-chunk-5-1.png)

Figure 4. Plot of condition (y-axis) and mean weight (x-axis) for Pallid Sturgeon captured in the upper and lower Missouri River.

Table 1. Parameter estimates for linear model relating weight to length. Factors included in the the model are Julian day, Julian day squared, basin, and year. Varying interactions were used to all the length-weight relationship to vary by year and basin.

<table>
<colgroup>
<col width="40%" />
<col width="14%" />
<col width="17%" />
<col width="13%" />
<col width="13%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Estimate</th>
<th align="center">Std. Error</th>
<th align="center">t value</th>
<th align="center">Pr(&gt;|t|)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>llen</strong></td>
<td align="center">3.15</td>
<td align="center">0.114</td>
<td align="center">27.7</td>
<td align="center">2.95e-164</td>
</tr>
<tr class="even">
<td align="center"><strong>jday</strong></td>
<td align="center">-0.00053</td>
<td align="center">0.000122</td>
<td align="center">-4.34</td>
<td align="center">1.46e-05</td>
</tr>
<tr class="odd">
<td align="center"><strong>jdaysq</strong></td>
<td align="center">1.36e-06</td>
<td align="center">3.09e-07</td>
<td align="center">4.39</td>
<td align="center">1.14e-05</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2004</strong></td>
<td align="center">-0.882</td>
<td align="center">0.823</td>
<td align="center">-1.07</td>
<td align="center">0.284</td>
</tr>
<tr class="odd">
<td align="center"><strong>year_f2005</strong></td>
<td align="center">0.303</td>
<td align="center">0.781</td>
<td align="center">0.388</td>
<td align="center">0.698</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2006</strong></td>
<td align="center">-0.311</td>
<td align="center">0.774</td>
<td align="center">-0.402</td>
<td align="center">0.688</td>
</tr>
<tr class="odd">
<td align="center"><strong>year_f2007</strong></td>
<td align="center">0.309</td>
<td align="center">0.754</td>
<td align="center">0.41</td>
<td align="center">0.682</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2008</strong></td>
<td align="center">-0.538</td>
<td align="center">0.75</td>
<td align="center">-0.718</td>
<td align="center">0.473</td>
</tr>
<tr class="odd">
<td align="center"><strong>year_f2009</strong></td>
<td align="center">-0.252</td>
<td align="center">0.748</td>
<td align="center">-0.337</td>
<td align="center">0.736</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2010</strong></td>
<td align="center">-0.262</td>
<td align="center">0.748</td>
<td align="center">-0.35</td>
<td align="center">0.726</td>
</tr>
<tr class="odd">
<td align="center"><strong>year_f2011</strong></td>
<td align="center">-1.22</td>
<td align="center">0.746</td>
<td align="center">-1.64</td>
<td align="center">0.102</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2012</strong></td>
<td align="center">-1.72</td>
<td align="center">0.749</td>
<td align="center">-2.3</td>
<td align="center">0.0217</td>
</tr>
<tr class="odd">
<td align="center"><strong>year_f2013</strong></td>
<td align="center">-1.49</td>
<td align="center">0.749</td>
<td align="center">-1.99</td>
<td align="center">0.0467</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2014</strong></td>
<td align="center">-0.755</td>
<td align="center">0.75</td>
<td align="center">-1.01</td>
<td align="center">0.314</td>
</tr>
<tr class="odd">
<td align="center"><strong>year_f2015</strong></td>
<td align="center">0.153</td>
<td align="center">0.748</td>
<td align="center">0.205</td>
<td align="center">0.838</td>
</tr>
<tr class="even">
<td align="center"><strong>year_f2016</strong></td>
<td align="center">-0.323</td>
<td align="center">0.76</td>
<td align="center">-0.425</td>
<td align="center">0.671</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB</strong></td>
<td align="center">0.612</td>
<td align="center">0.927</td>
<td align="center">0.66</td>
<td align="center">0.509</td>
</tr>
<tr class="even">
<td align="center"><strong>jday:basinUB</strong></td>
<td align="center">0.000998</td>
<td align="center">0.00024</td>
<td align="center">4.15</td>
<td align="center">3.33e-05</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:jdaysq</strong></td>
<td align="center">-2.5e-06</td>
<td align="center">6e-07</td>
<td align="center">-4.17</td>
<td align="center">3.05e-05</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2004</strong></td>
<td align="center">0.969</td>
<td align="center">1.19</td>
<td align="center">0.815</td>
<td align="center">0.415</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:year_f2005</strong></td>
<td align="center">-1.97</td>
<td align="center">0.988</td>
<td align="center">-2</td>
<td align="center">0.046</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2006</strong></td>
<td align="center">-0.385</td>
<td align="center">0.971</td>
<td align="center">-0.396</td>
<td align="center">0.692</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:year_f2007</strong></td>
<td align="center">-0.487</td>
<td align="center">0.952</td>
<td align="center">-0.511</td>
<td align="center">0.609</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2008</strong></td>
<td align="center">-1.02</td>
<td align="center">0.94</td>
<td align="center">-1.09</td>
<td align="center">0.277</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:year_f2009</strong></td>
<td align="center">-0.363</td>
<td align="center">0.939</td>
<td align="center">-0.387</td>
<td align="center">0.699</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2010</strong></td>
<td align="center">-0.896</td>
<td align="center">0.937</td>
<td align="center">-0.957</td>
<td align="center">0.339</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:year_f2011</strong></td>
<td align="center">1.57</td>
<td align="center">0.94</td>
<td align="center">1.67</td>
<td align="center">0.0943</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2012</strong></td>
<td align="center">0.694</td>
<td align="center">0.939</td>
<td align="center">0.739</td>
<td align="center">0.46</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:year_f2013</strong></td>
<td align="center">0.48</td>
<td align="center">0.939</td>
<td align="center">0.511</td>
<td align="center">0.609</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2014</strong></td>
<td align="center">-0.29</td>
<td align="center">0.94</td>
<td align="center">-0.308</td>
<td align="center">0.758</td>
</tr>
<tr class="odd">
<td align="center"><strong>basinUB:year_f2015</strong></td>
<td align="center">-1.19</td>
<td align="center">0.94</td>
<td align="center">-1.26</td>
<td align="center">0.207</td>
</tr>
<tr class="even">
<td align="center"><strong>basinUB:year_f2016</strong></td>
<td align="center">-1.53</td>
<td align="center">0.972</td>
<td align="center">-1.57</td>
<td align="center">0.116</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2004</strong></td>
<td align="center">0.141</td>
<td align="center">0.127</td>
<td align="center">1.11</td>
<td align="center">0.268</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:year_f2005</strong></td>
<td align="center">-0.0429</td>
<td align="center">0.12</td>
<td align="center">-0.356</td>
<td align="center">0.722</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2006</strong></td>
<td align="center">0.0502</td>
<td align="center">0.119</td>
<td align="center">0.421</td>
<td align="center">0.674</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:year_f2007</strong></td>
<td align="center">-0.0391</td>
<td align="center">0.116</td>
<td align="center">-0.337</td>
<td align="center">0.736</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2008</strong></td>
<td align="center">0.0855</td>
<td align="center">0.115</td>
<td align="center">0.742</td>
<td align="center">0.458</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:year_f2009</strong></td>
<td align="center">0.0439</td>
<td align="center">0.115</td>
<td align="center">0.382</td>
<td align="center">0.703</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2010</strong></td>
<td align="center">0.0456</td>
<td align="center">0.115</td>
<td align="center">0.397</td>
<td align="center">0.691</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:year_f2011</strong></td>
<td align="center">0.193</td>
<td align="center">0.115</td>
<td align="center">1.69</td>
<td align="center">0.0918</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2012</strong></td>
<td align="center">0.274</td>
<td align="center">0.115</td>
<td align="center">2.38</td>
<td align="center">0.0174</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:year_f2013</strong></td>
<td align="center">0.227</td>
<td align="center">0.115</td>
<td align="center">1.97</td>
<td align="center">0.0484</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2014</strong></td>
<td align="center">0.108</td>
<td align="center">0.115</td>
<td align="center">0.939</td>
<td align="center">0.348</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:year_f2015</strong></td>
<td align="center">-0.0319</td>
<td align="center">0.115</td>
<td align="center">-0.278</td>
<td align="center">0.781</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:year_f2016</strong></td>
<td align="center">0.044</td>
<td align="center">0.117</td>
<td align="center">0.377</td>
<td align="center">0.706</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB</strong></td>
<td align="center">-0.123</td>
<td align="center">0.144</td>
<td align="center">-0.856</td>
<td align="center">0.392</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2004</strong></td>
<td align="center">-0.152</td>
<td align="center">0.186</td>
<td align="center">-0.817</td>
<td align="center">0.414</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB:year_f2005</strong></td>
<td align="center">0.338</td>
<td align="center">0.154</td>
<td align="center">2.19</td>
<td align="center">0.0284</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2006</strong></td>
<td align="center">0.0788</td>
<td align="center">0.151</td>
<td align="center">0.521</td>
<td align="center">0.602</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB:year_f2007</strong></td>
<td align="center">0.0801</td>
<td align="center">0.148</td>
<td align="center">0.541</td>
<td align="center">0.589</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2008</strong></td>
<td align="center">0.189</td>
<td align="center">0.146</td>
<td align="center">1.3</td>
<td align="center">0.195</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB:year_f2009</strong></td>
<td align="center">0.0704</td>
<td align="center">0.146</td>
<td align="center">0.484</td>
<td align="center">0.629</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2010</strong></td>
<td align="center">0.158</td>
<td align="center">0.145</td>
<td align="center">1.08</td>
<td align="center">0.278</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB:year_f2011</strong></td>
<td align="center">-0.236</td>
<td align="center">0.146</td>
<td align="center">-1.61</td>
<td align="center">0.106</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2012</strong></td>
<td align="center">-0.0916</td>
<td align="center">0.146</td>
<td align="center">-0.629</td>
<td align="center">0.529</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB:year_f2013</strong></td>
<td align="center">-0.0524</td>
<td align="center">0.146</td>
<td align="center">-0.36</td>
<td align="center">0.719</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2014</strong></td>
<td align="center">0.0768</td>
<td align="center">0.146</td>
<td align="center">0.527</td>
<td align="center">0.598</td>
</tr>
<tr class="even">
<td align="center"><strong>llen:basinUB:year_f2015</strong></td>
<td align="center">0.216</td>
<td align="center">0.146</td>
<td align="center">1.48</td>
<td align="center">0.139</td>
</tr>
<tr class="odd">
<td align="center"><strong>llen:basinUB:year_f2016</strong></td>
<td align="center">0.266</td>
<td align="center">0.151</td>
<td align="center">1.76</td>
<td align="center">0.0777</td>
</tr>
<tr class="even">
<td align="center"><strong>(Intercept)</strong></td>
<td align="center">-13.6</td>
<td align="center">0.74</td>
<td align="center">-18.3</td>
<td align="center">4.1e-74</td>
</tr>
</tbody>
</table>

<table style="width:85%;">
<caption>Fitting linear model: lwgh ~ llen + jday + jday:basin + jdaysq + jdaysq:basin + year_f + basin + year_f:basin + llen:year_f + basin:llen + basin:llen:year_f</caption>
<colgroup>
<col width="20%" />
<col width="30%" />
<col width="11%" />
<col width="22%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Observations</th>
<th align="center">Residual Std. Error</th>
<th align="center"><span class="math inline"><em>R</em><sup>2</sup></span></th>
<th align="center">Adjusted <span class="math inline"><em>R</em><sup>2</sup></span></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">12097</td>
<td align="center">0.125</td>
<td align="center">0.988</td>
<td align="center">0.988</td>
</tr>
</tbody>
</table>
