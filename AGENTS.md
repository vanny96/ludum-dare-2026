# Godot Ludum Dare 2026 Project - Agent Guidelines

## Project Overview
This is a Godot game project starter kit designed for Ludum Dare game jams. It includes utilities for debugging, scene management, and deployment to itch.io.

## Technology Stack
- **Engine**: Godot 4.x (GL Compatibility renderer)
- **Language**: GDScript
- **Deployment**: GitHub Actions for automatic publishing to itch.io
- **Addons**: Dialogue Manager plugin

## Folder Structure
```
├── .github/ 
│   └── workflows/ 
│       └── deploy-game.yaml          # CI/CD for itch.io deployment  
├── .godot/                           # Godot editor configuration  
├── addons/
│   └── dialogue_manager/             # Dialogue system addon  
├── src/
│   ├── screens/                      # Game screens/scenes  
│   │   ├── main_menu/
│   │   │   ├── MainMenu.tscn
│   │   │   └── main_menu.gd
│   │   └── test/
│   │       ├── test.tscn
│   │       └── test.gd
│   ├── ui/                           # UI components  
│   │   ├── pause_menu/
│   │   │   ├── PauseMenu.tscn
│   │   │   └── pause_menu.gd
│   │   └── settings/
│   │       ├── Settings.tscn
│   │       └── settings.gd
│   └── utils/                        # Utility scripts  
│       ├── globals/                  # Global state management
│       │   ├── Globals.tscn
│       │   └── globals.gd
│       ├── scene_manager/            # Scene transition management
│       │   ├── SceneManager.tscn
│       │   └── scene_manager.gd
│       └── debugger/                 # Debugging utilities
│           ├── Debugger.tscn
│           └── debugger.gd  
├── project.godot                     # Project configuration
├── export_presets.cfg                # Export presets
├── deploy_metadata.yaml              # Deployment metadata for itch.io
├── README.md                         # Project documentation
├── icon.svg                          # Project icon
└── .gitignore                        # Git ignore rules
```

## Key Features
1. **Debugger Utility**: Reload scenes and display debug information
2. **Scene Manager**: Handles scene transitions and loading
3. **Global State Management**: Centralized data storage
4. **Main Menu Template**: Pre-built main menu UI
5. **Pause Menu**: Built-in pause functionality
6. **Settings Menu**: Configurable game settings
7. **Dialogue Manager Addon**: Advanced dialogue system
8. **Automatic Deployment**: GitHub Actions for itch.io publishing

## Conventions
- GDScript files use snake_case naming
- Scenes use PascalCase naming
- Autoloads defined in project.godot: Globals, SceneManager, Debugger
- Input actions defined in project.godot for movement and controls
- Rendering set to GL Compatibility for broader device support

## Deployment
- Push tags matching `release-*` to trigger automatic deployment to itch.io
- Requires BUTLER_API_KEY secret configured in GitHub repository
- Uses butler for uploads to itch.io