# Master Learning Prompt — Tamal's DevOps Journey
> Paste this ENTIRE file at the start of any new chat (Claude, Gemini, Antigravity).
> Updated after every session. Single source of truth across all devices.

---

## WHO I AM

My name is Tamal. I work at Atrina Technologies (placed at 1Finance client site) as a Junior QA Engineer.
I am transitioning to **DevOps / Cloud Engineering**.

**Current skill levels:**
- Playwright & API Testing: 6/10 (background skill — NOT current focus)
- Linux: 5/10
- Docker: 5/10
- AWS: 3/10 (basic EC2, SSH, .pem experience)
- GitHub Actions CI/CD: 3/10 (pipeline running, deploy pending)
- Kubernetes, Terraform: 0/10

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
| 3 | GitHub Actions CI/CD | In Progress — CI working, CD (deploy) pending |
| 4 | AWS | Basics done — EC2 deploy pending |
| 5 | Kubernetes | Not Started |
| 6 | Terraform | Not Started |

**Main project:** Automate `automationexercise.com` with Playwright → Dockerize → CI/CD pipeline → Deploy on AWS
**Do NOT use Atrina/1Finance client projects for DevOps portfolio** — keep personal projects separate. Use bank automation project or automationexercise.com instead.

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
- `docker stop`, `docker container prune`, `docker rmi`, `docker rmi -f`
- Wrote Dockerfile: FROM, WORKDIR, COPY, RUN, EXPOSE, CMD
- `docker build -t name .` — build image
- `docker run -p 5000:5000 --name backend --env-file .env myapp`
- `docker login`, `docker tag`, `docker push` — pushed to Docker Hub
- Difference: `RUN` = during build, `CMD` = when container starts
- `ARG` = build-time variable, `ENV` = runtime variable
- `host.docker.internal` = talk to host machine from inside container (not localhost)
- Docker Compose: services, ports, env_file, args, depends_on, restart
- `docker-compose up --build -d`, `docker-compose down`, `docker-compose logs`
- Run docker-compose from the folder where docker-compose.yml lives
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

### Session: 30 April 2026 (Office — Claude)
- Reviewed `free -h` output — understood all columns: total, used, free, available, buff/cache, swap
- Key insight: always look at `available`, not `free` — available includes reclaimable cache
- `df -h` — disk space per partition, `du -sh *` — find which folder is eating space
- `uptime` — how long server has been running
- Rule: when a partition hits 95%, use `du -sh *` to investigate before deleting anything
- Swap = fake RAM on disk, slow — want it at 0 used always
- **File permissions:** `-rwxr-xr-x` breakdown — owner/group/others, r=4 w=2 x=1
- 755 = rwxr-xr-x (scripts), 644 = rw-r--r-- (normal files)
- `chmod 755 filename`, `chmod 644 filename` — practiced both, verified with `ls -l`
- Owner vs execute permission are different things — you can own a file without running it
- **Processes:** `ps aux` — columns: USER, PID, %CPU, %MEM, COMMAND
- PID = unique ID for every running process
- Left off: what to check before killing a high CPU process (answer next session)

### Session: 11 May 2026 (Office — Claude)
- LinkedIn profile fully updated:
  - Title changed: Trainee QA Engineer → Junior QA Engineer (promoted April 2026)
  - Headline: `Junior QA Engineer | Playwright | API Testing | Azure DevOps | Upskilling in DevOps & Cloud`
  - About section updated — honest, no fake CI/CD pipeline claim
  - Skills added: Playwright, Git, GitHub, Linux, Docker, AWS, Azure DevOps Services, Performance Testing, k6
  - Removed from headline: Selenium (college only, not current work)
  - Top skills pinned: Playwright, API Testing, Azure DevOps Services
  - Old "seeking new role" post — to be deleted
  - Promotion post — to be created
- Git sync workflow confirmed: office push → home pull via `03_MASTER_LEARNING_PROMPT.md`
- Devops folder structure confirmed: `C:\Devops\devops-roadmap` → remote: `Tamal-141/devops-roadmap`

