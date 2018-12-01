# Cli afraid-DNS updater
Crontab script to update your afraid dns record.

## Installation
<ol>
<li>
Go to https://freedns.afraid.org/, make an account and create a dns record of type "A".
</li>
<li>
Go to https://freedns.afraid.org/dynamic/ and in the bottom table you will se your nelwy created A record:

<ul>
<li>
You can click on "quick cron example" to download a ready to use crontab script
</li>
<li>
or you can follow the further steps of this guide to do the same thing but with explaination: in this case click on "Direct URL" and copy the URL parameter. For example this is the URL:
<pre>
https://freedns.afraid.org/dynamic/update.php?<b>SFWtomdhbHhrT0RrWDJH5E5sUjRqSKLyOjEyUDd1Nsk5</b>
</pre>
So the parameter will be:
<pre>
SFWtomdhbHhrT0RrWDJH5E5sUjRqSKLyOjEyUDd1Nsk5
</pre>
</li>
</ul>
</li>
<li>
Open crontab in edit mode:
<pre>
crontab -e
</pre>
</li>
<li>
Add to the crontab file the following line to define the PATH variable (crontab has different environment variables):
<pre>
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
</pre>
</li>
<li>
Add to the crontab file the actual afraid DNS updater, substitute your-domain-id with the parameter we gathered before:
<pre>
# DNS updater
1,6,11,16,21,26,31,36,41,46,51,56 * * * * sleep 34 ; wget -O - http://freedns.afraid.org/dynamic/update.php?<b>your-domain-id</b> >> /tmp/afraiddnsupdater.log 2>&1 &
</pre>
</li>
</ol>
