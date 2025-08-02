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
Config.NoShirtMale = 15 -- Drawable Male index for "no shirt"
Config.NoShirtFemale = 15 -- Drawable Female index for "no shirt"
```

| Note: top is a composite command for shirt, jacket, and arms. Disabling one of the others doesn’t affect /top.

🧠 Tip: Use a clothing menu to preview drawables for your ped before setting `NoX` values.

---

## 🛠️ Commands

Here are the default toggle commands (can be changed in config):

| Command   | Item Slot                                     |
| --------- | ------------------                            |
| /top      | Removes Jacket, Shirt, and sets Arms (Body)   |
| /hat      | Hat                                           |
| /glasses  | Glasses                                       |
| /ear      | Earrings                                      |
| /watch    | Watch                                         |
| /bracelet | Bracelet                                      |
| /hair     | Hair                                          |
| /decal    | Decals/Tattoos                                |
| /chain    | Chain                                         |
| /mask     | Mask                                          |
| /vest     | Vest                                          |
| /shoes    | Shoes                                         |
| /shirt    | Shirt (undershirt)                            |
| /arms     | Arms (torso)                                  |
| /jacket   | Jacket                                        |
| /pants    | Pants                                         |
| /backpack | Backpack                                      |

✅ Only works for freemode male/female peds (`mp_m_freemode_01`, `mp_f_freemode_01`)

---

## 📤 Exports

Use these in other scripts to toggle clothing directly:

```lua
-- Prop Exports
exports['behr_clothingcommands']:toggleProp(propIndex, slotName)
```

propIndex        = Index for Prop item, Check the CFX docs [SetPedPropIndex](https://docs.fivem.net/natives/?_0x93376B65A266EB5F)  
slotName         = Table name for this item, Always Use Example option

```lua
-- Examples
exports['behr_clothingcommands']:toggleProp(0, "hat")       -- Example for toggling a hat
exports['behr_clothingcommands']:toggleProp(1, "glasses")   -- Example for toggling glasses
exports['behr_clothingcommands']:toggleProp(2, "ear")       -- Example for toggling earrings
exports['behr_clothingcommands']:toggleProp(6, "watch")     -- Example for toggling a watch
exports['behr_clothingcommands']:toggleProp(7, "bracelet")  -- Example for toggling a bracelet
```

```lua
-- Clothing Exports
exports['behr_clothingcommands']:toggleTop()

exports['behr_clothingcommands']:toggleClothes(clothingIndex, slotName, configKeyMale, configKeyFemale, skipAnim)
```

clothingIndex    = Index for Clothing item, Check the CFX docs [SetPedComponentVariation](https://docs.fivem.net/natives/?_0xD4F7B05C)  
slotName         = Table name for this item, Always Use Example option  
configKeyMale    = NoXMale Config for this item, Always Use Example option  
configKeyFemale  = NoXFemale Config for this item, Always Use Example option  
skipAnim         = Animation Skipping, True = Skip Animation, False = Don't Skip Animation  

```lua
-- Examples
exports['behr_clothingcommands']:toggleClothes(1, "mask", "NoMaskMale", "NoMaskFemale", false)               -- Example for toggling a mask
exports['behr_clothingcommands']:toggleClothes(2, "hair", "NoHairMale", "NoHairFemale", false)               -- Example for toggling hair 
exports['behr_clothingcommands']:toggleClothes(3, "arms", "FullBodyMale", "FullBodyFemale", false)           -- Example for toggling your body
exports['behr_clothingcommands']:toggleClothes(4, "legs", "NoLegsMale", "NoLegsFemale", false)               -- Example for toggling pants
exports['behr_clothingcommands']:toggleClothes(5, "backpack", "NoBackpackMale", "NoBackpackFemale", false)   -- Example for toggling a backpack
exports['behr_clothingcommands']:toggleClothes(6, "shoes", "NoShoesMale", "NoShoesFemale", false)            -- Example for toggling shoes
exports['behr_clothingcommands']:toggleClothes(7, "chain", "NoChainMale", "NoChainFemale", false)            -- Example for toggling a chain/necklace
exports['behr_clothingcommands']:toggleClothes(8, "shirt", "NoShirtMale", "NoShirtFemale", false)            -- Example for toggling a shirt
exports['behr_clothingcommands']:toggleClothes(9, "vest", "NoVestMale", "NoVestFemale", false)               -- Example for toggling a vest
exports['behr_clothingcommands']:toggleClothes(10, "decal", "NoDecalMale", "NoDecalFemale", false)           -- Example for toggling decals
exports['behr_clothingcommands']:toggleClothes(11, "jacket", "NoJacketMale", "NoJacketFemale", false)        -- Example for toggling a jacket
```

---

## 🔧 Developer Settings

Inside `config.lua`:

```lua
Config.Debug = true               -- Enable debug logs in F8
Config.VersionCheckEnabled = true -- Automatically checks for the latest version on GitHub
```

ResMon Is only active in Debug mode! Make Sure `Config.Debug = true` to see this scripts Resource Monitor  
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

## 📚 Documentation

Full setup instructions, configuration options, and usage examples are available on our GitBook:

👉 [**behr\_clothingcommands Documentation**](https://behr-development.gitbook.io/behr-development-docs/scripts/clothingcommands)

---

### 💬 For feedback, bugs, or contributions — open an issue, fork the repo, or join our [Discord](https://discord.gg/wA7W5dUMG6)!