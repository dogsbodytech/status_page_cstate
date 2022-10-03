---
title: Disabling SSH access to all servers
date: 2013-02-19T23:55:00+00:00
modified: 2013-02-19T23:55:00+00:00
severity: disrupted
resolved: true
section: issue
informational: "true"
affected:
  - Yellow
aliases:
  - /incidents/id5
  - /incidents/id5
slug: id5
resolvedWhen: 2013-02-19T23:55:00+00:00
---

It seems there is a major “[0-day](https://en.wikipedia.org/wiki/Zero-day_(computing))” vulnerability doing the rounds and a lot of data is showing SSH as the attack vector, even though the exact vulnerability hasn’t been fully discovered yet or patched.

A number of hosts have already been compromised and we feel it would be better to block SSH access to our servers now and keep your data secure than wait until something goes wrong.

If you desperately need SSH access then please do [contact us](https://www.dogsbodyhosting.net/contact/) and we’ll be glad to add your IP address to our whitelists.

For those of you interested, the vulnerability seems to mostly affect Redhat/CentOS (which we use) with cPanel/Plesk installed (which we do not use) but not exclusively which is why we are taking this action.

For more information on this vulnerability please see…

[http://www.webhostingtalk.com/showthread.php?t=1235797](http://www.webhostingtalk.com/showthread.php?t=1235797)

[http://seclists.org/oss-sec/2013/q1/326](http://seclists.org/oss-sec/2013/q1/326)

[https://bugzilla.redhat.com/show_bug.cgi?id=911937](https://bugzilla.redhat.com/show_bug.cgi?id=911937)

[http://forums.cpanel.net/f185/sshd-rootkit-323962.html](http://forums.cpanel.net/f185/sshd-rootkit-323962.html)

**Update:** This has now been shown to be a vulnerability that only affects cPanel.  We are opening access back up on those servers with public access. Thank you for your understanding during this. We do everything we can to keep your data safe.

