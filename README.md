<p align="center">
<img src="https://raw.github.com/eldritch-theme/eldritch/master/assets/logo/logo.png" width=100>
</p>
<p>
Eldritch is a community-driven dark theme inspired by Lovecraftian horror. With tones from the dark abyss and an emphasis on green and blue, it caters to those who appreciate the darker side of life.
</p>

Main Theme repo can be found [here](https://github.com/eldritch-theme/eldritch)

### Showcase

<figure>
<img src="screenshot.png" alt="Screenshot"/><br/>
<figcaption>Transparent disabled (default)</figcaption>
</figure>
<figure>
<img src="screenshot-transparent.png" alt="Screenshot"/><br/>
<figcaption>Transparent enabled</figcaption>
</figure>

### Installation
Using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
  "eldritch-theme/eldritch-nvim",
  opts = {},
  priority = 1000,
  config = function(opts)
    local eldritch = require("eldritch")
    eldritch.setup(opts)
    vim.cmd("colorscheme eldritch")

    -- If using lualine
    require("lualine").setup({
      options = {
        theme = "eldritch"
      }
    })
  end,
}
```

### Configuration
The configuration must be run before `colorscheme` command to take effect. The following are the default options, no need to pass in unless you want to change individual options:
```lua
eldritch.setup({
  colors = {
    bg = "#212337",
    fg = "#ebfafa",
    selection = "#323449",
    comment = "#7081d0",
    red = "#f16c75",
    orange = "#f7c67f",
    yellow = "#f1fc79",
    green = "#37f499",
    purple = "#a48cf2",
    cyan = "#04d1f9",
    pink = "#f265b5",
    bright_red = "#f9515d",
    bright_green = "#37f499",
    bright_yellow = "#e9f941",
    bright_blue = "#9071f4",
    bright_magenta = "#f265b5",
    bright_cyan = "#66e4fd",
    bright_white = "#FFFFFF",
    menu = "#212337",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
    none = "none",
  },
   -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = false, -- set to true for transparent background including lualine
  lualine_bg_color = "#323449", -- Default, sets to none if using transparent_bg
  italic_comment = true,
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {}
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
})
```

#### Extras

##### [dashboard.nvim](https://github.com/nvimdev/dashboard-nvim) banner
<img src="dashboard.png" alt="Dashboard"/><br/>

If you want the header for dashboard.nvim inside your dashboard lua config:
```lua
    local logo = [[
⠀⠀⠀⠀⠀⠀⠀⣠⡤⠶⡄⠀⠀⠀⠀⠀⠀⠀⢠⠶⣦⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣿⡟⠀⠈⣀⣾⣝⣯⣿⣛⣷⣦⡀⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⡇⠀⢼⣿⣽⣿⢻⣿⣻⣿⣟⣷⡄⠀⢸⣿⣿⣾⣄⠀⠀⠀
⠀⠀⣞⣿⣿⣿⣿⣷⣤⣸⣟⣿⣿⣻⣯⣿⣿⣿⣿⣀⣴⣿⣿⣿⣿⣯⣆⠀⠀
⠀⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⡆⠀
⢠⣟⣯⣿⣿⣿⣷⢿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣟⠿⣿⣿⣿⣿⡷⣾⠀
⢸⣯⣿⣿⡏⠙⡇⣾⣟⣿⡿⢿⣿⣿⣿⣿⣿⢿⣟⡿⣿⠀⡟⠉⢹⣿⣿⢿⡄
⢸⣯⡿⢿⠀⠀⠱⢈⣿⢿⣿⡿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣀⠃⠀⢸⡿⣿⣿⡇
⢸⣿⣇⠈⢃⣴⠟⠛⢉⣸⣇⣹⣿⣿⠚⡿⣿⣉⣿⠃⠈⠙⢻⡄⠎⠀⣿⡷⠃
⠈⡇⣿⠀⠀⠻⣤⠠⣿⠉⢻⡟⢷⣝⣷⠉⣿⢿⡻⣃⢀⢤⢀⡏⠀⢠⡏⡼⠀
⠀⠘⠘⡅⠀⣔⠚⢀⣉⣻⡾⢡⡾⣻⣧⡾⢃⣈⣳⢧⡘⠤⠞⠁⠀⡼⠁⠀⠀
⠀⠀⠀⠸⡀⠀⢠⡎⣝⠉⢰⠾⠿⢯⡘⢧⡧⠄⠀⡄⢻⠀⠀⠀⢰⠁⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠈⢧⣈⠀⠘⢦⠀⣀⠇⣼⠃⠰⣄⣡⠞⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢤⠼⠁⠀⠀⠳⣤⡼⠀⠀⠀⠀⠀⠀
    ]]
    logo = string.rep("\n", 2) .. logo
    local opts = {
      config = {
        header = vim.split(logo, "\n"),
    ...
    }
```


#### Special Thanks
 -  To [Mofiqul](https://github.com/Mofiqul/dracula.nvim)
    - I originally used this theme along with many Dracula themes across my systems. Thanks to his repo I was able to create this NeoVim theme. I cloned his repo and replaced the colors with mine as well as some minor tweaks.
