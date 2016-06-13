# Astro Party

An implementation of the popular multi-player game [Astro Party](http://rustymoyher.com/astroparty/), written using Processing.

## Gameplay

Like the original version, there are only two keys used to control a ship.

After getting hit once, the player's ship will be destroyed, leaving behind the pilot in a vulnerable state. The pilot cannot shoot bullets, and can only move around. While pilot, the player is no longer automatically propelled forward, but only moves when pressing the key used to shoot bullets.

In order to secure the win, the opposing player must kill the pilot by either shooting or ramming into them. After 5 seconds, if the pilot is not killed, they regain their ship and can operate normally.

The game is played until any one player wins 5 games. If one player falls behind another by three or more points, the losing player gains a shield, allowing them to get hit one more time before their ship is destroyed.


#Running Code!
Run the code below, or travel to the AstroParty folder and run the AstroParty
processing file!
```
cd AstroParty/
processing AstroParty.pde
```

# Controls

For the first player, use `a` to fire a bullet, and `s` to rotate your ship.
In pilot mode, use `a` to propell yourself and `s` to rotate your pilot. <br>
For the second player, use `k` to fire a bullet, and `l` to rotate your ship.
In pilot mode, use `k` to propell yourself and `l` to rotate your pilot. <br>




#Authors - SEJ-Fault

[James Wang](https://github.com/james9909/) && [Elias Milborn](https://github.com/emilborn/) && [Shantanu Jha](https://github.com/Phionx/)

