---
id: id23
title: Authentication Issues on Purple
date: 2015-09-26T08:40:00+00:00
modified: 2015-09-26T08:40:00+00:00
severity: degraded-performance
affectedsystems:
  - lamp_hosting
resolved: true
---

It seems users on the Purple server cannot login to collect mail or update their sites.  It is suspected that this is caused by an upgrade done at 19:37 last night.<br /><br />Update 11:31: We can confirm that the PAM (Password Authentication Module) configuration on the server was broken using last night’s upgrade.  We have now fixed this issue and apologise for any inconvenience caused.  No email will have been lost during this outage.

