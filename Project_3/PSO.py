import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Funkcja Ackley'a
def ackley(x, y):
    return -20 * np.exp(-0.2 * np.sqrt(0.5 * (x**2 + y**2))) - np.exp(0.5 * (np.cos(2 * np.pi * x) + np.cos(2 * np.pi * y))) + np.exp(1) + 20

# Funkcja Himmelblau'a
def himmelblau(x, y):
    return (x**2 + y - 11)**2 + (x + y**2 - 7)**2

def draw():
    # Przygotowanie danych do wykresu
    x = np.linspace(-5, 5, 100)
    y = np.linspace(-5, 5, 100)
    X, Y = np.meshgrid(x, y)

    Z_ackley = ackley(X, Y)
    Z_himmelblau = himmelblau(X, Y)

    # Wykres 3D dla funkcji Ackley'a
    fig = plt.figure(figsize=(5, 5))

    ax1 = fig.add_subplot(111, projection='3d')
    ax1.plot_surface(X, Y, Z_ackley, cmap='viridis')
    ax1.set_title('Funkcja Ackley')
    plt.savefig(f'ackley_3d.png', format='png')
    plt.show()

    # Wykres poziomicowy dla funkcji Ackley'a
    fig2 = plt.figure(figsize=(5, 5))
    ax2 = fig2.add_subplot(111)
    contour_ackley = ax2.contour(X, Y, Z_ackley, levels=20, cmap='viridis')
    ax2.set_title('Funkcja Ackley')
    plt.savefig(f'ackley_poz.png', format='png')
    plt.show()

    # Wykres 3D dla funkcji Himmelblau'a
    fig3 = plt.figure(figsize=(5, 5))

    ax3 = fig3.add_subplot(111, projection='3d')
    ax3.plot_surface(X, Y, Z_himmelblau, cmap='viridis')
    ax3.set_title('Funkcja Himmelblau')
    plt.savefig(f'him_3d.png', format='png')
    plt.show()
    # Wykres poziomicowy dla funkcji Himmelblau'a
    fig4 = plt.figure(figsize=(5, 5))
    ax4 = fig4.add_subplot(111)
    contour_himmelblau = ax4.contour(X, Y, Z_himmelblau, levels=20, cmap='viridis')
    ax4.set_title('Funkcja Himmelblau')
    plt.savefig(f'him_poz.png', format='png')
    plt.show()



def pso(objective_function, num_particles=30, max_iterations=100, c1=2.0, c2=2.0, w=0.5, min_bound=-5, max_bound=5):
    dimensions = 2
    particles_position = np.random.uniform(min_bound, max_bound, size=(num_particles, dimensions))
    particles_velocity = np.random.uniform(-1, 1, size=(num_particles, dimensions))
    personal_best_positions = particles_position.copy()
    personal_best_values = np.array([float('inf')] * num_particles)
    global_best_position = np.zeros(dimensions)
    global_best_value = float('inf')

    for iteration in range(max_iterations):
        for i in range(num_particles):
            fitness = objective_function(*particles_position[i])
            if fitness < personal_best_values[i]:
                personal_best_values[i] = fitness
                personal_best_positions[i] = particles_position[i]

            if fitness < global_best_value:
                global_best_value = fitness
                global_best_position = particles_position[i]

        for i in range(num_particles):
            r1, r2 = np.random.rand(), np.random.rand()
            cognitive_component = c1 * r1 * (personal_best_positions[i] - particles_position[i])
            social_component = c2 * r2 * (global_best_position - particles_position[i])
            particles_velocity[i] = w * particles_velocity[i] + cognitive_component + social_component
            particles_position[i] = np.clip(particles_position[i] + particles_velocity[i], min_bound, max_bound)

    return global_best_position, global_best_value



def initialize_wolves(num_wolves, num_dimensions):
    return np.random.uniform(-5, 5, size=(num_wolves, num_dimensions))

