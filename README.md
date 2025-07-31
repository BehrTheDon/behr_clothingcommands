# 🎒 behr_clothingcommands

A lightweight and modular clothing/prop toggle script for FiveM, built for freemode peds. Easily remove or reapply items like shirts, hats, glasses, backpacks, and more — all with simple commands.

---

## ✨ Features

- 🔀 Toggle shirts, pants, jackets, shoes, backpacks, etc.
- 🧢 Supports hat, glasses, earrings, watches, and bracelets
- 💾 Remembers and restores original items
- 🎞️ Built-in clothing animation on toggle
- 🧰 Configurable toggle slots & commands
- ⚙️ Developer debug logging
- 🧱 Built for modular expansion

---

## 📦 Installation

1. **Drag and drop** the folder into your `resources/` directory  
2. Add this line to your `server.cfg`:
```

ensure behr\_clothingcommands

````
3. Open `config.lua` to configure the available commands and slot settings.

---

## ⚙️ Configuration

All item slots are customizable in `config.lua`.

```lua
Config.ShirtCommandEnabled = true
Config.ShirtCommand = "shirt"
Config.NoShirt = 15 -- Drawable index for "no shirt"
````

🧠 Tip: Use `/clothing` or a clothing menu to preview drawables for your ped before setting `NoX` values.

---

## 🛠️ Commands

Here are the default toggle commands (can be changed in config):

| Command   | Item Slot         |
| --------- | ----------------- |
| /hat      | Hat               |
| /glasses  | Glasses           |
| /ear      | Earrings          |
| /watch    | Watch             |
| /bracelet | Bracelet          |
| /hair     | Hair              |
| /decal    | Decals/Tattoos    |
| /chain    | Chain             |
| /mask     | Mask              |
| /vest     | Vest              |
| /shoes    | Shoes             |
| /shirt    | Shirt             |
| /arms     | Arms (undershirt) |
| /jacket   | Jacket (torso)    |
| /pants    | Pants             |
| /backpack | Backpack          |

✅ Only works for freemode male/female peds (`mp_m_freemode_01`, `mp_f_freemode_01`)

---

## 🔧 Developer Settings

```lua
Config.Debug = true
```

Enable this to log detailed messages in F8 for troubleshooting.

---

## 📌 Notes

* Supports **toggle + restore** logic per item
* Includes animation when clothing is changed
* Meant for use with RP, radial menus, keybinds, and more
* Future plans include a UI menu and export support (see roadmap)

---

## 🙌 Credits

**Script by:** [Behr Development](https://discord.gg/wA7W5dUMG6)
**Animation:** Rockstar default assets
**Framework:** Standalone – compatible with most servers

---

## 📅 Roadmap

✅ Base version complete
🚧 Refactor repeated logic into shared handlers
🖥️ Optional UI menu (F9 or radial)
📤 Add exports for external script calls
🧪 Preset outfits & prop sync (future)

---

### 💬 For feedback, bugs, or contributions — open an issue or fork the repo or join our discord!!