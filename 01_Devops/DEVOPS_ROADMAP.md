# Tamal's DevOps Roadmap — Real Projects for LinkedIn
> Created: April 2026 | Goal: Job-ready DevOps/Cloud Engineer in 6 months

---

## The Big Idea

You already have Playwright test automation skills. Instead of learning DevOps in isolation,
we will BUILD on what you already know.

**The story you will tell on LinkedIn:**
> "I built a complete DevOps pipeline for a test automation project —
> from writing tests, to containerizing them, to running them automatically
> on every code push, to deploying on AWS cloud."

That is a real DevOps engineer's job. And you will have done it.

---

## Your Starting Point (honest assessment)

| Skill | Level |
|-------|-------|
| Playwright / API Testing | 6/10 |
| Linux | 6/10 |
| Docker | 2/10 (just started) |
| CI/CD | 0/10 |
| AWS | 3/10 (basic EC2 experience) |
| Overall DevOps | 3/10 |

---

## The Roadmap — 6 Phases

---

### PHASE 1 — Linux + Shell Scripting
**Status: In Progress**
**Time: 2-3 weeks**

**What a real DevOps engineer does:**
- Writes shell scripts to automate repetitive tasks
- Manages files, processes, and servers from command line
- No GUI — everything in terminal

**Your project:**
Write a shell script that:
1. Goes to your project folder
2. Runs your Playwright tests
3. Saves the result to a log file with today's date
4. Prints PASS or FAIL at the end

**LinkedIn post:**
> "Automated my test execution using a Bash shell script on Linux"

**Commands you will learn:**
- `nano` / `vim` — text editors in terminal
- `chmod` — give permission to run a script
- `bash script.sh` — run a script
- `if/else` in bash
- `echo`, `date`, `>>` (append to file)

---

### PHASE 2 — Docker
**Status: Just Started**
**Time: 3-4 weeks**

**What a real DevOps engineer does:**
- Packages applications into Docker containers
- Writes Dockerfiles
- Pushes images to Docker Hub
- Runs containers in production

**Your project:**
Dockerize your Playwright test suite:
1. Write a `Dockerfile` for your test project
2. Build the image: `docker build -t tamal-tests .`
3. Run tests inside a container: `docker run tamal-tests`
4. Push your image to Docker Hub
5. Anyone can now run your tests with one command

**LinkedIn post:**
> "Containerized Playwright test automation using Docker —
> tests now run in any environment with a single command"

**Commands you will learn:**
- `Dockerfile` — write your own image
- `docker build` — build image
- `docker push` — push to Docker Hub
- `docker-compose` — run multiple containers
- Volumes, port mapping, environment variables

---

### PHASE 3 — Git Advanced + CI/CD with GitHub Actions
**Time: 3 weeks**

**What a real DevOps engineer does:**
- Sets up pipelines that automatically test, build, and deploy code
- Every time a developer pushes code → pipeline runs automatically
- If tests fail → code is blocked from merging

**Your project:**
Set up a GitHub Actions pipeline for your test project:
1. Push code to GitHub
2. Pipeline automatically starts
3. Runs your Playwright tests inside Docker
4. Sends you a notification — PASS or FAIL
5. Shows green/red badge on your GitHub repo

**LinkedIn post:**
> "Built a CI/CD pipeline using GitHub Actions —
> Playwright tests run automatically on every code push"

**What you will learn:**
- `.github/workflows/` — where pipeline files live
- `yaml` file syntax
- Triggers: on push, on pull request
- Jobs and steps
- Secrets (storing API keys safely)

---

### PHASE 4 — AWS (Cloud)
**Time: 4-5 weeks**

**What a real DevOps engineer does:**
- Launches and manages cloud servers
- Sets up networking, security, storage
- Deploys applications on cloud

**Your project:**
Deploy your Dockerized tests on AWS:
1. Launch EC2 instance (you already did this!)
2. Install Docker on it
3. Pull your Docker image from Docker Hub
4. Run your tests on cloud server
5. Schedule tests to run every night using cron

**LinkedIn post:**
> "Deployed Dockerized test automation on AWS EC2 —
> tests run automatically every night on cloud infrastructure"

**What you will learn:**
- EC2 (you already know basics)
- S3 — store test reports/screenshots
- IAM — users and permissions
- Security Groups — firewall rules
- SSH — connect to server (you already know this!)
- Cron jobs on Linux

---

### PHASE 5 — Kubernetes Basics
**Time: 4 weeks**

**What a real DevOps engineer does:**
- Manages hundreds of containers across multiple servers
- Auto-scales when traffic increases
- Restarts containers that crash automatically

**Your project:**
Deploy your test containers on Kubernetes:
1. Set up a local Kubernetes cluster (minikube)
2. Deploy your test container as a Kubernetes pod
3. Scale it to run 3 tests in parallel
4. See Kubernetes auto-restart a crashed container

**LinkedIn post:**
> "Orchestrated test containers using Kubernetes —
> parallel test execution with auto-scaling"

---

### PHASE 6 — Terraform (Infrastructure as Code)
**Time: 3 weeks**

**What a real DevOps engineer does:**
- Instead of manually clicking on AWS to create servers —
  writes code that creates the entire infrastructure automatically
- "Infrastructure as Code" = your cloud setup is version controlled

**Your project:**
Write Terraform code that:
1. Creates an EC2 instance on AWS automatically
2. Installs Docker on it
3. Runs your test container
4. All with one command: `terraform apply`

**LinkedIn post:**
> "Provisioned AWS infrastructure using Terraform —
> entire cloud setup managed as code"

---

## Your LinkedIn Profile After 6 Months

**Projects section will show:**

1. Playwright Test Automation (already have this)
2. Shell script automation for test execution
3. Dockerized test suite — runs anywhere
4. CI/CD pipeline with GitHub Actions
5. AWS deployment with scheduled test runs
6. Kubernetes parallel test execution
7. Terraform infrastructure as code

**That is a complete DevOps portfolio.** Not tutorials. Real projects.

---

## Rules for This Journey

1. **Every concept → one real project.** No learning without building.
2. **LinkedIn post after every phase.** Document your progress publicly.
3. **Daily practice minimum 1 hour.** Even on bad days — at least run a command.
4. **Ask WHY before HOW.** Understanding beats memorizing.
5. **Mistakes are progress.** Every error you fix = real experience.

---

## Where You Are Now

```
Phase 1: Linux     ████████░░  In Progress
Phase 2: Docker    ██░░░░░░░░  Just Started
Phase 3: CI/CD     ░░░░░░░░░░  Not Started
Phase 4: AWS       ██░░░░░░░░  Some basics
Phase 5: K8s       ░░░░░░░░░░  Not Started
Phase 6: Terraform ░░░░░░░░░░  Not Started
```

**Next step:** Finish Phase 1 project (shell script) + continue Phase 2 (Dockerfile)

---

*This roadmap was built around YOUR existing skills and YOUR goal of switching to DevOps/Cloud.*
*Every project connects to your Playwright automation work.*
