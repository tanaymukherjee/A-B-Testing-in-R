# A-B-Testing-in-R

From Wikipedia:

A/B testing (or split-testing) is a randomized experiment with two variants A and B. It includes application of statistical hypothesis testing (or two-sample hypothesis testing), as used in the field of statistics. A/B testing is a way to compare two versions of a single variable, typically by testing a subject's response to variant A against variant B, and determining which of the two variants is more effective.

A/B testing can be powerful for determining whether (given a specific success metric) it's worth adding a product feature, implementing a workflow, among other things.


Steps:
Decide what you're testing (develop null and alternate hypothesis)
Pick a success metric
Sample size calculation
How long do we run test for?
As test is running, watch out for problems
Analyze results (with appropriate statistical test)


What are we testing?
Ho : Adding satisfaction questions across each item has no effect on the completion rate of test.
H1 : Adding satisfaction question across each item has an effect on the completion rate of test.


----

In the example: 
We can see that the p-value is 0.05785, we do not have enough evidence to reject the null hypothesis (Ho). We reject if p-value < 0.05. Evidently, it's not in our case.
