# 🎒 behr_clothingcommands

A lightweight and modular clothing/prop toggle script for FiveM, built for freemode peds. Easily remove or reapply items like shirts, hats, glasses, backpacks, and more — all with simple commands.

---

## ✨ Features

- 🔀 Toggle shirts, pants, jackets, shoes, backpacks, etc.
- 🧢 Supports hat, glasses, earrings, watches, and bracelets
- 💾 Remembers and restores original items
- 🎞️ Built-in clothing animation on toggle
- 🧰 Configurable toggle slots & commands
- 📤 Export functions for modular script use
- ⚙️ Developer debug logging and version checking
- 🧱 Built for modular expansion

---

## 📦 Installation

1. **Drag and drop** the folder into your `resources/` directory  
2. Add this line to your `server.cfg`:

```cfg
ensure behr_clothingcommands
````

3. Open `config.lua` to configure the available commands and slot settings.

---

## ⚙️ Configuration

All item slots are customizable in `config.lua`.

```lua
Config.ShirtCommandEnabled = true
Config.ShirtCommand = "shirt"
Config.NoShirt = 15 -- Drawable index for "no shirt"
```

🧠 Tip: Use a clothing menu to preview drawables for your ped before setting `NoX` values.

---

## 🛠️ Commands

Here are the default toggle commands (can be changed in config):

| Command   | Item Slot          |
| --------- | ------------------ |
| /hat      | Hat                |
| /glasses  | Glasses            |
| /ear      | Earrings           |
| /watch    | Watch              |
| /bracelet | Bracelet           |
| /hair     | Hair               |
| /decal    | Decals/Tattoos     |
| /chain    | Chain              |
| /mask     | Mask               |
| /vest     | Vest               |
| /shoes    | Shoes              |
| /shirt    | Shirt (undershirt) |
| /arms     | Arms (torso)       |
| /jacket   | Jacket             |
| /pants    | Pants              |
| /backpack | Backpack           |

✅ Only works for freemode male/female peds (`mp_m_freemode_01`, `mp_f_freemode_01`)

---

## 📤 Exports

Use these in other scripts to toggle clothing directly:

```lua
exports['behr_clothingcommands']:toggleShirt()
exports['behr_clothingcommands']:toggleJacket()
exports['behr_clothingcommands']:togglePants()
exports['behr_clothingcommands']:toggleShoes()
exports['behr_clothingcommands']:toggleHat()
exports['behr_clothingcommands']:toggleGlasses()
exports['behr_clothingcommands']:toggleBackpack()
exports['behr_clothingcommands']:toggleWatch()
exports['behr_clothingcommands']:toggleBracelet()
exports['behr_clothingcommands']:toggleChain()
exports['behr_clothingcommands']:toggleMask()
exports['behr_clothingcommands']:toggleHair()
exports['behr_clothingcommands']:toggleArms()
exports['behr_clothingcommands']:toggleVest()
exports['behr_clothingcommands']:toggleDecal()
exports['behr_clothingcommands']:toggleEar()
```

---

## 🔧 Developer Settings

Inside `config.lua`:

```lua
Config.Debug = true               -- Enable debug logs in F8
Config.VersionCheckEnabled = true -- Automatically checks for the latest version on GitHub
```

When `VersionCheckEnabled` is set to `true`, the script will print a message in your server console if a new version is available.

---

## 📌 Notes

* Supports **toggle + restore** logic per item
* Includes animation when clothing is changed
* Meant for use with RP, radial menus, keybinds, and more
* Fully standalone – works with any framework
* Future updates will expand UI, outfit presets, and integration support

---

## 🙌 Credits

**Script by:** [Behr Development](https://github.com/BehrTheDon)
**Animation:** Rockstar default assets
**Framework:** Standalone – compatible with most servers

---

## 📅 Roadmap

✅ Base version complete                            ✅
📤 Add exports for external script calls            ✅
🚧 Refactor repeated logic into shared handlers
🖥️ Optional UI menu (F9 or radial)
🧪 Preset outfits & prop sync (future)

---

### 💬 For feedback, bugs, or contributions — open an issue, fork the repo, or join our [Discord](https://discord.gg/wA7W5dUMG6)!