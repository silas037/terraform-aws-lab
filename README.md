# ☁️ AWS Local Infrastructure Lab

A professional DevOps sandbox for practicing **Infrastructure as Code (IaC)** using **Terraform** and **LocalStack**. This project allows for full AWS service emulation on a local machine without incurring any cloud costs.

---

## 🏗️ Architecture
This lab uses Docker to host a local cloud environment that Terraform communicates with directly.

```mermaid
## 🏗️ Architecture
This lab uses Docker to host a local cloud environment that Terraform communicates with directly.

```mermaid
graph LR
    subgraph "Local Machine (Intel Mac)"
        A["Terraform Code"] -->|"API Calls"| B("LocalStack Container")
        B --> C[("S3 Bucket")]
        B --> D["IAM Roles"]
    end
    A -.->|"Version Control"| E["GitHub Repository"]


---

## ✅ Testing & Verification
To verify the deployment, the following commands were used:

### 1. S3 Storage Check
```bash
awslocal s3 ls
# Output: my-secure-freelance-bucket
```

### 2. Lambda Execution
Invoking the Python function locally:
```bash
awslocal lambda invoke --function-name my-freelance-lambda output.json && cat output.json
# Output: {"message": "Hello from your local DevOps Lab!"}
```

### 3. Environment Monitoring
Monitoring resources via **Docker Desktop** (as shown in project screenshots).
