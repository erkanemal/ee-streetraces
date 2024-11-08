# Dynamic Street Racing System

A standalone FiveM resource that adds a dynamic street racing system to your server. Players can create custom race tracks on the fly and organize races with buy-ins and rewards.

## Features

- **Custom Race Creation**
  - Create races anywhere in the city
  - Place custom checkpoints
  - Set custom buy-in amounts
  - Multiple race types support

- **Race Management**
  - Join existing races
  - Automatic race start when enough players join
  - Real-time checkpoint tracking
  - Anti-cheat measures
  - Prize pool system

## Installation

1. Download the resource
2. Place it in your server's `resources` folder
3. Add `ensure dynamic_streetracing` to your `server.cfg`
4. Configure `config.lua` to your preferences
5. Restart your server

## Usage

### Player Commands
- `/createrace [buy-in]` - Start creating a new race
- `/joinrace` - Join an available race
- `/races` - Show active races
- `/cancelrace` - Cancel your created race
- `/leaverace` - Leave the current race

### Race Creation Process
1. Use `/createrace [buy-in]` to start
2. Press `E` to place checkpoints
3. Press `ENTER` to finish race creation
4. Wait for players to join

## Configuration

Edit `config.lua` to customize:
- Minimum/maximum buy-in amounts
- Required players to start
- Checkpoint sizes
- Race types
- Reward multipliers
- Anti-cheat settings

## File Structure