<!-- Perl Performance Tool -->

# background
https://lucid.app/lucidchart/d2eac99d-dcca-4a59-9256-4f5b0b2bb043/edit?invitationId=inv_d472c16d-09c7-4d75-8e18-43bea64535ee&page=0_0#
COLTEC has been using a bus call (fetch) to load data from monolith oracle into microservice postgres, after we have made the transition, I started looking into the two underneath bus calls (history and benefits) to better understand the data we are fetching from monolith.
I found some call stacks and queries in them that are not used anymore in our current use case. Since they were originally created to support the ui directly but our use case has been changed to support microservice instead, we want to remove any code or data that are not considered core data structure, meaning if they can be derived from core data structure.
So I tried to optimize our bus call, then I wondered if there was a tool that could run some performance test for Perl code, then Hannah pointed me to this tool.

# repo (hannah)
https://bitbucket.athenahealth.com/users/mcardarelli/repos/performance_tools/browse/perl
The run time of the tool depends on the function too, our function is very large, I tried to run just 30 iterations but it took more than half an hour and I ended up aborting it due to terminal not responding. But it worked okay when I ran like 5 or 10 iterations.

# flame
file:///Z:/gitland/perf_test/target/nytprof-fetch_458705a94_old/index.html
https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html
Apparently the color is not meaningful, but the height and width are meaningful. The height represents the call stack and the width represents the percentage of latency.
We are dealing with a very old code base and there are still many things we could look into in the future.
Another thing to notice is that local and dev server are way slower than prod server, so even if you see dramatic performance improvements in this tool, it might not reflect equivalent improvements in prod.

# conf (nivethitha)
New York Times Profiler?
https://athenaconfluence.athenahealth.com/display/RDDOCS/How+to+Profile+Perl+using+NYTProf
https://metacpan.org/dist/Devel-NYTProf/view/lib/Devel/NYTProf.pm
