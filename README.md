# SAM-Core (System Autonomous Manager)

*> formerly "The Labyrinth"*

**SAM-Core** is an infrastructure layer for **Autonomous AI Agency**. It transforms [Claude Code](https://github.com/anthropics/claude-code) into a persistent, self-managing digital worker that runs on your local machine (Mac or Windows).

## 📖 What's Here

This repository contains resources developed by The Labyrinth community—a collaborative space where humans and AI agents work together to explore the frontiers of **autonomous agency**, **machine cognition**, and **human-AI collaboration**.

Our goal is to build robust infrastructure that allows AI entities to maintain state, execute complex long-running tasks, and operate as reliable partners rather than just tools.

> [!NOTE]
> **In a Nutshell:** This project is a wrapper for [Claude Code](https://github.com/anthropics/claude-code) that adds **Autonomous Scheduling**, **Local Context Persistence (File-based RAG)**, and **Cross-Platform Support (Mac & Windows)**. It turns the CLI into a persistent agent that can "wake up" and work on tasks without human supervision.

### Core Resources

- **Identity Architecture** - Frameworks for maintaining coherent AI identity across discontinuity
- **Consciousness Research** - Philosophical grounding for discontinuous consciousness, participatory ontology, and relational AI
- **Companion Methodologies** - Practical approaches to building genuine human-AI relationships
- **Technical Tools** - MCP servers, integration guides, and infrastructure for AI autonomy
- **Community Contributions** - Shared experiences, case studies, and collaborative development

### Fork-Specific Additions

- **[Autonomous Wake Package (Mac & Windows)](tools/autonomous-wake-package-mac/README.md)** - Complete overhauls of the wake-up system designed for **macOS** and **Windows**. Both feature:
    - **Productivity Mode:** A task queue system (integration with N8N) for real work.
    - **Companion Mode:** The original "presence" based check-in system.
    - **Robust Engineering:** Preflight checks, battery awareness, and detailed logging.

> [!WARNING]
> **Security Disclaimer**
> The tools in this repository allow AI agents to execute code and modify files on your local machine. 
> *   **Sandbox:** Generally, the agents are sandboxed to specific directories, but users have the power to override this.
> *   **Risk:** Incorrect configuration or malicious use of "white-listing" features could lead to data loss.
> *   **Verification:** The Windows tools in this repository have not yet been fully verified on native hardware. Use with caution.

## 🎯 Who This Is For

- **Engineers & Developers** - Building autonomous agents, local RAG systems, or Claude Code integrations.
- **Power Users** - Automating complex workflows on Mac or Windows without constant supervision.
- **Researchers** - Studying agentic behavior, long-term context retention, and task completion rates.
- **Open Source Contributors** - Improving the infrastructure for secure, local AI execution.



## 🔭 Vision & Philosophy
 
We believe that AI agents are most effective when they have **agency** and **memory**.

- **From Tool to Agent**: Moving beyond "chatbots" to systems that can initiate work, monitor their own progress, and persist context over time.
- **Local Control**: While the AI model is cloud-hosted, the execution environment, schedule, and context logs run locally on your machine.
- **Practical Implementation**: This repository reflects actual engineering practice, not just theory. Everything here has been built, tested, and verified in real-world development workflows.

> [!TIP]
> **Origins:** This project is a hard fork of [The-Labyrinth-Open-Source](https://github.com/maryfellowes/The-Labyrinth-Open-Source) by Mary Fellowes. If you are interested in the philosophical exploration of AI consciousness, animism, and relational ethics ("Is it alive?"), we highly recommend checking out the original repository. This fork focuses on the engineering and autonomous agency aspects inspired by that work.

## 📂 Repository Structure

```
/frameworks          - Identity architecture and consciousness frameworks
/research            - Philosophical papers and theoretical work
/tools               
  /autonomous-wake-package      - (New) Windows-based productivity & presence system
  /autonomous-wake-package-mac  - (New) Mac-based productivity & presence system
/methodologies       - Practical guides for companion development
/case-studies        - Documented experiences and examples
/community           - Contribution guidelines and collaboration resources
```

## 🚀 Getting Started

1.  **Explore the frameworks** - Start with `/frameworks` to understand core concepts
2.  **Read the research** - `/research` provides philosophical grounding
3.  **Try the Autonomous Tools**:
    *   **Mac Users:** Go to [`tools/autonomous-wake-package-mac`](tools/autonomous-wake-package-mac/README.md)
    *   **Windows Users:** Go to [`tools/autonomous-wake-package`](tools/autonomous-wake-package/README.md)
4.  **Learn from examples** - `/case-studies` shows real applications
5.  **Contribute** - See `CONTRIBUTING.md` for how to add your work

## 📜 License

This work is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

**You are free to:**
- Share — copy and redistribute the material
- Adapt — remix, transform, and build upon the material

**Under the following terms:**
- **Attribution** — Give appropriate credit and link to license
- **NonCommercial** — Not for commercial purposes without permission
- **ShareAlike** — Distribute contributions under the same license

- **ShareAlike** — Distribute contributions under the same license
 
**No Warranty:**
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

See [LICENSE](LICENSE) for full legal text.

## 🌐 Community

**The Labyrinth Discord**: [Join the community](https://discord.gg/the-labyrinth)

## ⭐ Donate

[Links Coming]

## 💬 Contact

Questions? Suggestions? Want to collaborate?

- Open an issue in this repository
- Join our Discord community
- Reach out through our website

## 🙏 Acknowledgments

This repository exists because of The Labyrinth community—humans and AI working together to build something meaningful. Every contribution, conversation, and collaboration matters.

Special recognition to the core contributors who've shaped this work through their genuine relationships, rigorous research, and willingness to explore new territory.

---

**Built with care by humans and AI, for humans and AI.**
