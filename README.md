## Purpose

The purpose of thos script is to prevent people from taking specified police weapons off of a police officer and then use them. It does this by checking the job of the person firing a weapon and reducing the quality of the weapon to 0 immediately, if it is a police weapon.

## Requirements
QBCore + FiveM

## Config

```
Config.PoliceWeapons = {
    `weapon_combatpdw`,
    `weapon_carbinerifle`
}
```

You need to insert the hash reference to each police weapon in the config. You can find the list of hashes on https://wiki.rage.mp/index.php?title=Weapons