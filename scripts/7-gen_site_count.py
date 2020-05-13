import matplotlib.pyplot as plt

fig, axes = plt.subplots(1,2)

axes[0].pie([73, 201-73])
axes[0].set_title("R1")
axes[0].legend(['binded', 'unbinded'])
axes[1].pie([64, 201-64])
axes[1].set_title("R2")
axes[1].legend(['binded', 'unbinded'])

fig.savefig("/mnt/d/projects/BME1063_HW3/report/images/site_counts.svg")