import math
for x in range(101):
    fx = float(x)
    max_val = 30.0 + 25.0 * math.cos(fx / 5.0)
    nb = int(max_val)
    for _ in range(nb):
        print("x", end="")
    print("\n", end="")