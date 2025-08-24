# VRAIL: Vectorized Reward-based Attribution for Interpretable Learning

**VRAIL** (Vectorized Reward-based Attribution for Interpretable Learning) is a bi-level framework that makes value-based RL both **more stable** and **more interpretable**.  
It learns a **feature-attributed value estimator** and uses it to **shape rewards** via a potential-based transform—revealing meaningful subgoals while helping the agent converge faster.

> TL;DR: Learn an interpretable value function from state features → use it to shape rewards → train your favorite value-based RL (e.g., DQN) on the shaped task.

---

## ✨ Key Features

- **Bi-level training**
  1. Learn an interpretable value estimator \(\hat V(x;\theta)\) from state features.  
  2. Shape rewards: \( R' = R + \gamma \hat V(x';\theta) - \hat V(x;\theta) \).
- **Plug-and-play** with DQN and other value-based algorithms (no environment changes).
- **Interpretable attributions** with **linear**, **quadratic**, or **self-attention** explainers:
  - *Linear*: per-feature importance  
  - *Quadratic*: feature–feature interactions  
  - *Self-Attention (optional)*: structured attributions over feature tokens
- **Ready-to-run examples** (e.g., `Taxi-v3`) with logging, plots, and checkpointing.

---

## 📦 Repository Structure

