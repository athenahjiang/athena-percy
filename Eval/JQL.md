<!-- JQL -->

# New Bugs
project = COLTEC AND issuetype = Bug AND status = New

# My Tasks
Developer = hjiang AND updatedDate >= startOfYear() ORDER BY updatedDate ASC
Developer = hjiang AND resolved >= startOfYear() ORDER BY resolved ASC

## P4 Tasks
Developer = hjiang AND (status = Patch OR status = Patching OR status = Patched) AND ("Resolved" >= 2023-01-01) ORDER BY resolved ASC

## BB Tasks
Developer = hjiang AND (status = "Deployed" OR status = "Ready To Deploy") AND ("Resolved" >= 2023-01-01) ORDER BY resolved ASC

## Spikes
Developer = hjiang AND (status = Done) AND ("Resolved" >= 2023-01-01) ORDER BY resolved ASC

## Epic
Developer = hjiang AND ("Epic Link" = "COLTEC-33") ORDER BY resolved ASC
