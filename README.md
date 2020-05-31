
#### Zero Defect Calculator
##### R package with shiny to determine risk of a sample when zero events or defects are observed using the rule of "threes"
##### Created by Tony Gojanovic
##### June 1, 2020
***

##### Background

The rule of threes is the upper bound of a 95% statistical confidence interval for how poor quality can be consistent with finding zero defects or events in a random sample. The formula for the upper bound of the interval is  

$p = 3/ n$

in which a random sample of size n is used to determine the upper limit risk, or p. The lower bound of the confidence interval will always be zero. In other words, the 95% confidence interval would be written as 0, 3/n. What the confidence interval generalizes is a range of values likely to contain the true defect rate given zero observed defects in a random sample of size n. The 95% simply refers to a 0.95 probability that the confidence interval constructed from the initial sample captures the true defect rate. The value of the confidence interval in quality applications is to temper overly opti- mistic expectations associated with finding zero defects in a sample with a statement of potential defect values. In ssing the rule of threes for evaluating defect-free claims
the instance of actually having the worst case risk, it can be shown that the 95% implies the probability of finding one or more defects in the sample.  

**Key takeaway:** Just because someone claims “zero” observed “failures” doesn’t imply zero risk. 

***

#### Usage

The zero defect calculator has two components:

**Observed Risk Calculator**

The observed risk calculator takes a given sample size and calculates the maximum possible defect level consistent with observing 'zero' defects (it could be truly zero or as high as the estimated value).

Example: Given a sample size of 100 with '0' observed defects, the true defect level could be anywhere between 0 and  0.03 (3%) and still be consistent with '0' observed defects.  

**Sample Size Calculator**
The sample size calculator takes a maximum allowable risk and calculates the minimum possible sample size consistent with observing 'zero' defects).  

Example: Given a maximum allowable defect level of 0.005, a sample size of 600 with no observed defects would assure the true defect level would be no greater than 0.005.

**Notes** 

- The above assumes random sampling and independence between events; be aware of what random sampling is and is not.  
- Sample sizes of 20 or more are recommended for the 3/n principle to work properly.
- Statistics is evidence, not proof e.g. know your product and process to define total risk in a meaningful way.  
- Probabilities are useful for comparative risk….whether something will actually fail or not in the future is not usually known.  
- In cases in which 1 or more events or defects are observed, other rules will be more applicable.
- Remember, a confidence interval is like a fish net … it’s a statement related to the confidence of capturing the true proportion.

***

#### Algorithm

The algorthim is based on the following:  

$p = 3/ n$

In which p is the "defect level" and n is the sample size.  For example, given a sample size of n = 100, the true risk level could be between 0 and 0.03 and still be consistent with "zero" observed defects.

Similarly, the terms can be rearranged to find a sample size:

$n = 3/p$  

For example, if the maximum allowable defect level should not exceed p = 0.005, then the sample size would have to at least n = 600 with "zero" observed defects.

***

#### Derivation

The rule of threes can be derived from the binomial model. Briefly sketched, if given a sequence of $n$ independent trials with a pass or fail outcome on each trial the test statistic for the defect proportion, $p$, will follow a binomial distribution with parameters $n$ and $p$.  

The probability of seeing zero failures in $n$ trials is computed with the binomial distribution as  

$(1–p)^n$. 

Setting $(1–p)^n = 0.05$ (the 5% risk level), and using natural logarithms to solve the equation, we have  

$nln(1–p) \approx –3$.  

For small $p$, 

$ln(1–p) \approx –p$ 

or  

$–np \approx –3$ 

or  

$p \approx  3/n$. 

The rule of threes works best for sample sizes of 20 or more. A similar derivation can be obtained with the Poisson model. 

***

#### References

The following is a useful resource to understand equatorial coordinate systems and the application fo the haversine formula for fidning distances:

Gojanovic, Tony, "Zero Defect Sampling," *Quality Progress*, 2007, p. 72.  
van Belle, Gerald, Statistical Rules of Thumb, John Wiley & Sons, New York, 2002.  





