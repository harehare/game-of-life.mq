#!/bin/bash

# Game of Life Runner Script
# Usage: ./run.sh [pattern] [generations]
# Default: pattern=simple_glider, generations=50

# Set default values
PATTERN=${1:-simple_glider}
GENERATIONS=${2:-50}

# Show available patterns if -h or --help is passed
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ./run.sh [pattern] [generations]"
    echo "Default: pattern=simple_glider, generations=50"
    echo ""
    echo "Available patterns:"
    echo "  die_hard, eden1971, gosper_gun, pulsar, pentadecathlon"
    echo "  acorn, spaceship, galaxy, simple_glider, block, beehive"
    echo "  blinker, toad, beacon, r_pentomino, lwss, loaf, boat"
    echo "  clock, bi_clock, mwss, hwss, penta_decathlon"
    echo "  queen_bee_shuttle, schick_engine, copperhead, weekender"
    exit 0
fi

echo "Running Game of Life with pattern: $PATTERN, generations: $GENERATIONS" >&2
echo "" >&2

# Run the mq interpreter with query string
mq "include \"game_of_life\" | run_game_of_life($PATTERN, $GENERATIONS) | \"\""