def gwo(objective_function, num_wolves=5, num_dimensions=2, max_iterations=100):
    wolves_position = initialize_wolves(num_wolves, num_dimensions)
    alpha, beta, delta = wolves_position[:3]  

    for iteration in range(max_iterations):
        a = 2 - iteration * (2 / max_iterations)  

        for i in range(num_wolves):
            for j in range(num_dimensions):
                A1, A2 = 2 * a * np.random.rand() - a, 2 * a * np.random.rand() - a
                C1, C2 = 2 * np.random.rand(), 2 * np.random.rand()

                D_alpha = np.abs(C1 * alpha[j] - wolves_position[i, j])
                X1 = alpha[j] - A1 * D_alpha

                D_beta = np.abs(C2 * beta[j] - wolves_position[i, j])
                X2 = beta[j] - A2 * D_beta

                D_delta = np.abs(C2 * delta[j] - wolves_position[i, j])
                X3 = delta[j] - A2 * D_delta

                wolves_position[i, j] = (X1 + X2 + X3) / 3

        current_values = [objective_function(*pos) for pos in wolves_position]
        best_wolf = np.argmin(current_values)

        if current_values[best_wolf] < objective_function(*alpha):
            alpha = wolves_position[best_wolf].copy()

        current_values[best_wolf] = float('inf')  
        best_wolf = np.argmin(current_values)

        if current_values[best_wolf] < objective_function(*beta):
            beta = wolves_position[best_wolf].copy()

        current_values[best_wolf] = float('inf')  
        best_wolf = np.argmin(current_values)

        if current_values[best_wolf] < objective_function(*delta):
            delta = wolves_position[best_wolf].copy()

    return alpha, objective_function(*alpha)


ackley_alpha_values = []
himmelblau_alpha_values = []
ackley_best_values = []
himmelblau_best_values = []

for i in range(100):

    ackley_alpha_position, ackley_alpha_value = gwo(ackley)
    ackley_alpha_values.append(ackley_alpha_value)
    if ackley_alpha_value <= min(ackley_alpha_values):
        best_ackley_alpha_position = ackley_alpha_position.copy()

    himmelblau_alpha_position, himmelblau_alpha_value = gwo(himmelblau)
    himmelblau_alpha_values.append(himmelblau_alpha_value)
    if himmelblau_alpha_value <= min(himmelblau_alpha_values):
        best_himmelblau_alpha_position = himmelblau_alpha_position.copy()

    ackley_best_position, ackley_best_value = pso(ackley)
    ackley_best_values.append(ackley_best_value)
    if ackley_best_value <= min(ackley_best_values):
        best_ackley_best_position = ackley_best_position.copy()

    himmelblau_best_position, himmelblau_best_value = pso(himmelblau)
    himmelblau_best_values.append(himmelblau_best_value)
    if himmelblau_best_value <= min(himmelblau_best_values):
        best_himmelblau_best_position = himmelblau_best_position.copy()
    
print('Algorytm PSO')
print(f'Algorytm Najlepsza pozycja dla funkcji Ackley: {best_ackley_best_position}')
print(f'Wartość funkcji Ackley w najlepszej pozycji: {min(ackley_best_values)}')
print(f'Wartość średnia funkcji Ackley : {sum(ackley_best_values)/100}')


print(f'Najlepsza pozycja dla funkcji Himmelblau: {best_himmelblau_best_position}')
print(f'Wartość funkcji Himmelblau w najlepszej pozycji: {min(himmelblau_best_values)}')
print(f'Wartość średnia funkcji Himmelblau : {sum(himmelblau_best_values)/100}')

print('Algorytm GwO')
print(f'Najlepsza pozycja dla funkcji Ackley: {best_ackley_alpha_position}')
print(f'Wartość funkcji Ackley w najlepszej pozycji: {min(ackley_alpha_values)}')
print(f'Wartość średnia funkcji Ackley : {sum(ackley_alpha_values)/100}')


print(f'Najlepsza pozycja dla funkcji Himmelblau: {best_himmelblau_alpha_position}')
print(f'Wartość funkcji Himmelblau w najlepszej pozycji: {min(himmelblau_alpha_values)}')
print(f'Wartość średnia funkcji Himmelblau : {sum(himmelblau_alpha_values)/100}')

# draw()