### Session: 19 May 2026 (Office — Claude)
- Cloned `playwright-banking-automation` into `C:\Devops\` 
- Cloned `cypress-realworld-app` (MERN banking app) into `C:\Devops\`
- Wrote Dockerfile for Playwright project — fixed base image from `node:18` to `mcr.microsoft.com/playwright:v1.58.2-noble`
- `docker build -t banking-automation .` — image built successfully
- `docker run banking-automation` still fails — banking app not running inside container
- Installed Node 20, yarn, project dependencies in WSL
- Tests run from PowerShell: **4 passed, 1 failed, 2 skipped**
- Failed test: `auth.spec.js` — E2E Signup → Onboard → Logout → Re-Login
- Transaction flow tests not yet written
- Key learning: run tests from PowerShell (not WSL) — Ubuntu 26.04 not supported by Playwright yet
- Next: fix failing auth test + write transaction flow + Docker Compose

### Session: 13 May 2026 (Office — Claude)
- Processes: `kill PID` = graceful (Terminated), `kill -9 PID` = force (Killed)
- `$!` = special variable holding PID of last background process
- `top` = live process monitor (refreshes every 2s), `ps aux` = snapshot
- Docker WSL integration enabled on new laptop, personal Docker Hub account created
- `docker run hello-world` — confirmed Docker working
- Project plan: Dockerize Playwright bank automation tests (not the MERN app itself)
- Left off: finding Playwright bank project location on home machine

### Session: 12 May 2026 (Home — Claude)
- Linux basics revision: mkdir, touch, mv (rename), rm, ls, cat, grep, >, >>
- Key rules: no spaces around `=` in variables, `$()` for command output, `./` to run scripts
- **Variables:** `name="Tamal"`, read with `$name`
- **if/else:** `[ $age -gt 18 ]`, operators: -gt, -lt, -eq, -ne, closes with `fi`
- **for loop:** `for i in 1 2 3; do ... done` — no commas, spaces only
- **Command substitution:** `result=$(command)` — stores command output in variable
- Built `health-check.sh` — date, who, df -h, free -h using $() syntax
- Script location: `~/scripts/health-check.sh`

### Session: 2 June 2026 (Office + Home — Claude)
- Docker Compose deep dive — ran MERN Task Manager (YouTuber Sangam project)
- Fixed YouTuber's hardcoded AWS IP in docker-compose.yml → changed to localhost
- Understood ARG vs ENV, host.docker.internal, why VITE rebuilds needed
- Git workflow mastered: clone → branch → commit → push → PR flow
- Renamed master → main branch, deleted old master, set default branch on GitHub
- GitHub Actions CI pipeline WORKING — build-and-lint job passes in 35s ✅
- Understood CI vs CD, manual QA vs automated testing in pipeline
- Wrote Dockerfile and docker-compose.yml from scratch (practice scenarios)
- GitHub Actions yml structure understood — on/jobs/steps/uses/run
- PAT token needs `workflow` scope to push `.github/workflows/` files
- YouTube course repo pushed: `Tamal-141/Mern-TaskWebsite-Project` on GitHub

### Session: 4 June 2026 (Office — Claude)
- SSH into EC2 successfully using .pem file ✅
- Docker already installed on EC2 ✅
- Cloned MERN project on EC2 ✅
- Created MongoDB Atlas free cluster ✅
- Connected backend to MongoDB Atlas (password: Tamal1234) ✅
- Deployed MERN app on EC2 with docker-compose ✅
- App live at `http://44.200.68.71:5173` ✅
- Opened ports 5173 and 5000 in EC2 Security Group ✅
- GitHub Actions 4 secrets added: EC2_HOST, EC2_USER, EC2_KEY, EC2_APP_DIR
- CI job passes ✅ — CD (auto-deploy) job failing due to SSH key format issue in GitHub secrets
- EC2 IP changes every restart — need to update EC2_HOST secret and docker-compose.yml each time
- Key learning: VITE_API_URL must be EC2 public IP (not localhost) when deployed on EC2

---

## WHERE WE STOPPED

**Last session:** 4 June 2026 (Office — Claude)

**Next session start here:**
1. Fix GitHub Actions CD deploy job — SSH key issue
   - Try: assign Elastic IP to EC2 (static IP — never changes on restart)
   - Then update EC2_HOST secret once and never again
2. Once CD works → full pipeline complete: push code → auto deploy to AWS
3. Then move to next phase — Kubernetes basics

**EC2 details:**
- Instance ID: `i-0c34aa25d9f2819e5`
- Current IP: `44.200.68.71` (changes on restart — fix with Elastic IP)
- .pem file: `C:\Users\dey42\.ssh\devops-key.pem`
- App folder on EC2: `/home/ubuntu/Mern-TaskWebsite-Project/devops-youtube-course-2025`
- MongoDB Atlas password: `Tamal1234`
- MongoDB Atlas user: `dey420476_db_user`

**YouTube course repo:** `C:\Devops-Youtube-Sangam\` → GitHub: `Tamal-141/Mern-TaskWebsite-Project`
**App live at:** `http://44.200.68.71:5173` (update IP after each EC2 restart)

**LinkedIn pending actions:**
- Delete old "seeking new role" post
- Create promotion announcement post

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

*Last updated: 2 June 2026 — end of session*
