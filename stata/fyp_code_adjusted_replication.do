************************************
* Main Estimations for JOP Tables  *
* Author: Findley, Piazza, Young   *
* Project: Games Rivals Play JOP   *
* Date: March 26, 2013			   *
************************************ 

*******************************************************************************
* Errata Note 																  *
* Due to a data management error, some observations were missing from the     * 
* 1968-2002 period reported in JOP. 								          *
*																			  *
* The data contained here include the full 1968-2002 period with the models   *
* estimated exactly the same way as they were in the JOP paper. The raw       *      
* results (coefficients, standard errors, p-values) are of course different   *
* than what is reported in the print version. However, all of the results for * 
* rivalry remain substantively the same (same sign; statistically significant)* 
* In some cases, the results are stronger than those reported in the JOP paper*
*																			  *
* We produce new results and report them in the companion document titled:    *
* "JOP-Results-Errata.doc  										     	      *
*******************************************************************************

use "fpy replication data jop 2012.dta"
set more off

/*NOTE: original code from fpy, adjusted for the replication*/ 

******************
* Table 1        *
******************

/* Table 1, Model 1*/

nbreg terrorCounts rivalry jointDem1 logcapratio contiguity, nolog cluster(dyadid) dispersion(constant) robust

/*store table, do for each model*/ 

estimates store m1

/*Table 1, Model 2 */

nbreg terrorCounts2 rivalry jointDem1 logcapratio contiguity, nolog cluster(dyadid)  dispersion(constant) robust

estimates store m2

/*Table 1, Model 3 */
nbreg terrorCounts rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2, nolog cluster(dyadid) dispersion(constant) robust

estimates store m3

/*Table 1, Model 4 */
nbreg terrorCounts2 rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2, nolog cluster(dyadid)  dispersion(constant) robust

estimates store m4

/*Output table*/ 

estout m1 m2 m3 m4, cells(b se(par))

********************
* Table 2          *
********************

/* Table 2, Model 5 */

zinb terrorCounts rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2, inflate(rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2) cluster(dyadid) nolog robust

estimates store m5

/* Table 2, Model 6 */
zinb terrorCounts2 rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2, inflate(rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2) cluster(dyadid) nolog robust

estimates store m6

/* Table 2, Model 7 */
/* Note: convergence issues require a different maximization technique (bfgs) */
zinb terrorCounts rivalry jointDem1 logcapratio historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2, inflate(jointDem1) cluster(dyadid)  technique(bfgs) nolog robust

estimates store m7

/* Table 2, Model 8 */
zinb terrorCounts2 rivalry jointDem1 logcapratio  historyl1 historyl2 coldwar1 conflict1 conflict2 contiguity war1 war2, inflate(jointDem1) cluster(dyadid) nolog robust

estimates store m8

/*Output table*/ 

estout m5 m6 m7 m8, cells(c se(par)) 



