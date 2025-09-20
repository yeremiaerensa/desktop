#!/bin/bash

# Nama service MySQL di Windows
SERVICE="mysql-xampp"

# Fungsi untuk jalankan PowerShell sebagai admin
run_admin_ps() {
    powershell.exe -Command "Start-Process powershell -ArgumentList '-NoProfile -Command \"$1\"' -Verb runAs"
}

case "$1" in
    start)
        echo "Starting MySQL..."
        run_admin_ps "Start-Service -Name $SERVICE"
        ;;
    stop)
        echo "Stopping MySQL..."
        run_admin_ps "Stop-Service -Name $SERVICE"
        ;;
    restart)
        echo "Restarting MySQL..."
        run_admin_ps "Restart-Service -Name $SERVICE"
        ;;
    status)
        powershell.exe -Command "Get-Service -Name $SERVICE | Select-Object Status"
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac


# alias mysql-run="~/Documents/Coding/Script/mysql-control.sh start"
# alias mysql-stop="~/Documents/Coding/Script/mysql-control.sh stop"
# alias mysql-status="~/Documents/Coding/Script/mysql-control.sh status"
# alias mysql-restart="~/Documents/Coding/Script/mysql-control.sh restart"
# alias php-mysql='bash ~/Documents/Coding/Script/php-mysql-database.sh'

# option 2 run as admin in powershell

# Register-ScheduledTask `
#     -TaskName "MySQL-Start" `
#     -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command Start-Service -Name mysql-xampp") `
#     -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date)) `
#     -RunLevel Highest `
#     -Force

# Register-ScheduledTask `
#     -TaskName "MySQL-Stop" `
#     -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command Stop-Service -Name mysql-xampp") `
#     -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date)) `
#     -RunLevel Highest `
#     -Force

# Register-ScheduledTask `
#     -TaskName "MySQL-Restart" `
#     -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command Restart-Service -Name mysql-xampp") `
#     -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date)) `
#     -RunLevel Highest `
#     -Force

# alias mysql-cli='mysql -u root -p'
# alias mysql-run='powershell.exe -Command "Start-ScheduledTask -TaskName MySQL-Start"'
# alias mysql-stop='powershell.exe -Command "Start-ScheduledTask -TaskName MySQL-Stop"'
# alias mysql-restart='powershell.exe -Command "Start-ScheduledTask -TaskName MySQL-Restart"'
# alias mysql-status='powershell.exe -NoProfile -Command "Get-Service -Name mysql-xampp | Select-Object Status, Name, DisplayName"'