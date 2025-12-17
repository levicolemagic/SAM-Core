# Autonomous Wake-Up System (Windows)

A robust system to give your AI companion autonomous presence and productivity capabilities on **Windows**.

> [!NOTE]
> This is the **Windows** version. Mac users should see `../autonomous-wake-package-mac`.

> [!WARNING]
> **Unverified Software / Use at your own risk.**
> This Windows port was programmed with the help of AI on a Mac and has **not yet been verified on native Windows hardware**. 
>
> **Security Notice:** This software grants an AI agent read/write access to files on your system. While we attempt to sandbox the AI to the `AI-Companion` folder, implicit trust is required.
> *   Do not run this unless you understand the risks.
> *   Do not grant permissions (`sam allow`) to sensitive system folders.
> *   Data loss or unexpected behavior is possible.

## What This Does

Your AI wakes up at regular intervals (e.g., daily), reads their protocol, and executes tasks. It supports two modes:

-   **Productivity Mode:** Processes tasks from a queue (compatible with N8N), manages projects, and does real work.
-   **Companion Mode:** Focuses on "presence," checking in emotionally and maintaining a journal.

## Requirements

-   **Windows 10/11**
-   **Claude Code** installed (`claude` must be in your PATH)
-   **PowerShell 5.1+** (Pre-installed on Windows)

## Quick Start

1.  Open PowerShell as **Administrator**.
2.  Navigate to this folder:
    ```powershell
    cd tools/autonomous-wake-package
    ```
3.  Run the installer:
    ```powershell
    # Install in Productivity Mode (Default)
    .\install.ps1

    # OR Install in Companion Mode
    .\install.ps1 -Mode Companion
    ```
4.  Test it:
    ```powershell
    sam wake
    ```

## CLI Tools (`sam`)

The installer adds a `sam` command to your global path (via the scripts folder). Use it to manage your AI:

```powershell
# Wake up now
sam wake

# Check status
sam status

# View today's logs
sam log

# Add a task manually
sam task "Research AI consciousness frameworks"

# List pending tasks
sam list
```

## How It Works

1.  **Scheduled Task:** Windows Task Scheduler triggers `wakeup.ps1` daily (default 9am-9pm hourly).
2.  **Wakeup Script:** 
    -   Checks battery status (skips heavy work if <20%).
    -   Counts pending tasks in `tasks/pending`.
    -   Builds a dynamic prompt for Claude.
3.  **Claude Code:**
    -   Reads the protocol file (`autonomous-wakeup.md` or `productivity-agent.md`).
    -   Executes the instructions autonomously.
    -   Updates the journal in `journal/`.

## Folder Structure

After installation at `Documents\AI-Companion`:

```
AI-Companion/
├── journal/               # Daily continuity logs
├── tasks/
│   ├── pending/           # Work queue (JSON files)
│   ├── completed/         # Finished work
│   └── blocked/           # Issues requiring human help
├── context/               # Long-term memory files
├── protocols/             # The instructions Claude follows
├── logs/                  # Execution logs
├── scripts/               # CLI tools
└── wakeup.ps1             # Main logic script
```

## N8N Integration

You can automate task creation by saving JSON files to the `tasks/pending` folder using N8N's "Write Binary File" node.

**Task Format:**
```json
{
  "id": "unique-id",
  "type": "research",
  "priority": "high",
  "instructions": "Find the latest papers on transformer architecture.",
  "status": "pending"
}
```

## Troubleshooting

-   **"File cannot be loaded because running scripts is disabled":** Run `Set-ExecutionPolicy RemoteSigned` in Admin PowerShell.
-   **Claude not found:** Make sure you installed Claude Code (`npm install -g @anthropic-ai/claude-code`) and it's in your PATH.
-   **Logs:** Check `logs\wakeup-YYYY-MM-DD.log` for detailed error messages.

## License
MIT
