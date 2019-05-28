on run {input, parameters}
	
	set question to display dialog "Report as spam and delete message?" buttons {"Yes", "No"} default button 1
	set answer to button returned of question
	
	if answer is equal to "No" then
		quit
	end if
	tell application "Mail"
		set theMessages to the selection
		repeat with thisMessage in theMessages
			set thisSource to source of thisMessage as string
			do shell script "curl -F mailContent=" & quoted form of thisSource & " http://spamreport.spamrl.com/spamreport.php"
		end repeat
		repeat with thisMessage in theMessages
			move thisMessage to trash mailbox
		end repeat
	end tell
	return input
end run
