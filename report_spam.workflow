set question to display dialog "Report as spam and delete message?" buttons {"Yes", "No"} default button 1
set answer to button returned of question

if answer is equal to "No" then
	quit
end if

tell application "Mail"
	set theMessages to the selection
	repeat with thisMessage in theMessages
		set thisSource to source of thisMessage as string
		set temporaryFile to POSIX path of (path to temporary items folder) & "spamreport-" & rich text 3 thru -1 of ((random number) as string)
		try
			set fileHandle to open for access temporaryFile with write permission
			write thisSource to fileHandle as «class utf8»
			close access fileHandle
		on error
			try
				close access temporaryFile
			end try
		end try
		do shell script "curl -X POST -d @" & temporaryFile & " http://spamreport.spamrl.com/spamreport.php"
		do shell script "rm " & temporaryFile
		move thisMessage to trash mailbox
	end repeat
end tell
