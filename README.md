# AI TERMINAL 🤖

Advanced AI-style Windows terminal made using Batch scripting (`.bat`).

AI TERMINAL combines useful Windows utilities, system tools, network commands, cleanup tools, and quick shortcuts into a single interactive CMD interface.

---

# Features

- AI-style command interface
- Optional Admin Mode
- System repair and cleanup tools
- Hardware and battery information
- Network diagnostics
- Wi-Fi profile and password viewer
- Windows utility shortcuts
- Task and process management
- Temp cleaner and optimization tools
- Quick folder access
- Browser and website shortcuts
- Shutdown and restart controls

---

# How To Use

1. Copy the source code into a file
2. Save it as:

```bat
ai_terminal.bat
```

3. Double click the file to launch

4. Select:

```txt
1 = Run as Administrator
2 = Run Normally
```

---

# Commands

| Command | Description |
|----------|-------------|
| `menu` | Show all commands |
| `hello` | Greeting message |
| `hi` | Simple hello |
| `who are you` | AI identity |
| `time` | Current system time |
| `date` | Current system date |

---

# System Repair & Optimization

| Command | Description |
|----------|-------------|
| `00` | Generate battery report |
| `scan` | Run system file scan |
| `verify` | Verify system files |
| `dismcleanup` | Cleanup Windows image |
| `chkdsk` | Scan disk for errors |
| `cleanmgrset` | Configure Disk Cleanup |
| `cleanmgrrun` | Run Disk Cleanup |
| `speedup` | Run safe optimization tasks |
| `cleantemp` | Clear temp files |

---

# Hardware Information

| Command | Description |
|----------|-------------|
| `sysinfo` | Full system information |
| `cpu` | CPU model |
| `gpu` | GPU model |
| `ram` | Installed RAM info |
| `disk` | Disk space info |
| `battery` | Battery status |
| `activation` | Windows activation status |
| `dxdiag` | DirectX Diagnostic Tool |

---

# Network Commands

| Command | Description |
|----------|-------------|
| `ip` | Basic IP configuration |
| `ipall` | Full IP configuration |
| `ping` | Ping Google |
| `dns` | Flush DNS cache |
| `netcheck` | Network connectivity test |
| `winsock` | Reset Winsock |
| `wifi` | Show saved Wi-Fi profiles |
| `wifipass` | Show Wi-Fi password/details |

---

# Power Commands

| Command | Description |
|----------|-------------|
| `energy` | Generate energy report |
| `hibernateoff` | Disable hibernation |
| `lastwake` | Last wake source |
| `requests` | Active power requests |
| `shutdown` | Shutdown PC |
| `restart` | Restart PC |
| `cancel` | Cancel shutdown/restart |

---

# Task & Process Management

| Command | Description |
|----------|-------------|
| `task` | Open Task Manager |
| `tasks` | Show running tasks |
| `kill` | Kill process by name |

---

# Windows Utilities

| Command | Description |
|----------|-------------|
| `control` | Open Control Panel |
| `settings` | Open Windows Settings |
| `update` | Open Windows Update |
| `device` | Open Device Manager |
| `diskmgmt` | Open Disk Management |
| `services` | Open Services Manager |
| `logs` | Open Event Viewer |

---

# Quick Access Commands

| Command | Description |
|----------|-------------|
| `temp` | Open temp folder |
| `downloads` | Open Downloads folder |
| `desktop` | Open Desktop folder |
| `recent` | Open Recent files |

---

# Browser & Web Shortcuts

| Command | Description |
|----------|-------------|
| `chrome` | Launch Google Chrome |
| `youtube` | Open YouTube |
| `github` | Open GitHub |

---

# Exit Command

| Command | Description |
|----------|-------------|
| `exit` | Close AI TERMINAL |

---

# Admin Mode

Some commands require Administrator permissions.

If a restricted command is used without Admin Mode, AI TERMINAL will display:

```txt
AI: Admin mode required. Restart in admin mode (choose 1 on launch).
```

---

# Technologies Used

- Windows Batch Scripting
- CMD Commands
- Windows Utilities
- PowerShell / WMIC / DISM / SFC

---

# Notes

- Works only on Windows
- Some commands may not work on older/newer Windows versions
- `wmic` is deprecated on some Windows 11 builds

---

# License

Free to use and modify.
