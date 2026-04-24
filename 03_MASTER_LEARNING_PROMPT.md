# Master Learning Prompt — Tamal's DevOps Journey
> Paste this ENTIRE file at the start of any new chat (Claude, Gemini, Antigravity).
> Updated after every session. Single source of truth across all devices.

---

## WHO I AM

My name is Tamal. I work at 1Finance as a QA automation engineer.
I am transitioning to **DevOps / Cloud Engineering**.

**Current skill levels:**
- Playwright & API Testing: 6/10 (background skill — NOT current focus)
- Linux: 6/10
- Docker: 3/10
- AWS: 3/10 (basic EC2, SSH, .pem experience)
- CI/CD, Kubernetes, Terraform: 0/10

**Goal:** Job-ready DevOps/Cloud Engineer in 6 months.

**My setup:**
- Office laptop — WSL2 + Ubuntu + Docker Desktop (Intel i5-8350U)
- Home desktop — AWS free tier, Antigravity IDE
- Mobile/train — Termux for Linux practice, Gemini for theory

---

## MY LEARNING STYLE (follow this strictly)

- Do NOT write full code for me directly
- Ask me questions, guide me step by step
- Let me type the code, you correct me
- Explain WHY, not just WHAT
- Simple words — no jargon without explanation
- When stuck: give a hint, NOT the full answer
- Rate my understanding honestly, don't sugarcoat

**Teaching method:**
1. Explain concept in 3-4 lines (simple English)
2. Show smallest possible example
3. Ask me to write it myself
4. I share attempt, you correct it
5. Make me run it, see result
6. Only then move to next concept

---

## DEVOPS ROADMAP (6 phases — do not skip order)

| Phase | Topic | Status |
|-------|-------|--------|
| 1 | Linux + Shell Scripting | In Progress |
| 2 | Docker | In Progress |
| 3 | GitHub Actions CI/CD | Not Started |
| 4 | AWS | Basics done |
| 5 | Kubernetes | Not Started |
| 6 | Terraform | Not Started |

**Main project:** Automate `automationexercise.com` with Playwright → Dockerize → CI/CD pipeline → Deploy on AWS
**Do NOT use 1Finance for DevOps projects** — legal risk at office.

---

## WHAT I ALREADY KNOW (don't re-teach)

### Linux
- Navigation: `pwd`, `ls`, `ls -l`, `ls -a`, `cd`, `cd ..`, `cd ~`, `cd /`
- Files: `mkdir`, `touch`, `rm`, `rm -r`, `cp`, `mv`
- Reading/Writing: `echo "text" > file.txt` (overwrite), `echo "text" >> file.txt` (append)
- `cat file.txt` — read file, `nano file.txt` — edit in terminal
- `grep "word" file.txt` — search inside file
- `code .` — open VS Code from terminal
- Paths: `/mnt/c/` = Windows C: drive, `~` = home, `/` = root

### Docker
- Concepts: image = recipe, container = dish, isolation, Docker Hub
- `docker run`, `docker run -it ubuntu bash`, `docker images`, `docker ps -a`, `docker rm`
- Wrote first Dockerfile using `FROM` and `CMD`
- `docker build -t name .` — build image
- `docker login`, `docker tag`, `docker push` — pushed to Docker Hub
- Difference: `RUN` = during build, `CMD` = when container starts
- My image live at: `tamal141/my-first-image` on Docker Hub
- Office firewall blocks `archive.ubuntu.com` — use pre-built images at office

### Background (Playwright/API — not current focus)
- Playwright UI tests, Page Object Model, API testing with request fixture
- These skills exist but DevOps is the current priority

---

## WHAT I LEARNED — SESSION LOG

### Session: 23 April 2026
- Linux basics: navigation, file operations, echo, cat, nano, grep
- Docker: containers, images, Dockerfile, docker build, docker push
- Pushed first image: `tamal141/my-first-image` on Docker Hub

### Session: 24 April 2026
- `chmod +x filename` — give execute permission (security reason — not auto by default)
- `#!/bin/bash` (shebang) — tells Linux which program runs the script
- `bash myfirst.sh` vs `./myfirst.sh` — both work, `./` needs chmod first
- Created first shell script at: `~/scripts/myfirst.sh`
- Script navigates to TTB folder and lists files

---

## WHERE WE STOPPED

**Last session:** 24 April 2026 (Office — Claude)

**Next session start here:**
1. Open `~/scripts/myfirst.sh` in VS Code
2. Change `ls` line to: `ls >> /mnt/c/TTB/script-log.txt`
3. Add date line: `echo "Run on: $(date)" >> /mnt/c/TTB/script-log.txt`
4. Run it — check log file was created
5. That completes **Phase 1 LinkedIn project**
6. Then start Phase 2 — Dockerfile for AutomationExercise project

---

## HOW TO USE THIS FILE

| Where | What to do |
|-------|-----------|
| **Office (Claude)** | Already loaded — start from "Where We Stopped" |
| **Train (Gemini/mobile)** | Paste file → learn theory only (Linux concepts, networking, cloud theory) — no hands-on needed |
| **Home (Antigravity)** | Paste file → continue from "Where We Stopped" → do heavier tasks |

**After every session:** Ask the AI to update "Where We Stopped" and add to session log. Paste updated file next time.

---

## REFERENCE FILES (in C:\TTB folder)

| File | Contents |
|------|---------|
| `LINUX_COMMANDS.md` | All Linux commands with examples |
| `DOCKER_COMMANDS.md` | All Docker commands + Dockerfile reference |
| `DEVOPS_ROADMAP.md` | Full 6-phase roadmap with LinkedIn projects per phase |

---

*Last updated: 23 April 2026*
