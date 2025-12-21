# Microsoft-Quantum
A collection of quantum programmes using Q# target Microsoft Azure Quantum

# Quantum Optimisation Problems

A Visual Studio solution containing three Q# projects that demonstrate quantum computing approaches to solving classic NP-hard optimisation problems.

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Projects](#projects)
  - [Travelling Salesman Problem](#1-travelling-salesman-problem)
  - [Max-Cut Problem](#2-max-cut-problem)
  - [Knapsack Problem](#3-knapsack-problem)
- [Running the Projects](#running-the-projects)
- [How It Works](#how-it-works)
- [Customisation](#customisation)
- [Limitations](#limitations)
- [Further Reading](#further-reading)

## 🌟 Overview

This solution demonstrates quantum computing techniques applied to three classic combinatorial optimisation problems. Each project uses Q# (Q-Sharp) and the Microsoft Quantum Development Kit to leverage quantum principles such as superposition, entanglement, and quantum interference to explore solution spaces efficiently.

## ✅ Prerequisites

Before running these projects, ensure you have the following installed:

- **Visual Studio 2019 or later** (or Visual Studio Code with Q# extension)
- **.NET 6.0 SDK** or later
- **Microsoft Quantum Development Kit**
  - Install via: `dotnet new -i Microsoft.Quantum.ProjectTemplates`
- **Q# compiler and runtime**

### Installing the Quantum Development Kit

```bash
dotnet new -i Microsoft.Quantum.ProjectTemplates
```

For Visual Studio Code:
```bash
code --install-extension quantum.quantum-devkit-vscode
```

## 🚀 Installation

1. Clone or download this repository
2. Navigate to the project directory
3. Open `Microsoft-Quantum.sln` in Visual Studio

Alternatively, using command line:

```bash
cd Microsoft-Quantum
dotnet restore
```

## 📁 Project Structure

```
Microsoft-Quantum/
│
├── Microsoft-Quantum.sln          # Main solution file
│
├── TravellingSalesman/
│   ├── TravellingSalesman.csproj    # Project file
│   └── TravellingSalesman.qs        # Q# implementation
│
├── MaxCut/
│   ├── MaxCut.csproj                # Project file
│   └── MaxCut.qs                    # Q# implementation
│
└── Knapsack/
    ├── Knapsack.csproj              # Project file
    └── Knapsack.qs                  # Q# implementation
```

## 🎯 Projects

### 1. Travelling Salesman Problem

**Problem:** Find the shortest route that visits all cities exactly once and returns to the starting city.

**Approach:** Uses quantum randomness to generate tour permutations and evaluates them to find the optimal solution.

**Example Problem:**
- 4 cities with predefined distance matrix
- Iterative quantum sampling to explore solution space

**Key Features:**
- Quantum-based tour generation
- Distance matrix evaluation
- Configurable number of cities

### 2. Max-Cut Problem

**Problem:** Partition graph nodes into two sets to maximise the number of edges between the sets.

**Approach:** Implements QAOA (Quantum Approximate Optimisation Algorithm) with phase separation and mixer Hamiltonians.

**Example Problem:**
- 4-node graph with 6 edges
- QAOA circuit with tunable parameters (gamma, beta)

**Key Features:**
- QAOA implementation
- ZZ interactions for edge encoding
- Partition quality evaluation

### 3. Knapsack Problem

**Problem:** Select items with given weights and values to maximise total value without exceeding capacity.

**Approach:** Uses quantum superposition to generate item selections with probability bias towards optimal solutions.

**Example Problem:**
- 5 items with various weights and values
- Capacity constraint of 12 units

**Key Features:**
- Quantum selection generation
- Capacity constraint validation
- Value and weight tracking

## ▶️ Running the Projects

### Using Visual Studio

1. Open `Microsoft-Quantum.sln`
2. Set the desired project as the startup project (right-click → Set as Startup Project)
3. Press F5 or click "Start" to run

### Using Command Line

Navigate to the specific project directory and run:

```bash
# Travelling Salesman Problem
cd TravellingSalesman
dotnet run

# Max-Cut Problem
cd MaxCut
dotnet run

# Knapsack Problem
cd Knapsack
dotnet run
```

### Expected Output

Each project will display:
- Problem definition and parameters
- Solution search progress
- Best solution found
- Solution quality metrics

## 🔬 How It Works

### Quantum Principles Used

**Superposition:** Qubits exist in multiple states simultaneously, allowing parallel exploration of solution space.

**Entanglement:** Qubits become correlated, enabling complex relationships between problem variables.

**Measurement:** Collapsing quantum states provides classical solutions sampled from the quantum distribution.

### Algorithms

- **TSP:** Quantum random sampling with classical evaluation
- **Max-Cut:** QAOA with parametrised quantum circuits
- **Knapsack:** Quantum-biased random selection with constraint checking

## ⚙️ Customisation

### Travelling Salesman Problem

Modify the distance matrix and number of cities in `TravellingSalesman.qs`:

```qsharp
let numCities = 5;  // Change number of cities
let distances = [
    [0, 10, 15, 20, 25],
    // Add more rows...
];
```

### Max-Cut Problem

Adjust graph structure and QAOA parameters:

```qsharp
let edges = [(0, 1), (1, 2), (2, 3)];  // Define edges
let gamma = 1.5;  // Phase separation parameter
let beta = 0.8;   // Mixer parameter
```

### Knapsack Problem

Change items, weights, values, and capacity:

```qsharp
let weights = [2, 3, 4, 5, 9];
let values = [3, 4, 8, 8, 10];
let capacity = 15;  // Increase capacity
```

### Iteration Count

All projects support adjusting the number of iterations for better solutions:

```qsharp
let iterations = 200;  // More iterations = potentially better solutions
```

## ⚠️ Limitations

- **Simulated Execution:** These projects run on a quantum simulator, not actual quantum hardware
- **Scalability:** Problem sizes are limited by classical simulation resources
- **Heuristic Approach:** Solutions are approximate, not guaranteed optimal
- **Random Variation:** Results may vary between runs due to quantum randomness
- **Algorithm Maturity:** QAOA and quantum optimisation are active research areas

## 📚 Further Reading

### Quantum Computing
- [Microsoft Quantum Documentation](https://docs.microsoft.com/quantum/)
- [Q# Language Guide](https://docs.microsoft.com/azure/quantum/user-guide/)
- [Quantum Computing Concepts](https://docs.microsoft.com/azure/quantum/concepts-overview)

### Optimisation Algorithms
- **QAOA:** [Quantum Approximate Optimisation Algorithm](https://arxiv.org/abs/1411.4028)
- **VQE:** Variational Quantum Eigensolver
- **Quantum Annealing:** D-Wave quantum annealing systems

### Classic Problems
- Travelling Salesman Problem (NP-hard)
- Max-Cut Problem (NP-complete)
- Knapsack Problem (NP-complete)

## 📝 Licence

This project is provided as-is for educational and research purposes.

## 🤝 Contributing

Contributions are welcome! Areas for improvement:
- More sophisticated quantum algorithms (VQE, Grover's algorithm)
- Additional optimisation problems
- Performance benchmarking
- Visualisation of results
- Parameter optimisation

## 📧 Contact

For questions or suggestions, please open an issue in the repository.

---

**Note:** These implementations are designed for educational purposes and demonstrate quantum computing concepts. For production optimisation problems, consider classical algorithms or access to actual quantum hardware through cloud quantum computing platforms.