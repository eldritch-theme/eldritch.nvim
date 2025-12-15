# Eldritch Theme for Helix Editor

A dark theme for [Helix editor](https://helix-editor.com/) inspired by Lovecraftian horror, with tones from the dark abyss and an emphasis on green and blue.

## 🎨 Variants

The Eldritch theme comes in three variants:

### 1. **eldritch** (Default)
The standard Eldritch theme with the full color palette featuring vibrant greens, blues, and purples.

**Palette highlights:**
- Background: `#212337`
- Foreground: `#ebfafa`
- Green: `#37f499`
- Cyan: `#04d1f9`
- Magenta: `#a48cf2`
- Yellow: `#f1fc79`

### 2. **eldritch-dark**
A darker variant with reduced brightness for extended coding sessions in low-light environments.

**Palette highlights:**
- Background: `#171928`
- Foreground: `#d8e6e6`
- Green: `#2dcc82`
- Cyan: `#0396b3`
- Magenta: `#8b75d9`

### 3. **eldritch-minimal**
A minimal color palette variant that uses fewer colors for a cleaner, less distracting look.

**Features:**
- Limited color palette focusing on essentials
- Uses grayscale (`#e0e0e0`) for many syntax elements
- Retains core colors: green, cyan, magenta, and red for important elements

## 📦 Installation

### Step 1: Locate your Helix themes directory

- **Linux/macOS**: `~/.config/helix/themes/`
- **Windows**: `%AppData%\helix\themes\`

Create the directory if it doesn't exist:

```bash
# Linux/macOS
mkdir -p ~/.config/helix/themes/

# Windows (PowerShell)
New-Item -ItemType Directory -Force -Path "$env:AppData\helix\themes"
```

### Step 2: Copy theme files

Copy the theme files to your Helix themes directory:

```bash
# Linux/macOS - Copy all variants
cp eldritch.toml ~/.config/helix/themes/
cp eldritch-dark.toml ~/.config/helix/themes/
cp eldritch-minimal.toml ~/.config/helix/themes/

# Or copy just one variant
cp eldritch.toml ~/.config/helix/themes/
```

**Windows (PowerShell):**
```powershell
Copy-Item eldritch.toml "$env:AppData\helix\themes\"
Copy-Item eldritch-dark.toml "$env:AppData\helix\themes\"
Copy-Item eldritch-minimal.toml "$env:AppData\helix\themes\"
```

### Step 3: Set the theme

Edit your Helix config file:
- **Linux/macOS**: `~/.config/helix/config.toml`
- **Windows**: `%AppData%\helix\config.toml`

Add or modify the theme setting:

```toml
theme = "eldritch"
```

Or choose one of the variants:

```toml
theme = "eldritch-dark"
# or
theme = "eldritch-minimal"
```

### Step 4: Reload or restart Helix

The theme will be applied when you restart Helix, or you can reload the config:
- Press `:` to enter command mode
- Type `config-reload` and press Enter
- Type `:theme eldritch` to switch themes without restarting

## 🎯 Features

The Eldritch theme for Helix includes comprehensive support for:

### Syntax Highlighting
- **Keywords**: Control flow, functions, storage modifiers
- **Types**: Built-in and custom types with italic styling
- **Functions**: Methods, constructors, and macros
- **Variables**: Parameters, members, and built-in variables
- **Strings**: Regular strings, regex, and escape sequences
- **Constants**: Numbers, booleans, and built-in constants
- **Comments**: Italic styling for better readability

### UI Elements
- **Cursor**: Multiple cursor states (normal, insert, select)
- **Line numbers**: Highlighted for current line
- **Status line**: Color-coded for different modes (normal, insert, select)
- **Popups & Menus**: Consistent with the overall theme
- **Diagnostics**: Clear error, warning, info, and hint indicators
- **Git integration**: Added, modified, and removed indicators

### Markup Support
- **Markdown**: Headers, lists, links, code blocks, emphasis
- **HTML/XML**: Tags, attributes, and delimiters
- **Links**: Styled with underlines and distinct colors

### LSP & Diagnostics
- **Error**: Undercurl styling with red color
- **Warning**: Undercurl styling with orange color
- **Info**: Undercurl styling with yellow color
- **Hint**: Undercurl styling with dark green color
- **Inlay hints**: Subtle background highlighting

## 🎨 Color Palette Reference

### Default Palette (eldritch.toml)

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#212337` | Main editor background |
| Background Dark | `#171928` | Statusline, popups |
| Foreground | `#ebfafa` | Main text color |
| Green | `#37f499` | Keywords, success states |
| Cyan | `#04d1f9` | Types, functions |
| Magenta | `#a48cf2` | Constructors, special |
| Pink | `#f265b5` | Functions, constants |
| Purple | `#a48cf2` | Parameters, properties |
| Yellow | `#f1fc79` | Strings, warnings |
| Orange | `#f7c67f` | Numbers, emphasis |
| Red | `#f16c75` | Errors, deletion |
| Comment | `#7081d0` | Comments, subtle text |

### Darker Palette (eldritch-dark.toml)

Same color assignments but with darker, more muted tones. Background is `#171928` for better contrast in low-light environments.

### Minimal Palette (eldritch-minimal.toml)

Reduced to essential colors with most secondary colors replaced by grayscale (`#e0e0e0`):
- Green, Cyan, Magenta, Red remain vibrant
- Functions, parameters, and other elements use grayscale
- Maintains readability while reducing visual complexity

## 🔄 Switching Themes

You can switch between theme variants without restarting Helix:

1. Press `:` to enter command mode
2. Type one of the following:
   - `:theme eldritch` - Default variant
   - `:theme eldritch-dark` - Darker variant
   - `:theme eldritch-minimal` - Minimal variant
3. Press Enter

## 🐛 Troubleshooting

### Theme not appearing in Helix

1. Verify the theme files are in the correct directory
2. Check that the file permissions allow reading
3. Ensure the TOML syntax is valid (should be if copied correctly)
4. Try restarting Helix completely

### Colors look different than expected

- Ensure your terminal supports true color (24-bit color)
- Check your terminal emulator's color settings
- Some terminal emulators may require additional configuration for true color support

### Testing your terminal for true color support:

```bash
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
```

## 🤝 Related Projects

- [Eldritch for Neovim](https://github.com/eldritch-theme/eldritch.nvim) - The original Neovim theme
- [Eldritch Theme Organization](https://github.com/eldritch-theme) - Official theme repository

## 📝 License

This theme follows the same license as the main Eldritch theme project.

## 💡 Tips

- Use `eldritch-dark` for late-night coding sessions
- Use `eldritch-minimal` when working with complex codebases where you want less visual distraction
- The themes work great with Helix's built-in LSP features and diagnostics
- Try pairing with a font that supports ligatures for the best experience

---

Enjoy coding in the dark abyss! 🌌
