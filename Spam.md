====== Spam ======
Created Wednesday 14 January 2015

== SPF ==
- The Simple Mail Transfer Protocol permits any computer to send email claiming to be from any source address. 
- This is exploited by spammers who often use forged email addresses, making it more difficult to trace a message back to its sender, and easy for spammers to hide their identity in order to avoid responsibility. 
- It is also used in phishing techniques, where users can be duped into disclosing private information in response to an email purportedly sent by an organization such as a bank.

	Qualifiers[edit]
	Each mechanism can be combined with one of four qualifiers:
-	+ for a PASS result. This can be omitted; e.g., +mx is the same as mx.
-	? for a NEUTRAL result interpreted like NONE (no policy).
-	~ (tilde) for SOFTFAIL, a debugging aid between NEUTRAL and FAIL. Typically, messages that return a SOFTFAIL are accepted but tagged.
-	- (minus) for FAIL, the mail should be rejected (see below).
	
	
example: seminar-for-you.ru.    14400   IN      TXT     "v=spf1 a mx ip4:55.11.65.20/2 ip4:90.2.123.112/2 ip4:176.33.87.19/2 ip4:212.63.89.33/2 -all"

== DMARC ==
