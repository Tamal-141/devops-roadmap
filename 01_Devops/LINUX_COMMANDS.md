# Linux Commands — Tamal's Reference Sheet
> Created: April 2026 | Update this as you learn new commands

---

## How to open Linux (WSL)
- Search "Ubuntu" in Windows Start menu, OR
- Open PowerShell and type `wsl`

---

## Navigation Commands

| Command | What it does | Example |
|---------|-------------|---------|
| `pwd` | Print Working Directory — shows where you are right now | `pwd` → `/mnt/c/TTB` |
| `ls` | List — shows files and folders in current location | `ls` |
| `ls -l` | List with details — shows size, date, permissions | `ls -l` |
| `ls -a` | List all — shows hidden files too (files starting with `.`) | `ls -a` |
| `ls tests/` | List files inside a specific folder | `ls tests/` |
| `cd foldername` | Change Directory — go inside a folder | `cd tests` |
| `cd ..` | Go back one level (parent folder) | `cd ..` |
| `cd ~` | Go to your home folder | `cd ~` → `/home/tamal141` |
| `cd /` | Go to root (top of everything) | `cd /` |
| `cd /mnt/c/TTB` | Go to a specific full path | `cd /mnt/c/TTB` |

---

## Understanding the Prompt

```
tamal141@DESKTOP-RTP3P1F:/mnt/c/TTB$
```

| Part | Meaning |
|------|---------|
| `tamal141` | Your Linux username |
| `DESKTOP-RTP3P1F` | Your computer name |
| `/mnt/c/TTB` | Where you currently are |
| `$` | You are a normal user (ready for commands) |

---

## Understanding Linux Paths

| Windows Path | Linux Path in WSL |
|-------------|-------------------|
| `C:\` | `/mnt/c/` |
| `C:\TTB` | `/mnt/c/TTB` |
| `C:\Users\ATRN087` | `/mnt/c/Users/ATRN087` |
| `C:\Users\ATRN087\Documents` | `/mnt/c/Users/ATRN087/Documents` |
| `D:\` | `/mnt/d/` |

---

## Special Symbols

| Symbol | Meaning |
|--------|---------|
| `/` | Root — top of the entire Linux file system |
| `~` | Home folder — your personal Linux folder (`/home/tamal141`) |
| `.` | Current directory (where you are right now) |
| `..` | Parent directory (one level up) |

---

## Common Mistakes to Avoid

| Wrong | Correct | Why |
|-------|---------|-----|
| `ls.` | `ls .` | Space is required between command and argument |
| `cd /mnt/c/TTB~` | `cd /mnt/c/TTB` or `cd ~` | `~` must be alone, not attached to a path |
| `/mnt/c/TTB` | `cd /mnt/c/TTB` | Always write `cd` before a path to navigate |
| `pwd /some/path` | `pwd` | pwd takes no arguments, just type it alone |

---

## Linux Folder Structure (what you saw with `ls /`)

| Folder | What it contains |
|--------|-----------------|
| `/home` | Personal folders for each user (your files live here) |
| `/mnt` | Mounted drives — your Windows C: drive is at `/mnt/c` |
| `/etc` | System configuration files |
| `/usr` | Installed programs |
| `/tmp` | Temporary files |
| `/root` | Home folder for the admin (root) user |
| `/dev` | Hardware devices |

---

## WSL Fix (in case WSL breaks again)

If you see `REGDB_E_CLASSNOTREG` error:
1. Open PowerShell as Administrator
2. Run `wsl --unregister Ubuntu`
3. Press any key when it asks to repair
4. Wait for update to finish
5. Run `wsl --install -d Ubuntu`

---

## File & Folder Operations

### Creating

| Command | What it does | Example |
|---------|-------------|---------|
| `mkdir foldername` | Creates a new empty folder | `mkdir practice` |
| `touch filename.txt` | Creates a new empty file | `touch notes.txt` |

---

### Deleting

| Command | What it does | Example |
|---------|-------------|---------|
| `rm filename.txt` | Deletes a file permanently | `rm notes.txt` |
| `rm -r foldername` | Deletes a folder AND everything inside it | `rm -r practice` |

> ⚠️ **Warning:** Linux has no Recycle Bin. `rm` deletes forever. Be careful.

---

### Copying

| Command | What it does | Example |
|---------|-------------|---------|
| `cp source.txt copy.txt` | Copies a file — original stays, new copy is created | `cp original.txt backup.txt` |

```
Before:  original.txt
After:   original.txt   backup.txt   ← both exist
```

---

### Moving & Renaming

| Command | What it does | Example |
|---------|-------------|---------|
| `mv old.txt new.txt` | Renames a file — old name is gone | `mv draft.txt final.txt` |
| `mv file.txt folder/` | Moves file into a folder — keeps same name | `mv notes.txt backup/` |
| `mv file.txt folder/newname.txt` | Moves file into a folder AND renames it | `mv notes.txt backup/old-notes.txt` |

```
# Rename example:
Before:  draft.txt
After:   final.txt       ← draft.txt is gone

# Move example:
Before:  notes.txt   backup/
After:   backup/notes.txt   ← file is now inside the folder
```

> 💡 **Trick to remember:** If the destination ends with `/` → just move. If it ends with a filename → move AND rename.

---

### Common Mistakes

| Wrong | Correct | Why |
|-------|---------|-----|
| `rm foldername` | `rm -r foldername` | `rm` alone can't delete folders, needs `-r` |
| `mv file.txt folder/newname` | `mv file.txt folder/newname.txt` | Don't forget the file extension |
| `mv file.txt folder` | `mv file.txt folder/` | Without `/`, Linux may rename instead of move |

---

## Reading & Writing Files

| Command | What it does | Example |
|---------|-------------|---------|
| `echo "Hi"` | Print text to screen | `echo "Hello I am Tamal"` |
| `echo "Hi" > file.txt` | Save text to file (overwrites existing content) | `echo "Hi" > myfile.txt` |
| `echo "Hi" >> file.txt` | Append text — adds below existing content, nothing deleted | `echo "Hi" >> myfile.txt` |
| `cat file.txt` | Read and print file contents to screen | `cat myfile.txt` |
| `nano file.txt` | Open file in terminal text editor (like Notepad but in Linux) | `nano myfile.txt` |
| `grep "word" file.txt` | Find and show only lines containing that word | `grep "Tamal" myfile.txt` |
| `grep "two words" file.txt` | Search for multiple words — must use quotes | `grep "I am" myfile.txt` |

### nano shortcuts (inside nano editor)
| Shortcut | What it does |
|----------|-------------|
| `Ctrl+O` | Save the file |
| `Ctrl+X` | Exit nano |

### > vs >> (important difference)
| Symbol | What it does |
|--------|-------------|
| `>` | Overwrite — replaces everything in the file |
| `>>` | Append — adds to end, keeps existing content |

### Real world use of grep
```bash
grep "ERROR" server.log     ← find all errors in log file
grep "404" access.log       ← find all failed requests
grep "tamal" users.log      ← find specific user activity
```

---

*Add new commands below as you learn them:*

---