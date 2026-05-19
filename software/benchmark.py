import subprocess
import re
import pandas as pd
import matplotlib.pyplot as plt

# Compile Verilog Files

compile_cmd = [
    "iverilog",
    "-o",
    "accel_test",

    "rtl/mac_unit_seq.v",
    "rtl/dot_product_engine.v",
    "rtl/controller_fsm.v",
    "rtl/performance_counter.v",
    "rtl/ai_accelerator_top.v",
    "tb/ai_accelerator_top_tb.v"
]

subprocess.run(compile_cmd)

# Run Simulation

result = subprocess.run(
    ["vvp", "accel_test"],
    capture_output=True,
    text=True
)

output = result.stdout

print(output)

# Extract Cycle Count

cycles = re.findall(r"Cycles=\s*(\d+)", output)

cycles = [int(x) for x in cycles]

# Create DataFrame

df = pd.DataFrame({
    "Run": list(range(len(cycles))),
    "Cycles": cycles
})

print(df)

# Plot Graph

plt.figure(figsize=(8,5))

plt.plot(
    df["Run"],
    df["Cycles"],
    marker='o'
)

plt.xlabel("Simulation Step")
plt.ylabel("Cycle Count")
plt.title("AI Accelerator Performance")

plt.grid(True)

plt.show()