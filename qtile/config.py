# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal
from libqtile import hook, qtile
import os
import subprocess


home = os.path.expanduser('~')


@hook.subscribe.client_managed
def show_window(window):
    """Makes the window to appear on screen even if it goes 
    automatically to a different workspace"""
    window.group.cmd_toscreen()

@hook.subscribe.startup_once
def autostart():
    subprocess.call([home + '/.config/qtile/autostart.sh'])

black = "#000000"
white = "#FFFFFF"
red = "#FF0000"
green = "00FF00"
blue = "0000FF"
yellow = "#FFFF00"
middle_gray = "#888888"
light_red_berry = "#dd7e6b"

mod = "mod4" # Super Key
alt = "mod1"
terminal = "alacritty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="WIN-Move focus to left"),
    Key([mod], "Left", lazy.layout.left(), desc="WIN-Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="WIN-Move focus to right"),
    Key([mod], "Right", lazy.layout.right(), desc="WIN-Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="WIN-Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="WIN-Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="WIN-Move window focus to other window"),
    
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="WIN-Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="WIN-Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="WIN-Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="WIN-Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="WIN-Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="WIN-Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="WIN-Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="WIN-Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="WIN-Reset all window sizes"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="WIN-Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="WIN-Kill focused window"),
    Key([alt], "F4", lazy.window.kill(), desc="WIN-Kill focused window"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="WIN-Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='WIN-toggle fullscreen'
    ),

    Key([mod], "Return", lazy.spawn(terminal), desc="COM-Launch terminal"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="COM-Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="COM-Shutdown Qtile"),
    Key([mod, "control"], "x", lazy.spawn("shutdown now"), desc="COM-Shutdown PC"),    
    Key([mod], "r", lazy.spawncmd(), desc="COM-Spawn a command using a prompt widget"),

    # My Keys
    Key([mod], 't', lazy.spawn('rofi -show run'), desc = 'COM-rofi -show run'),
    Key([mod], 'd', lazy.spawn('rofi -show drun'), desc = 'COM-rofi -show drun'),
    Key([mod], 's', lazy.spawn('rofi -show window'), desc = 'COM-rofi -show window'),
    Key([mod], 'e', lazy.spawn('geany'), desc = 'COM-open Geany'),
    Key([mod], 'b', lazy.spawn('firefox'), desc = 'COM-open Browser'),
    Key([mod], 'n', lazy.spawn('pcmanfm'), desc = 'COM-open File Manager'),
    Key([mod], 'k', lazy.spawn('bash '+home+'/scripts/keys.sh'), desc = 'COM-show key bindings'),
    Key([mod], 'F1', lazy.spawn('bash '+home+'/scripts/keys.sh'), desc = 'COM-show key bindings'),
    # Group
    Key([alt], "Tab", lazy.screen.next_group(), desc="WOR-Move to next Workspace"),
    Key([mod, "control"], 'Left', lazy.screen.prev_group(), desc = 
    'WOR-Goto Left Workspace'),
    Key([mod, "control"], 'Right', lazy.screen.next_group(), desc = 
    'WOR-Goto Right Workspace'),
]

groups = [Group("1", label = "", layout = "monadtall", spawn = "geany"),
          Group("2", label = "爵", layout = "monadtall", spawn = "firefox"),
          Group("3", label = "", layout = "monadtall", spawn = "alacritty"),
          Group("4", label = "", layout = "monadtall", spawn = "pcmanfm"),
          Group("5", label = "", layout = "monadtall"),
          Group("6", label = "", layout = "monadtall"),]
          # ""

# groups = [Group(i) for i in "12345"]


for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="WOR-Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="WOR-Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.MonadTall(),
    layout.Max(),
    layout.MonadWide(),
    layout.Floating(),
    layout.TreeTab(),
    # layout.Spiral(),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    # font="Sans",
    font="Ubuntu Nerd Font",
    # font="SourceCodePro",
    # font="SauceCodePro",
    # font="LiberationMono Nerd Font",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [   
                widget.Image(
                       filename = "~/.config/qtile/icons/python.png",
                       scale = False,
                       mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal)}
                       ),
                widget.Sep(),
                widget.CurrentLayout(),
                widget.GroupBox(
                    #block_highlight_text_color=red, 
                    highlight_method='block', disable_drag = True, fmt = 
                    ' {} ',inactive=green, fontsize=20),
                widget.Sep(),
                widget.WindowTabs(),
                widget.Volume(),
                widget.Sep(),
                widget.Prompt(),
                # widget.Sep(),
                # widget.WindowName(),
                widget.Net(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("gpf config", name="gpf default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.CheckUpdates(distro = 'Arch', 
                                    colour_have_updates = red, 
                                    colour_no_updates = green, 
                                    no_update_string = "No Updates",
                                    update_interval = 60,
                                    mouse_callbacks = {'Button1': 
                                        lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')}),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Sep(),
                # widget.Battery(),
                widget.BatteryIcon(),
                widget.Sep(),
                widget.Clock(format="%Y-%m-%d %a %H:%M"),
                widget.QuickExit(),
            ],
            28,
            background=[middle_gray, black],
            border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["#4a86e8", "000000", "#4a86e8", "000000"]  # Borders are cornflower blue
            # border_color=["#c9daf8", "000000", "#c9daf8", "000000"]  # Borders are light cornflower blue
            border_color=[light_red_berry, black, light_red_berry, black]  # Borders are  light red berry 2
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="Yad"),  
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
category_prev=""
with open(home + "/.config/qtile/chiavi.txt", "w",encoding = 'utf-8') as f:
    for key in keys:
        len_filler = 80 - (len(key.desc)+len(str(key.modifiers))+len(key.key))
        if key.desc[0:3] != category_prev:
            f.write(f"{key.desc[0:3].center(83)}\n")
            category_prev=key.desc[0:3]
        f.write(f"{key.modifiers} + {key.key}{'.'*len_filler}{key.desc}\n")
# for key in keys:
    # print(key)
    
