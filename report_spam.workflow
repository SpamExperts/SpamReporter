on run {input, parameters}

        set question to display dialog "Submit as Spam and delete message?" buttons {"Yes!", "No!"} default button 1
        set answer to button returned of question

         if answer is equal to "No!" then
                quit
        end if
        if answer is equal to "Yes!" then
        end if
        tell application "Mail"
                set theMessages to the selection
                repeat with thisMessage in theMessages
                        set thisSource to source of thisMessage as string
                        tell application "Terminal"
                                activate
                                do shell script "curl -F mailContent=" & quoted form of thisSource & " http://spamreport.spamrl.com/spamreport.php"
                                quit
                        end tell
                end repeat
        end tell
        tell application "Mail"
                set theMessages to (get selection)
                delete theMessages
        end tell
        return input
end run
