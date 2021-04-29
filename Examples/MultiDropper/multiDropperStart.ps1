# Nexss Programmer MultiDropper Example

function nohup($command) {
    Start-Process -FilePath "$env:comspec" -ArgumentList "/c $command"  
}

nohup('nexss Select/Dropper --process:title="My Action 1 - Image Resize" --_color=11ff55 --_x=100 --_width=220 --_height=150 --_text="Action 1" --nxsExecute="nexss action1.nexss"')
nohup('nexss Select/Dropper --process:title="My Action 1 - Send Emails" --_color=55ff55 --_x=500 --_width=220 --_height=150 --_text="Action 2" --nxsExecute="nexss action2.nexss"')
nohup('nexss Select/Dropper --process:title="My Action 1 - Another" --_color=88ffff --_x=900 --_width=220 --_height=150 --_text="Action 3 - Custom" --nxsExecute="nexss action3.nexss"')
