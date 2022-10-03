---
title: E-mail could be delayed or bouncing
date: 2021-02-22T01:00:00+00:00
modified: 2021-02-22T01:00:00+00:00
severity: disrupted
resolved: true
section: issue
informational: "true"
affected:
  - Support via Email
aliases:
  - /incidents/id110
slug: id110
resolvedWhen: 2021-02-22T01:00:00+00:00
---

E-mail to and from Dogsbody Technology could be delayed or bounce. We are currently investigating the issue.

**Update 09:00**: Some remote DNS blocklist providers have blocked all IPv6 addresses of our upstream hosting provider.  This only affects mail delivered via IPv6 where our customers are using one of these blocklists or their servers are using the same hosting provider as us.

**Update 10:00**: We now have a workaround in place for inbound mail to us and are working on a workaround for outbound mail from us.

**Update 12:00**: We now have a workaround in place for outbound mail from us.  We are now looking at permanent options to resolve this.

**23 Feb 2021**: The blocklists have now removed the blocks.  We are leaving workarounds in place for a couple of days to let the dust settle.

**25 Feb 2021**: We have been monitoring this over the last few days and have now rolled back the workarounds. Everything is working as expected.

