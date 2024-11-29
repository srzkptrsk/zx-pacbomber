## Pacbomber

Arcade game - combination of pacman and bomberman for ZX Spectrum 48K, suitable for beginners to experiment with making games for ZX Spectrum.

---

### How to play?

Pacman principle, collect crystals and avoid monsters that will just eat you. But there is a possibility to trap them and blow them up with a bomb.

The game consists (so far) of three levels, on the third level there is a new enemy - Skull. He waits and does not move until you get closer to him, then he will start chasing you, bombs do not affect him, so you will have to think how to distract him from going to the next level.

---

The game is written in [ZX Basic](https://github.com/boriel/zxbasic), the graphics for the first screen are drawn in [ZX-Paintbrush](https://sourcesolutions.itch.io/zx-paintbrush), the graphics in the game with the help of http://www.amelyn.com/speccy_character_builder/

![title.png](resources/title.png)
![controls.png](resources/controls.png)
![firstlevel.png](resources/firstlevel.png)

To create a level, install the [Tiled](https://www.mapeditor.org) level editor Once you have created your first level, export it to CSV and then use the Python script from the tools/csv2bas.py directory.

![tiled.jpg](resources/tiled.jpg)

---

### What are the shortcomings and wishes

- 5 clock delay is used to organize the movement of objects, it makes sense to use a counter;
- bomb explosion may not hit the enemy Ghoul - it makes sense to add a two-dimensional array that fills and through it display blocks that have an explosion and through it to check for collision.