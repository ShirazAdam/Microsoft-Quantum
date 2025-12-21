namespace Knapsack {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;

    @EntryPoint()
    operation SolveKnapsack() : Unit {
        Message("Knapsack Problem using Quantum Optimisation");
        
        // Define knapsack problem
        let numItems = 5;
        let weights = [2, 3, 4, 5, 9];
        let values = [3, 4, 8, 8, 10];
        let capacity = 12;
        
        Message($"Number of items: {numItems}");
        Message($"Capacity: {capacity}");
        Message("Items (weight, value):");
        for i in 0..numItems-1 {
            Message($"  Item {i}: ({weights[i]}, {values[i]})");
        }
        
        // Run quantum-inspired optimisation
        let (bestSelection, totalValue, totalWeight) = FindOptimalKnapsack(
            numItems, weights, values, capacity, 100
        );
        
        Message($"\nBest selection: {bestSelection}");
        Message($"Total value: {totalValue}");
        Message($"Total weight: {totalWeight}");
        Message("Selected items:");
        for i in 0..numItems-1 {
            if bestSelection[i] == 1 {
                Message($"  Item {i}: weight={weights[i]}, value={values[i]}");
            }
        }
    }
    
    operation FindOptimalKnapsack(
        numItems : Int, 
        weights : Int[], 
        values : Int[], 
        capacity : Int, 
        iterations : Int
    ) : (Int[], Int, Int) {
        mutable bestSelection = [0, size = numItems];
        mutable bestValue = 0;
        mutable bestWeight = 0;
        
        for iter in 1..iterations {
            let selection = GenerateQuantumSelection(numItems);
            let (totalValue, totalWeight) = EvaluateKnapsack(selection, weights, values);
            
            // Only accept if within capacity and better value
            if totalWeight <= capacity and totalValue > bestValue {
                set bestSelection = selection;
                set bestValue = totalValue;
                set bestWeight = totalWeight;
            }
        }
        
        return (bestSelection, bestValue, bestWeight);
    }
    
    operation GenerateQuantumSelection(numItems : Int) : Int[] {
        // Use quantum randomness to generate item selections
        use qubits = Qubit[numItems];
        mutable selection = [0, size = numItems];
        
        // Create superposition with bias toward selection
        for i in 0..numItems-1 {
            H(qubits[i]);
            // Apply controlled rotation to bias selection probability
            Ry(PI()/3.0, qubits[i]);
        }
        
        // Measure to get selection
        for i in 0..numItems-1 {
            let result = M(qubits[i]);
            set selection w/= i <- (result == One ? 1 | 0);
        }
        
        ResetAll(qubits);
        return selection;
    }
    
    function EvaluateKnapsack(selection : Int[], weights : Int[], values : Int[]) : (Int, Int) {
        mutable totalValue = 0;
        mutable totalWeight = 0;
        
        for i in 0..Length(selection)-1 {
            if selection[i] == 1 {
                set totalValue += values[i];
                set totalWeight += weights[i];
            }
        }
        
        return (totalValue, totalWeight);
    }
}