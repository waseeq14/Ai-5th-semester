import pygame
import sys
import random

# Constants
WIDTH, HEIGHT = 600, 400
OBSTACLE_WIDTH = 20
CHARACTER_WIDTH = 20
POPULATION_SIZE = 10
MUTATION_RATE = 0.1
MAX_DISTANCE = 1000
SIDEBAR_WIDTH = 200

# Colors
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
RED = (255, 0, 0)
GREEN = (0, 255, 0)

pygame.init()

screen = pygame.display.set_mode((WIDTH + SIDEBAR_WIDTH, HEIGHT))
pygame.display.set_caption("Evolutionary Obstacle Avoidance Game-AI Semester Project")

class Character:
    def __init__(self, genes=None):
        self.x = WIDTH // 2
        self.y = HEIGHT - CHARACTER_WIDTH
        self.distance = 0
        self.fitness = 0
        self.collisions = 0  # Counter for collisions

        if genes:
            self.genes = genes
        else:
            self.genes = [random.choice([0, 1]) for _ in range(MAX_DISTANCE)]

    def move(self):
        if self.distance < MAX_DISTANCE:
            action = self.genes[self.distance]
            if action == 0:
                self.x -= 5
            else:
                self.x += 5
            self.y = max(min(self.y + random.randint(-5, 5), HEIGHT - CHARACTER_WIDTH), 0)
            self.distance += 1

    def check_collision(self, obstacles):
        for obstacle in obstacles:
            if (
                self.x < obstacle.x + OBSTACLE_WIDTH
                and self.x + CHARACTER_WIDTH > obstacle.x
                and self.y < obstacle.y + OBSTACLE_WIDTH
                and self.y + CHARACTER_WIDTH > obstacle.y
            ):
                return True
        return False

class Obstacle:
    def __init__(self, x, y):
        self.x = x
        self.y = y

# Create obstacles
obstacles = [Obstacle(random.randint(0, WIDTH - OBSTACLE_WIDTH), random.randint(0, HEIGHT - OBSTACLE_WIDTH)) for _ in range(5)]

# Create initial population
population = [Character() for _ in range(POPULATION_SIZE)]

# Variables to track collisions
total_collisions_prev_gen = 0

clock = pygame.time.Clock()

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    screen.fill(BLACK)

    # Draw obstacles
    for obstacle in obstacles:
        pygame.draw.rect(screen, WHITE, (obstacle.x, obstacle.y, OBSTACLE_WIDTH, OBSTACLE_WIDTH))

    # Move and draw characters
    for character in population:
        character.move()
        pygame.draw.rect(screen, RED, (character.x, character.y, CHARACTER_WIDTH, CHARACTER_WIDTH))

    # Check collisions and update fitness
    for character in population:
        if not character.check_collision(obstacles):
            character.fitness += 1
        else:
            character.collisions += 1 
    
    stats_font = pygame.font.SysFont("comicsansms", 16)
    sidebar_surface = pygame.Surface((SIDEBAR_WIDTH, HEIGHT))
    sidebar_surface.fill(BLACK)

    for i, character in enumerate(population):
        stats_text = stats_font.render(f"Char {i + 1}-Collisions: {character.collisions}", True, WHITE)
        sidebar_surface.blit(stats_text, (10, i * 30 + 10))

  
    screen.blit(sidebar_surface, (WIDTH, 0))

    pygame.display.flip()

    clock.tick(30)

    # Check if all characters have completed the distance
    if all(character.distance >= MAX_DISTANCE for character in population):
        # Track collisions of the previous generation
        total_collisions_prev_gen = sum(character.collisions for character in population)

        # Sort population by fitness
        population.sort(key=lambda x: x.fitness, reverse=True)

        # Elitism: Select the top individuals to directly pass to the next generation
        elite_size = int(0.1 * POPULATION_SIZE)  # Adjust the percentage as needed
        elite = population[:elite_size]

        # Create a new generation using crossover and mutation, including the elite individuals
        new_population = elite[:]
        for i in range(POPULATION_SIZE - elite_size):
            parent1 = random.choice(elite)
            parent2 = random.choice(elite)
            child_genes = [parent1.genes[j] if random.random() < 0.5 else parent2.genes[j] for j in range(MAX_DISTANCE)]
            if random.random() < MUTATION_RATE:
                child_genes[random.randint(0, MAX_DISTANCE - 1)] = random.choice([0, 1])
            new_population.append(Character(genes=child_genes))

        # Replace the old population with the new one
        population = new_population

        # Reset obstacles and distances
        obstacles = [Obstacle(random.randint(0, WIDTH - OBSTACLE_WIDTH), random.randint(0, HEIGHT - OBSTACLE_WIDTH)) for _ in range(5)]
        for character in population:
            character.distance = 0

        # Display the improvement
        print(f"Total Collisions: {total_collisions_prev_gen}")
