# VRAIL: Vectorized Reward-based Attribution for Interpretable Learning

Official implementation of **_Robust Molecular Property Prediction via Densifying Scarce Labeled Data_ [[arXiv]](https://arxiv.org/abs/2506.16014) [[slide]](https://drive.google.com/file/d/1th0FzY0WbpATT7SdJMwVqOIlV8qA40Kv/view?usp=sharing)**.

> 🏫 [Jina Kim*](https://jina0218.github.io/), 🏫 [Youjin Jang*](https://github.com/jangyoujin0917), 🏫 [Jeongjin Han*](https://github.com/Jeong-jin-Han)

> *Equal contribution
> 🏫 [KAIST](https://www.kaist.ac.kr/en/)

![Concept Figure](img/cs377.png)

VRAIL is a **bi-level reinforcement learning framework** that improves both **training stability** and **interpretability** by learning feature-based reward shaping functions.  
It provides a way to uncover **semantically meaningful subgoals** (e.g., passenger possession in Taxi-v3) while maintaining policy invariance under potential-based reward transformations.

---

## Key Features
- **Bi-level Optimization**:  
  - **RL Stage**: Learns policies with shaped rewards.  
  - **DL Stage**: Fits an interpretable value function from state features (linear or quadratic).  
- **Interpretability**: Produces **weight vectors** and **feature interactions** that highlight important factors in decision-making.  
- **Training Stability**: More robust convergence compared to vanilla DQN.  
- **Model-Agnostic**: Can be applied to value-based RL methods (DQN, SARSA, Q-learning, etc.).  
- **Generalizable Reward Shaping**: Learned shaping functions can be transferred to other agents.

---

## Method Overview
VRAIL alternates between two stages:

1. **RL Stage**  
   Reward shaping with a potential function:
   \[
   R'(s, a, s') = R(s, a, s') + \gamma \hat{V}(x_{s'}; \theta) - \hat{V}(x_s; \theta)
   \]

   - Uses any value-based RL algorithm (e.g., DQN).  
   - Encourages intermediate progress toward the final goal.  

2. **DL Stage**  
   Learns interpretable value functions:  
   - **Linear VRAIL**:  
     \[
     \hat{V}(x_s; w) = w^\top x_s
     \]  
   - **Quadratic VRAIL**:  
     \[
     \hat{V}(x_s; W) = x_s^\top W x_s
     \]  

   - Attributes importance to features and feature interactions.  

This forms a **closed-loop bi-level optimization** between RL and DL stages.

---

## Experiments
- **Environment**: [Taxi-v3 (Gymnasium)](https://gymnasium.farama.org/)  
- **Baselines**: Compared against vanilla DQN.  
- **Results**:
  - **Linear VRAIL**: Highest robustness (converged in 10/10 seeds).  
  - **Quadratic VRAIL**: Fastest convergence speed.  
  - **Transferability**: Pretrained VRAIL reward functions improve vanilla DQN convergence.  

**Example Findings**:
- Linear VRAIL learns that **"Passenger in Taxi"** is the most important subgoal.  
- Quadratic VRAIL highlights **feature interactions** between location, passenger, and destination.  

---

## Results

| Reward Threshold | DQN | Linear VRAIL | Quadratic VRAIL |
|------------------|-----|--------------|-----------------|
| -10              | 600.00 | 614.17 | **538.17** |
| -5               | 612.17 | 643.17 | **562.83** |
| 0                | 648.17 | 652.50 | **594.33** |
| +5               | 717.67 | 735.83 | **660.17** |

- **Convergence Stability**:  
  - DQN: 8/10 runs  
  - Linear VRAIL: 10/10 runs  
  - Quadratic VRAIL: 9/10 runs  

---

## Team Contributions
- Jina Kim: Linear VRAIL backbone, DQN toy experiments, self-attention trials.

- Youjin Jang: Core idea, visualization, slides & presentations.

- Jeongjin Han: Interpretability analysis, reward transfer experiments, environment variants.

## Citation
@misc{kim2025vrailvectorizedrewardbasedattribution,
      title={VRAIL: Vectorized Reward-based Attribution for Interpretable Learning}, 
      author={Jina Kim and Youjin Jang and Jeongjin Han},
      year={2025},
      eprint={2506.16014},
      archivePrefix={arXiv},
      primaryClass={cs.LG},
      url={https://arxiv.org/abs/2506.16014}, 
}