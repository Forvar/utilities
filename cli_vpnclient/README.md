# Cli e-mails
Command line e-mail client

## Installation
<ol>
<li>
Install ssmtp:
<pre>
sudo apt-get install ssmtp
</pre>
</li>
<li>
Edit the configuration file:
<pre>
sudo nano /etc/ssmtp/ssmtp.conf
</pre>
setting the following content:
<pre>
root=<b>username</b>@gmail.com
mailhub=smtp.gmail.com:465
FromLineOverride=YES
AuthUser=<b>username</b>@gmail.com
AuthPass=<b>password</b>
UseTLS=YES
</pre>
</li>
</ol>

## Usage
You can send an e-mail with:
<ul>
<li><b>subject:</b> How are you?</li>
<li><b>text:</b> I'm fine, thaks.</li>
<li><b>to:</b> someone@email.com</li>
</ul>
using the following command:
<pre>
{
  echo "Subject: <b>How are you?</b>"
  echo
  echo "<b>I'm fine, thaks.</b>"
} | ssmtp <b>someone@email.com</b>
</pre>
